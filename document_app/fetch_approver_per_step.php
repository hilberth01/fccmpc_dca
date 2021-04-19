<?php
    include 'includes/session.php';
    include 'includes/slugify.php';
    include 'includes/functions.php';
    include 'classes/workflow.php';
    require_once 'classes/request.php';

if (isset($_POST['reqid']) and isset($_POST['wlid']) and isset($_POST['stpid'])) {
    $request_id = $_POST['reqid'];
    $workflow_id = $_POST['wlid'];
    $task_id = $_POST['stpid'];

    $request = new request($request_id);

    $workflow = new Workflow($workflow_id);
    $frow = $workflow->getTaskCount();
    
    $output = ''; //$rid.'-'.$wid.'-'.$sid;
    $approvalhistory = '';

    $sql = "SELECT wst.*,ug.ug_name, ug.ug_members, rts.user_approvers
	FROM fs_workstpes wst
	LEFT JOIN fs_request_task_status rts ON rts.rq_step_id = wst.work_id and rts.rq_no = '$request_id'
	LEFT JOIN fs_user_group ug ON ug.ug_id = rts.user_approvers
	WHERE wst.work_id= '$task_id' LIMIT 1";
    //$output .= $sql;
    $query = $conn->query($sql);
    $num = 1;

    $approver_total = 1;
    $approved_count = 0;

	$approvers = $request->getRequestTaskApproverUsers($task_id);
    $approvers_count = $approvers->count();

	foreach($approvers as $approver){

		$image = !empty($approver->getPhoto()) ? '../images/'. $approver->getPhoto()
		: '../images/profile.jpg';
	}

    while ($row = $query->fetch_assoc()) {
        $ug_tbl_app = json_decode(get_appv_members($request_id, $workflow_id, $task_id)); //$row['ug_members'];
        //var_dump($ug_tbl_app);
        $required_number_approval= minimum_approval_needed($row['work_id']);
        $userTaskapprv = (isset($ug_tbl_app->ugname)) ? $ug_tbl_app->ugname : $row['ug_members'];
        $member_array = explode(",", $userTaskapprv);
        $approver_total = count($member_array);
        $wrapped='"'.str_replace(',', '","', $userTaskapprv).'"';
        
        $sqlz = "SELECT us.user_id, us.firstname, us.lastname, us.photo , rta.unixdate, rta.steps_id, rta.approval_remarks, rta.approval_status
			FROM fs_users us 
			LEFT OUTER JOIN fs_request_task_approver rta ON rta.approver_id=us.user_id and rta.rq_no = '$request_id' and rta.steps_id='$task_id'
			WHERE us.user_id in ($wrapped) 
			ORDER BY us.id ASC";

        //echo $sqlz;
        $queryz = $conn->query($sqlz);

        while ($rowz = $queryz->fetch_assoc()) {
            $image = (!empty($rowz['photo'])) ? '../images/'.$rowz['photo']
            : '../images/profile.jpg';
            
            $date_approved = '';

            if (!empty($rowz['unixdate'])) {
                $approved_count++;
                $date_approved = date("Y-m-d H:i", $rowz['unixdate']);
            }

            $approvalhistory .= '<tr>
						<td><img src="'.$image.'" height="50px" width="50px" class="clist"></td>
						<td>'.$rowz['firstname']." ".$rowz['lastname'].'</td>
						<td>'.$rowz['approval_status'].'</td>
						<td>'.$date_approved.'</td>
						<td>'.$rowz['approval_remarks'].'</td>
						</tr>';
        }

        $instruct = ($required_number_approval > 1) ? 'This task needs '.$required_number_approval.' approvers' : 'One approver only';
        

        $output .= '
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-solid" id="'.$row['id'].'">
						<div class="box-header with-border">
							<h3 class="box-title"><b>'.$request_id.'</b></h3>
							<div class="pull-right box-tools">
				                <b>'.$row['work_name'].'</b>
				            </div>
						</div>
						<div class="box-body">
							<p>'.$instruct.'
								<span class="pull-right">
									'.$approved_count.'/'.$required_number_approval.'
								</span>
							</p>
							<div id="candidate_list">
							<table id="history" class="table table-bordered table-hover">
								<thead>
									<th>Photo</th>	
									<th>User</th>
									<th>Status</th>
									<th>Date</th>
									<th>Remarks</th>
									</thead>
									<tbody>
									'.$approvalhistory.'
								 </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		';

        $num++;
    }

    echo json_encode($output);
}
