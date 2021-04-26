<?php 
	include 'includes/session.php';
	include 'includes/logger.php';	
	include 'includes/functions.php';
	include 'includes/functions_mail.php';
	include_once 'includes/class_approver.php';
	require_once 'classes/request_task_status.php';
	include_once 'classes/request.php';
	require_once 'classes/request_approval.php';
	require_once 'classes/request_task_approver.php';
	
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
	$current_user = $user['user_id'];

	// remarks is removed for confirmation only task
	$remarks = '';
	if (isset($_POST['remarks'])) {
		$remarks = $_POST['remarks'];
	}

	$request = new request($request_id);
	
	$task = new task($task_id);
	$result = $request->processRequestApproval($task, $approval_state, 
				$current_user, $remarks);

	if ($result)  $_SESSION['success'] .= ' , Request has been successfully updated';
	else $_SESSION['error'] = "Request approval failed.";

	$paction = 'INSERT';
	$send_mail = "NO";

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
//	header('location: ./loading_send_mail.php');
} else {
	header('location: ./?pid=approval_rev&track=' . $pageid . '');
}
