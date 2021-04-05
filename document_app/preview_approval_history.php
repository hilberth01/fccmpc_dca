<?php
	
	include 'includes/session.php';
	include 'includes/slugify.php';

	if(isset($_POST['approval_history'])){
	$output = array('error'=>false,'list'=>'');
	$sql = "SELECT * FROM positions";
	$query = $conn->query($sql);

		while($row = $query->fetch_assoc()){
			$position = slugify($row['description']);
			$pos_id = $row['id'];
			if(isset($_POST[$position])){
				if($row['max_vote'] > 1){
					if(count($_POST[$position]) > $row['max_vote']){
						$output['error'] = true;
						$output['message'][] = '<li>You can only choose '.$row['max_vote'].' candidates for '.$row['description'].'</li>';
					}
					else{
						foreach($_POST[$position] as $key => $values){
							$sql = "SELECT * FROM candidates WHERE id = '$values'";
							$cmquery = $conn->query($sql);
							$cmrow = $cmquery->fetch_assoc();
							$output['list'] .= "
								<div class='row votelist'>
									<span class='col-sm-4'><span class='pull-right'><b>".$row['description']." :</b></span></span> 
									<span class='col-sm-8'>".$cmrow['firstname']." ".$cmrow['lastname']."</span>
								</div>
							";
						}

					}
					
				}
				else{
					$candidate = $_POST[$position];
					$sql = "SELECT * FROM candidates WHERE id = '$candidate'";
					$csquery = $conn->query($sql);
					$csrow = $csquery->fetch_assoc();
					$output['list'] .= "
						<div class='row votelist'>
							<span class='col-sm-4'><span class='pull-right'><b>".$row['description']." :</b></span></span> 
							<span class='col-sm-8'>".$csrow['firstname']." ".$csrow['lastname']."</span>
						</div>
					";
				}

			}
			
		}
	echo json_encode($output);
	exit();
	}	
	
	else if(isset($_GET['count']) and isset($_POST['reqid'])){
		$id = $_POST['reqid'];
		//$sql = "SELECT fsw.*, fsw.id as wid FROM fs_workstpes fsw WHERE fsw.id = '$id'";
		$sql = "SELECT count(ra.id) as numrows  
		FROM fs_request_approval ra
		LEFT JOIN fs_users us ON us.user_id=ra.user_approver
		WHERE ra.request_id = '$id'
		ORDER BY ra.id";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}


?>