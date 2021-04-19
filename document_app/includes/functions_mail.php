<?php
require_once 'request.php';

function send_mail($reqNo)
{
    $conn = $GLOBALS['conn'];
    //include '../admin/includes/functions.php';

    $serverhostname =  "http://localhost";  // for unit test

    if (isset($_SERVER['HTTP_HOST'])) {
        $serverhostname = "http://".$_SERVER['HTTP_HOST'];
    }

    $url = $serverhostname."/coop/document_app/?pid=approval_rev&track={$reqNo}";

    $sql = "SELECT rm.rq_id, rm.rq_status, rm.rq_name, rm.rq_description, 
		wf.form_sequence, wf.form_id, wf.form_name, 
		wf.form_steps_id,fss.work_id, fss.work_name, rts.user_approvers
		FROM fs_request_main rm 
		LEFT JOIN fs_workflow wf ON wf.form_id=rm.rq_workflow
		LEFT JOIN fs_workstpes fss ON fss.work_id=wf.form_steps_id
		LEFT JOIN fs_request_task_status rts ON rts.rq_step_id = wf.form_steps_id and rts.rq_no = '$reqNo' 
		WHERE rm.rq_id = '$reqNo' ORDER BY wf.form_sequence ASC";

    $squery = $conn->query($sql);
    $srow = $squery->fetch_assoc();

    // subject
    $subject = 'FCCMPC Document Control - '.$reqNo;

    // get requetor mail
    $requestro = get_requestor_mail($reqNo);

    // get last status of the request
    $last_status = last_state($reqNo);

    // message
    $message = '
<html>
<head>
<style>
#tablecontent {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tablecontent td, #tablecontent th {
  border: 1px solid #ddd;
  padding: 5px;
}

#tablecontent tr:nth-child(even){background-color: #f2f2f2;}

#tablecontent tr:hover {background-color: #ddd;}

#tablecontent th {
  padding-top: 5px;
  padding-bottom: 5px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<p>Greetings!</p>';

    if ($srow['rq_status'] == 'Completed') {
        $message .= '<p>This is now fully approved, 
				<br>This approved document should be implemented 14 days from this approval.</p>';
    } elseif ($last_status == 'Resubmit') {
        $message .= '<p>This request was updated by the requestor and it needs an approval,
				<br>kindly review and follow the link below to render your approval.</p>';
    } elseif ($srow['rq_status'] == 'Disapproved') {
        $message .= '<p>Your request has been disapproved, 
				<br>kindly review this request and update the necessary inputs.</p>';
    } else {
        $message .= '<p>This request needs an approval, 
				<br>kindly review and follow the link below to render your approval.</p>';
    }

    $name = $srow['rq_name'];
    
    $message .= '<p>Title: <i>'.$srow['rq_name'].'</i></p>
			<p>Description: <i>'.$srow['rq_description'].'</p>';
            
    
    $message .='		
	<table style="width:700px" id="tablecontent">
	    <tr>
		<th>Seq</th>
		<th>Task</th>
		<th>Status</th>
		<th>Approver</th>
		<th>Date</th>
		</tr>
	';
    
    $indexer = 0;
    $indx = 0;
    $cache_member = '';
    $list_members = '';

    $query = $conn->query($sql);

    $request = new request($reqNo);

    while ($row = $query->fetch_assoc()) {
        
        $task_id = $row['form_steps_id'];
        $obj_tbl_app = json_decode(get_appv_stat_event($row['rq_id'], $row['form_id'], $row['form_steps_id']));
        
        // $app_apex = (isset($obj_tbl_app->rq_status) && $obj_tbl_app->rq_status != '')
        // ? $obj_tbl_app->rq_status : "Pending";

        $app_apex = $request->isTaskApprovalComplete($row['form_steps_id']) == true
                    ? 'Approved' : 'Pending';

        // override if contain disapproval
        if ($request->isRequestHasDisapproval()) {
            $app_apex = 'Disapproved';
        }
        
        $app_date = ($obj_tbl_app->unix_date != 0) ? date("Y-m-d H:i:s", $obj_tbl_app->unix_date) : "";
        $app_name = (isset($obj_tbl_app->firstname)) ? $obj_tbl_app->firstname.' '.$obj_tbl_app->lastname : "";
        //$app_remarks = (isset($obj_tbl_app->user_remarks)) ? $obj_tbl_app->user_remarks : "";

        $variable = $row['user_approvers'];
        $var = explode(',', $variable);
 
        foreach ($var as $row) {
            if ($indx == 1) {
                $list_members .= ',';
                $indx = 0;
            }

            $list_members .= get_usergroup_record($row);
            $indx++;
        }

        if ($indexer == 0 and ($app_apex == "Pending" || $app_apex == "Disapproved")) {
            $cache_member = $list_members; //$row['user_approvers'];
            $indexer++;
        }

        $message .= '<tr>
         		  <td>' . $obj_tbl_app->seq_no . '</td>
         		  <td>' . $obj_tbl_app->work_name . '</td>
         		  <td>' . $app_apex . '</td>
         		  <td>' . $app_name . '</td>
         		  <td>' . $app_date . '</td>
         		 </tr>';

        //
    }

    $wrapped = $cache_member;

    // this is not to wrapped the approver if it only contains
    // single approver
    if (count(explode(',', $cache_member)) > 1) {
        $wrapped ='"'.str_replace(',', '","', $wrapped).'"';
    } else {
        $wrapped = "'" . $cache_member . "'";
    }

    $message .= '
  </table>
  
  <br>
  Request link: <a href="'.$url.'">'.$reqNo.'</span></a><br>
  </body>
</html>
';

    $cc = $requestro;
    if ($srow['rq_status'] == 'Completed' || $srow['rq_status'] == 'Disapproved') {
        $to = $requestro;
    // $cc = get_approver_mail($wrapped);
    } else {
        $to = get_approver_mail($wrapped);
        $cc = $requestro;
    }


    //exit();


    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

    $headers .= 'Cc:'.$cc.' ' . "\r\n";

    // Mail it
 mail($to, $subject, $message, $headers);  // temporarily disabled
}