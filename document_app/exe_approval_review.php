<?php 
	include 'includes/session.php';
	include 'includes/logger.php';	
	include 'includes/functions.php';
	include 'includes/functions_mail.php';
	include_once 'includes/class_approver.php';
	include 'classes/request_task_status.php';
	include_once 'classes/request.php';
	include 'classes/request_approval.php';
	include 'classes/request_task_approver.php';
	
	$pageid = (isset($_GET['track']))? $_GET['track'] : '';
	$paction = '';
	$send_mail = 'NO';

 /**
  * execute add item  
  */ 
if (isset($_POST['user_apex'])) {
	
	$request_id = $_POST['rqid'];
	$workflow_id = $_POST['wflow_id'];
	$task_id = $_POST['step_id'];
	$approval_state = $_POST['sel_actiond'];

	// remarks is removed for confirmation only task
	$remarks = '';
	if (isset($_POST['remarks'])) {
		$remarks = $_POST['remarks'];
	}

	$unixtime = time();
	$current_user = $user['user_id'];

	$request = new request($request_id);
	$requestor_id = $request->getRequestor_id();

	// get the number of task approved in a request
	$countstat = $request->getApprovedRequestCount();
	$requestor_id = $request->Requestor()->getUser_id();
	$setAchor = $request->getAnchoredTask();

	$workflow = new Workflow($workflow_id);
	$seq_no = $workflow->getTaskSequence($task_id);

	/**
	 * Get request task object.
	 */
	$task_status = RequestTaskStatus::getRequestTask($workflow_id, 
				   $task_id, $request_id);

	$result = false;

	/**
	 * Insert the request transaction in the request task status.
	 */
	if ($task_status == null){
		$result = RequestTaskStatus::insertRequestToTaskStatus($workflow_id,
					$task_id, $request_id,  $seq_no, $current_user);

		// again get the object
		$task_status = RequestTaskStatus::getRequestTask($workflow_id, 
					$task_id, $request_id);
 
	}
	else {
		/**
		 * Just update the request task status.
		 */
		$task_status->setRequest_status($approval_state);
		$task_status->setApp_user($current_user);
		$task_status->setUnixdate($unixtime);

		$result = $task_status->updateRequestTaskStatus();
	}

	/**
	* Get request task approver object.
	*/
	$task_approver = RequestTaskApprover::getTaskApprover($workflow_id, $task_id, 
					$request_id, $current_user);

	if ($task_approver == null){
		
		$result = RequestTaskApprover::insertRequestTaskApprover($unixtime,
					$request_id, $workflow_id, $task_id, $seq_no, $current_user, 
					$approval_state, $remarks);
		
					// again get the object 
		$task_approver = RequestTaskApprover::getTaskApprover($workflow_id, $task_id, 
					$request_id, $current_user);

	}
	else {
		$task_approver->setUnixdate($unixtime);
		$task_approver->setSequence_no($seq_no);
		$task_approver->setApprover_id($current_user);
		$task_approver->setApproval_status($approval_state);
		$task_approver->setRemarks($remarks);

		$task_approver->updateRequestTaskApprover();
	}

	/**
	 * Check if the requestor is an approver of this task.
	 * If approver then insert to the task approver table and to the 
	 * request approval table only if the action is not Disapproved.
	 * This is to skip the requestor from approving task.
	 */
    if (($approval_state == 'Approved' || $approval_state == 'Confirmed')  && $current_user != $requestor_id) {
        if ($task_status->isRequestorNeedToApproved($requestor_id)) {

            $requestor_task_approver = RequestTaskApprover::getTaskApprover(
                $workflow_id,
                $task_id,
                $request_id,
                $requestor_id
            );

            if ($requestor_task_approver == null) {
				// insert to task approver table
                RequestTaskApprover::insertRequestTaskApprover(
                    $unixtime,
                    $request_id,
                    $workflow_id,
                    $task_id,
                    $seq_no,
                    $requestor_id,
                    $approval_state,
                    $remarks
                );

                // insert to request approval table
                RequestApproval::insertRequestApproval(
                    $request_id,
                    $workflow_id,
                    $task_id,
                    $approval_state,
                    $requestor_id,
                    $remarks,
                    $unixtime
                );
            }
			else {
				// this is use during re-submission
				$requestor_task_approver->setUnixdate($unixtime);
				$requestor_task_approver->setApprover_id($requestor_id);
				$requestor_task_approver->setApproval_status($approval_state);
				$requestor_task_approver->setRemarks($remarks);
		
				$requestor_task_approver->updateRequestTaskApprover();
			}
        }
    }

	/**
	 * Insert to the approval history table.
	 */
	$result = RequestApproval::insertRequestApproval($request_id, $workflow_id,
						$task_id, $approval_state, $current_user,	$remarks, $unixtime);

    if ($result) {
        $_SESSION['success'] = $request_id . ' request has been ' . $approval_state;

		// total approver in a task of a request
		//$approver_total = $request->getRequestTaskApproversCount($task_id);

		$task = new Task($task_id);
        $required_number_approval = $task->getNeeded_approval();

		// get approved count in a task for a request
		// ex. Minda --> approved, Shiela --> not yet
		// total task approver = 2     approved_count = 1
       // $approved_count = $request->getRequestTaskApprovalCount($task_id);
        $total_task = $workflow->getTaskCount();

        // no. of task approved in a request
        $countstat = $request->getApprovedRequestCount(); // + 1;

		$isTaskComplete = $request->isTaskApprovalComplete($task_id);
		$isRequestComplete = $request->isRequestApprovalComplete();
        
		// completed
        if ($isRequestComplete &&   $isTaskComplete) {
            $status = 'Completed';
			// In Progress
        } elseif (($approval_state == 'Approved' || $approval_state == 'Confirmed')
            and (!$isTaskComplete)) {
            $status = 'InProgress';

			// Approved or Confirm
        } elseif (($approval_state == 'Approved' || $approval_state == 'Confirmed')
        and ($isTaskComplete)) {
            $status = $approval_state;
        }

		else {
            $status = $approval_state;
        }

        $request->setStatus($status);
        $result = $request->updateRequest();

        if ($result) {
            $_SESSION['success'] .= ' , Request has been successfully updated';
            $send_mail = 'YES';
        } else {
            $_SESSION['error'] = $conn->error;
        }

	} else	{
		$_SESSION['error'] = 'Request approval fail';
	}

	$paction = 'INSERT';

}

