<?php
	include 'includes/session.php';
	include 'includes/slugify.php';
	include 'includes/functions.php';
if(isset($_POST['reqid'])){
		$rid = $_POST['reqid'];

				//SELECT `id`, `request_id`, `flow_id`, `step_id`, `user_apex`, `user_approver`, `user_remarks`, `date_approved`, `unix` FROM `fs_request_approval` WHERE 1
                
                //$sql = "SELECT *, candidates.firstname AS canfirst, candidates.lastname AS canlast FROM votes LEFT JOIN candidates ON candidates.id=votes.candidate_id LEFT JOIN positions ON positions.id=votes.position_id WHERE voters_id = '$id'  ORDER BY positions.priority ASC";
        $sql = "SELECT ra.flow_id, ra.user_apex, ra.date_approved, ra.step_id, ra.user_remarks, fss.work_name, us.firstname, us.lastname
				FROM fs_request_approval ra
				LEFT JOIN fs_users us ON us.user_id=ra.user_approver
				LEFT JOIN fs_workstpes fss ON fss.work_id=ra.step_id
				WHERE ra.request_id = '$rid'
				ORDER BY ra.id ASC";
				$query = $conn->query($sql);
				$approvalhistory = '';
                while($row = $query->fetch_assoc()){
                  
				  $approvalhistory .= '<tr>
						<td>'.((empty($row['work_name'])) ? $row['step_id'] : $row['work_name']).'</td>
						<td>'.$row['firstname']." ".$row['lastname'].'</td>
						<td>'.$row['user_apex'].'</td>
						<td>'.$row['date_approved'].'</td>
						<td>'.$row['user_remarks'].'</td>
						</tr>';	
                }
				
				$output = ' <table id="history" class="table table-bordered table-hover">
						<thead>
							<th>Task</th>	
							<th>User</th>
							<th>Status</th>
							<th>Date</th>
							<th>Remarks</th>
							</thead>
							<tbody>
							'.$approvalhistory.'
						 </tbody>
						</table>';	



	echo json_encode($output);
}
?>