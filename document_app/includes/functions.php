<?php 



function gererate_serial($charNo = 15){
		$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$genCode = substr(str_shuffle($set), 0, $charNo);
		return $genCode;
}


function gererate_id($charNo = 15){
		$set = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$genCode = substr(str_shuffle($set), 0, $charNo);
		return $genCode;
}


		//SELECT `id`, `rq_work_id`, `rq_step_id`, `rq_no`, `seq_no`, `user_approvers`, `rq_status`, `unix_date`, `app_user` FROM `fs_request_task_status`
		//SELECT `id`, `user_id`, `password`, `firstname`, `middlename`, `lastname`, `user_email`, `photo`, `access_level`, `department`, `last_login`, `created_on` FROM `fs_users` WHERE 1
		//SELECT `id`, `ug_id`, `ug_name`, `ug_description`, `ug_members` FROM `fs_user_group`
		//SELECT `id`, `rq_id`, `rq_name`, `rq_description`, `rq_workflow`, `rq_requestor`, `rq_status`, `rq_unix`, `rq_created` FROM `fs_request_main` WHERE 1
		//SELECT `id`, `request_id`, `flow_id`, `step_id`, `user_apex`, `user_approver`, `user_remarks`, `date_approved`, `unix` FROM `fs_request_approval` WHERE 1

//get approved /disapprove step
function create_revision_no($req_name){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(frm.id) as idn
		FROM fs_request_main frm 
		WHERE frm.rq_name = '$req_name'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		$idNo = $row['idn'] + 1; 
		return $idNo;
		$conn->close();
		//return $genCode;
}


//get approved /disapprove step from fs_request_task_status
function get_appv_members($req_id, $flow_id, $stp_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT rta.*,ug.ug_members,rta.user_approvers, group_concat(ug.ug_members order by ug.ug_members SEPARATOR ',') AS ugname
		FROM fs_request_task_status  rta
		LEFT JOIN fs_user_group ug ON find_in_set(ug.ug_id,rta.user_approvers) 
		LEFT JOIN fs_users us ON find_in_set(us.user_id,ug.ug_members)  
		WHERE rta.rq_no = '$req_id' and rta.rq_work_id = '$flow_id' 
		and rta.rq_step_id = '$stp_id'
		ORDER BY rta.id DESC LIMIT 1";

		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}

//get request information
function get_request_info($req_id){
	$conn = $GLOBALS['conn'];
	$sql = "SELECT * FROM fs_request_main
	WHERE rq_id = '$req_id' 
	ORDER BY id DESC LIMIT 1";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();
	return json_encode($row);
	$conn->close();
	//return $genCode;
}


//get remarks per step
function get_app_log_remarks($req_id, $stp_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT user_remarks
		FROM fs_request_approval frm 
		WHERE request_id = '$req_id' and step_id='$stp_id'
		ORDER BY id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		$remarks = (isset($row['user_remarks'])) ? $row['user_remarks'] : ""; 
		return $remarks;
		$conn->close();
		//return $genCode;
}

//get step sequence number
function get_step_seq_no($flow_id, $step_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT wf.form_sequence as seq
		FROM fs_workflow wf 
		LEFT JOIN fs_workstpes fss ON wf.form_steps_id=fss.work_id
		WHERE wf.form_id = '$flow_id' and fss.work_id ='$step_id' LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		$seqidNo = (isset($row['seq'])) ? $row['seq'] : 0; 
		return $seqidNo;
		$conn->close();
		//return $genCode;
}

//fs_request_task_approver (workflow_id, steps_id, rq_no, approval_status, unixdate, approver_id, seq_no, approval_remarks)
//get number of approved users from fs_request_task_status
function get_appv_user_event($req_id,$wflow_id,$stp_id){
		$conn = $GLOBALS['conn'];
		$ug_tbl_app = json_decode(get_appv_members($req_id, $wflow_id, $stp_id));
		$userTaskapprv = (isset($ug_tbl_app->ug_members)) ? $ug_tbl_app->ug_members : 'xxx';
		$wrapped='"'.str_replace(',','","',$userTaskapprv).'"';	

		$statuses = array("Approved", "Confirmed");
		$status = '"' . implode('","', $statuses) . '"';
	
//
		$sql = "SELECT count(id) as cid FROM fs_request_task_approver WHERE 
		 rq_no = '$req_id' AND steps_id = '$stp_id' AND approver_id IN($wrapped)";
		//echo $sql;
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		$countFilter = (isset($row['cid'])) ? $row['cid'] : 0;
		return $countFilter; //json_encode($row);
		$conn->close();
		//return $genCode;
}