//execute edit item=======================================
else if (isset($_POST['edit'])) {
	$id = $_POST['id'];
	$docname = $_POST['edit_docname'];
	$docdesp = $_POST['edit_docdesp'];
	$workflow = $_POST['edit_workflow'];

	$sql = "UPDATE fs_request_main SET rq_name = '$docname', rq_description = '$docdesp', rq_workflow = '$workflow' WHERE id = '$id'";
	if ($conn->query($sql)) {
		$_SESSION['success'] = 'Request has been successfully updated';
	} else {
		$_SESSION['error'] = $conn->error;
	}
	$paction = 'UPDATE';
}
//execute UPDATE file attachment =============================
else if (isset($_POST['upload'])) {
	$file_id = $_POST['refile_id'];
	$filename = $_FILES['reupload']['name'];
	$unixtime = time();
	$current_user = $user['user_id'];

	if (!empty($filename)) {
		move_uploaded_file($_FILES['reupload']['tmp_name'], './file_dump/' . $filename);
	}

	$sql = "SELECT count(id) as recno FROM fs_request_attachment WHERE file_id = '$file_id' ";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();


	if ($row['recno'] == 0) {
		$sql = "INSERT INTO fs_request_attachment (file_id, file_name, file_uploader, file_unix) 
			VALUES ('$file_id', '$filename', '$current_user', '$unixtime')";
	} else {
		$sql = "UPDATE fs_request_attachment SET file_name = '$filename', file_uploader='$current_user', file_unix='$unixtime'  
			WHERE file_id = '$file_id'";
	}

	if ($conn->query($sql)) {
		$_SESSION['success'] = 'File has been successfully updated';
	} else {
		$_SESSION['error'] = $conn->error;
	}
	$paction = 'UPDATE';
}
//execute CANCEL item ====================================
else if (isset($_POST['cancel'])) {
	$id = $_POST['id'];
	$sql = "UPDATE FROM fs_request_main SET rq_status='Cancelled' WHERE id = '$id'";
	if ($conn->query($sql)) {
		$_SESSION['success'] = 'Request has been successfully cancelled';
	} else {
		$_SESSION['error'] = $conn->error;
	}
	$paction = 'UPDATE';
}
//execute DELETE item ====================================
else if (isset($_POST['delete'])) {
	$id = $_POST['id'];
	$sql = "DELETE FROM fs_request_main WHERE id = '$id'";
	if ($conn->query($sql)) {
		$_SESSION['success'] = 'Candidate has been successfully deleted';
	} else {
		$_SESSION['error'] = $conn->error;
	}
	$paction = 'DELETE';
}
//execute get row item====================================
else if (isset($_GET['attmtbl']) and isset($_POST['id'])) {
	$id = $_POST['id'];
	$sql = "SELECT * FROM fs_request_attachment  WHERE file_id = '$id'";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();

	echo json_encode($row);
	exit();
}
//execute get row item====================================
else if (isset($_GET['showtable']) and isset($_POST['reqid'])) {
	$rid = $_POST['reqid'];
	$wid = $_POST['wlid'];
	$sid = $_POST['stpid'];
	$sql = "SELECT rm.rq_id, wf.form_id, wf.form_name, fss.work_id, fss.work_name
		FROM fs_request_main rm 
		LEFT JOIN fs_workflow wf ON wf.form_id=rm.rq_workflow
		LEFT JOIN fs_workstpes fss ON fss.work_id=wf.form_steps_id
		WHERE rm.rq_id = '$rid' and wf.form_id='$wid' and fss.work_id='$sid'";

	/*
		SELECT rm.rq_id, wf.form_id, fss.work_id
		FROM fs_request_main rm 
		LEFT JOIN fs_workflow wf ON wf.form_id=rm.rq_workflow
		LEFT JOIN fs_workstpes fss ON fss.work_id=wf.form_steps_id
		WHERE rm.rq_id = 'FCCMPC-00001' and wf.form_id='6UCG5FP1VX' and fss.work_id='ckvWzJrGMRoTLOK'
		
		SELECT fsw.*, fss.work_name FROM fs_workflow fsw LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id WHERE fsw.form_id=
*/

	$query = $conn->query($sql);
	$row = $query->fetch_assoc();

	echo json_encode($row);
	exit();
} else {
	$_SESSION['error'] = 'Fill up add form first';
}

$pname = 'fs_request_main';
$puser = $user['user_id'];
$pattrib = json_encode($_POST);
attrib_logger($pname, $paction, $puser, $pattrib);

if ($send_mail == "YES") {
	$_SESSION['request_no'] = $request_id;
	$_SESSION['next_page'] = './?pid=approval_rev&track=' . $pageid . '';
	header('location: ./loading_send_mail.php');
} else {
	header('location: ./?pid=approval_rev&track=' . $pageid . '');
}