//get approved /disapprove step from fs_request_task_status
function get_appv_stat_event($req_id, $flow_id, $stp_id){

	$conn = $GLOBALS['conn'];
		$sql = "SELECT rta.*,us.firstname, us.lastname, ra.user_remarks, rta.rq_status 
		as reqstat, task.work_name
		FROM fs_request_task_status  rta
		LEFT JOIN fs_request_approval ra ON ra.unix = rta.unix_date and ra.step_id = rta.rq_step_id
		LEFT JOIN fs_users us ON us.user_id = rta.app_user
		LEFT JOIN fs_workstpes task ON task.work_id = rta.rq_step_id
		WHERE rta.rq_no = '$req_id' and rta.rq_work_id = '$flow_id' and rta.rq_step_id = '$stp_id'
		ORDER BY rta.id DESC LIMIT 1";
		//echo $sql;
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}

//get approved /disapprove step from fs_request_approval
function get_appv_stat($req_id, $flow_id, $stp_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT ra.*,us.firstname, us.lastname  
		FROM fs_request_approval  ra
		LEFT JOIN fs_users us ON us.user_id=ra.user_approver
		WHERE ra.request_id = '$req_id' and ra.flow_id = '$flow_id' and ra.step_id = '$stp_id'
		ORDER BY ra.id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}

//get user group list
function get_usergroup_record($ug_id){
		$idNo = '';
		$indx = 0;
		$conn = $GLOBALS['conn'];
		$sql = "SELECT ug_name as idn
		FROM fs_user_group  
		WHERE find_in_set(ug_id,'$ug_id') 
		ORDER BY id ASC";
		$query = $conn->query($sql);
		while($row = $query->fetch_assoc()){
			
			if($indx != 0){
			$idNo .= ', ';
			}
			$idNo .= $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
			
			$indx++;
		}		
		
		return $idNo;
		$conn->close();
		//return $genCode;
}

//get user list
function get_user_record($step_id){
		$idNo = '';
		$indx = 0;
		$conn = $GLOBALS['conn'];
		$sql = "SELECT ug_name as idn
		FROM fs_users  
		WHERE find_in_set(ug_id,'$step_id') 
		ORDER BY id ASC";
		$query = $conn->query($sql);
		while($row = $query->fetch_assoc()){
			
			if($indx != 0){
			$idNo .= ', ';
			}
			$idNo .= $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
			
			$indx++;
		}		
		
		return $idNo;
		$conn->close();
		//return $genCode;
}

//count last step from workflow 
function last_record_step($step_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as idn
		FROM fs_workflow 
		WHERE form_steps_id='$step_id' 
		ORDER BY id DESC LIMIT 10";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$idNo = $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
		return $idNo;
		$conn->close();
		//return $genCode;
}

//count last workflow from main request
function last_record_workflow($flow_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as idn
		FROM fs_request_main 
		WHERE rq_workflow='$flow_id' 
		ORDER BY id DESC LIMIT 10";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$idNo = $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
		return $idNo;
		$conn->close();
		//return $genCode;
}


//count last workflow from main request
function last_record_dept($dept_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as idn
		FROM fs_users 
		WHERE id='$dept_id' 
		ORDER BY id DESC LIMIT 10";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$idNo = $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
		return $idNo;
		$conn->close();
		//return $genCode;
}


//get minimum approval needed from task
function minimum_approval_needed($task_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT needed_approval
		FROM fs_workstpes 
		WHERE work_id='$task_id' 
		ORDER BY id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$noa = $row['needed_approval']; //(isset($row['id'])) ? 0 : $row['id'];
		return $noa;
		$conn->close();
		//return $genCode;
}

//count last workflow from main request
function last_record_ugroup($group_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as idn
		FROM fs_workstpes 
		WHERE approver='$group_id' 
		ORDER BY id DESC LIMIT 10";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$idNo = $row['idn']; //(isset($row['id'])) ? 0 : $row['id'];
		return $idNo;
		$conn->close();
		//return $genCode;
}


//check if disapproved
function get_disapprove_stat($req_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT ra.*,us.firstname, us.lastname  
		FROM fs_request_approval  ra
		LEFT JOIN fs_users us ON us.user_id=ra.user_approver
		WHERE ra.request_id = '$req_id' and ra.user_apex = 'Disapproved'
		ORDER BY ra.id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}



//get approved /disapprove step
function get_series_stat($req_id, $flow_id, $stp_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT frm.* 
		FROM fs_request_main frm 
		LEFT JOIN fs_request_approval  ra ON ra.request_id = frm.rq_id and ra.flow_id = frm.rq_workflow 
		WHERE ra.request_id = '$req_id' and ra.flow_id = '$flow_id' and ra.step_id = '$stp_id'
		ORDER BY ra.id";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}


function revert_task($w_id, $s_id, $r_id, $status, $user){
		$conn = $GLOBALS['conn'];
		$unixtime = time();
		$getAnchor = json_decode(get_flow_step_anchor($r_id));		
		$setAchor = (isset($getAnchor->work_name)) ? $getAnchor->seq_no : 0;

			if($status == 'resubmit' and $setAchor != 0){

				$sql = "UPDATE fs_request_task_status SET rq_status = 'InProgress',unix_date='0',app_user=''  
				WHERE rq_work_id='$w_id' and rq_no = '$r_id' and seq_no >= '$setAchor' 
				and rq_status in ('Approved','Confirmed')";

				if($conn->query($sql)){
					$ret_msg = 'Record was successfully added';
				}
				else{
					$ret_msg = $conn->error;
				}				
			
			
				$sql = "UPDATE fs_request_task_approver SET approval_status = '',unixdate='0',approval_remarks=''  
				WHERE workflow_id='$w_id' and rq_no = '$r_id' and seq_no >= '$setAchor' and approval_status 
				in ('Approved','Confirmed','Disapproved')";

				if($conn->query($sql)){
					$ret_msg = 'Record was successfully added';
				}
				else{
					$ret_msg = $conn->error;
				}
			return $ret_msg;
			
		} else {

				$request = new Request($r_id);
				$request->updateDisapprovedTask();
				$request->setStatus('InProgress');
				$request->updateRequest();
			}
					
			
		//$conn->close();
			
}

//store last approver status
function store_approver_action($w_id, $s_id, $r_id, $status, $user, $remarks){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as approno 
		FROM fs_request_task_status 
		WHERE rq_work_id='$w_id' and rq_step_id = '$s_id' and rq_no = '$r_id' ";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();			
		$CountNo = $row['approno'];
		
		$usql = "SELECT count(id) as approno 
		FROM fs_request_task_approver 
		WHERE workflow_id='$w_id' and steps_id = '$s_id' and rq_no = '$r_id' and approver_id='$user'";
		$uquery = $conn->query($usql);
		$urow = $uquery->fetch_assoc();			
		$uCountNo = $urow['approno'];		
		$step_seq_num = get_step_seq_no($w_id, $s_id);
		
		$unixtime = time();
		$getAnchor = json_decode(get_flow_step_anchor($r_id));		
		$setAchor = (isset($getAnchor->work_name)) ? $getAnchor->seq_no : 0;
	
			//exec for status per task
			if($CountNo == 0){
				$sql = "INSERT INTO fs_request_task_status (rq_work_id, rq_step_id, rq_no, rq_status, unix_date, app_user) 
											VALUES ('$w_id', '$s_id','$r_id','$status','$unixtime','$user')";
										
											
			}else{
				$sql = "UPDATE fs_request_task_status SET rq_status = '$status',unix_date='$unixtime',app_user='$user'  WHERE rq_work_id='$w_id' and rq_step_id = '$s_id' and rq_no = '$r_id'";
				
			}
			
			if($conn->query($sql)){
				$ret_msg = 'Record was successfully added';
			}
			else{
				$ret_msg = $conn->error;
			}
			
			//exec for status per user approver
			if($uCountNo == 0){			
				$sql_user = "INSERT INTO fs_request_task_approver (workflow_id, steps_id, rq_no, approval_status, unixdate, approver_id, seq_no, approval_remarks) 
											VALUES ('$w_id', '$s_id','$r_id','$status','$unixtime','$user', '$step_seq_num','$remarks');";				
			}else{
				$sql_user = "UPDATE fs_request_task_approver SET approval_status = '$status',unixdate='$unixtime',approval_remarks='$remarks'  WHERE workflow_id='$w_id' and steps_id = '$s_id' and rq_no = '$r_id' and approver_id='$user'";
				
			}	


			if($conn->query($sql_user)){
				$ret_msg = 'Record was successfully added';
			}
			else{
				$ret_msg = $conn->error;
			}
		//$conn->close();
		return $ret_msg;
}



//get approved /disapprove step
function count_apprvd_stat($req_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT count(id) as approno 
		FROM fs_request_task_status 
		WHERE rq_no='$req_id' and rq_status in ('Approved','Confirmed')";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$CountNo = $row['approno'];
		return $CountNo;
		$conn->close();
		//return $genCode;
}

//get last action from history
function last_state($req_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT user_apex
		FROM fs_request_approval 
		WHERE request_id='$req_id' 
		ORDER BY id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$CountNo = $row['user_apex'];
		return $CountNo;
		$conn->close();
		//return $genCode;
}


//chec if attachment is updated
function last_attnt_update($req_id){
	//SELECT `id`, `work_id`, `work_name`, `approver`, `approval_type`, `confirm_type`, `time_window`, `reject_first`, `reject_change` FROM `fs_workstpes` WHERE 1
		$conn = $GLOBALS['conn'];
		$sqla = "SELECT fsra.step_id, fsra.unix, fss.work_name
		FROM fs_request_approval fsra
		LEFT JOIN fs_workstpes fss ON fss.work_id = fsra.step_id
		WHERE fsra.request_id='$req_id' 
		ORDER BY fsra.id DESC LIMIT 1";
		$querya = $conn->query($sqla);
		$rowa = $querya->fetch_assoc();		
		$checkunixa = (empty($rowa['unix'])) ? 0 : $rowa['unix'];
		
		$sqlb = "SELECT  file_id, file_name, file_uploader, file_unix 
		FROM fs_request_attachment 
		WHERE file_id = '$req_id' ";
		$queryb = $conn->query($sqlb);
		$rowb = $queryb->fetch_assoc();	
		$checkunixb = (empty($rowb['file_unix'])) ? 0 : $rowb['file_unix'];
		
		$retmsg = "No";
		if($checkunixa < $checkunixb){
			$retmsg = "Yes";
		}
		//echo $req_id ." - ".  $checkunixa ." - ". $checkunixb." - ".$retmsg."<br>";
		return $retmsg;
		$conn->close();
		//return $genCode;
}

//get last task action from history
function last_task($req_id){
	//SELECT `id`, `work_id`, `work_name`, `approver`, `approval_type`, `confirm_type`, `time_window`, `reject_first`, `reject_change` FROM `fs_workstpes` WHERE 1
		$conn = $GLOBALS['conn'];
		$sql = "SELECT fsra.step_id, fss.work_name, IFNULL(fsra.step_id, 'NA') checker
		FROM fs_request_approval fsra
		LEFT JOIN fs_workstpes fss ON fss.work_id = fsra.step_id
		WHERE fsra.request_id='$req_id' 
		ORDER BY fsra.id DESC LIMIT 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$retmsg = (empty($row['work_name'])) ? $row['step_id'] : $row['work_name'];
		//$retmsg = $row['checker'];
		return $retmsg;
		$conn->close();
		//return $genCode;
}

//get approved /disapprove step
function get_requestor_mail($req_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT user_email 
		FROM fs_request_main fsr 
		LEFT JOIN fs_users fsu on fsu.user_id = fsr.rq_requestor 
		WHERE fsr.rq_id = '$req_id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();		
		$us_mail = (isset($row['user_email'])) ? $row['user_email'] : '';
		return $us_mail;
		$conn->close();
		//return $genCode;
}

//get approved /disapprove step
function get_approver_mail($users_ids){
		$conn = $GLOBALS['conn'];

		$sql = "SELECT * FROM fs_user_group user_group
		LEFT JOIN fs_users users ON find_in_set(users.user_id, 
		user_group.ug_members)
		WHERE user_group.ug_name IN($users_ids)";

		$query = $conn->query($sql);
		$emil = '';
		while($row = $query->fetch_assoc()){		
		$emil .= $row['user_email'].',';
		}
		return $emil;
		$conn->close();
		//return $genCode;
}


//get approver pending request
function get_request_list($users_id){
		$conn = $GLOBALS['conn'];

		$sql = "SELECT X.rq_id FROM (
select frm.rq_id, ug.ug_members
from fs_users us
LEFT JOIN fs_user_group ug ON find_in_set(us.user_id,ug.ug_members)
LEFT JOIN fs_request_task_status rts ON  find_in_set(ug.ug_id,rts.user_approvers)
LEFT JOIN fs_request_main frm ON frm.rq_workflow = rts.rq_work_id and frm.rq_id = rts.rq_no
WHERE frm.rq_status not in ('Completed','Cancelled') AND us.user_id = '$users_id'
) X
WHERE X.ug_members like '%$users_id%'
GROUP BY X.rq_id";


		$query = $conn->query($sql);
		$emil = '';
		while($row = $query->fetch_assoc()){		
		$emil .= $row['rq_id'].',';
		}
		return $emil;
		$conn->close();
		//return $genCode;
}

//get anchor step on disapproved
function get_flow_step_anchor($req_id){
		$conn = $GLOBALS['conn'];
		$sql = "SELECT rts.*, fss.work_name, fss.reject_anchor
			FROM fs_request_task_status rts
			LEFT JOIN fs_workstpes fss ON fss.work_id=rts.rq_step_id
			WHERE rts.rq_no = '$req_id' and rts.rq_status in ('Approved','Confirmed') and fss.reject_anchor = 'Yes'
			ORDER BY rts.seq_no ASC Limit 1";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		return json_encode($row);
		$conn->close();
		//return $genCode;
}


//log user viewer of document
function user_doc_viewer($req_id, $user_id){
		//INSERT INTO `fs_doc_viewer`(`id`, `unixdate`, `rq_id`, `user_id`, `datetime`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5])
		$conn = $GLOBALS['conn'];
		$unixtime = time();
		$datetimestap=date("Y-m-d H:i", $unixtime);
		$sql = "INSERT INTO fs_doc_viewer(unixdate, rq_id, user_id, datetime) VALUES ('$unixtime','$req_id','$user_id','$datetimestap')";
		$query = $conn->query($sql);
			if($conn->query($sql)){
				$repl = 'Document has been successfully loaded';
			}
			else{
				$repl = $conn->error;
			}
		return $repl;
		$conn->close();
		//return $genCode;
}

// check if the user already approved on the task
function is_user_already_approved($req_id, $step_id, $user_id ) {

	$conn = $GLOBALS['conn'];

	$sql = "SELECT approver.approval_status FROM fs_request_task_approver approver
	WHERE approver.steps_id = '$step_id' 
	AND approver.rq_no = '$req_id'
	AND approver_id = '$user_id'
	LIMIT 1";

	$query = $conn->query($sql);

	if (!$query) return false;
	
	$row = $query->fetch_assoc();
	$result = isset( $row['approval_status']) ?  $row['approval_status'] : '' ;

	if (is_null($result)) return false;

	return $result == 'Approved' || $result == 'Confirmed' || $result == 'Disapproved'? true : false;
	$conn->close();
}
?>