<?php
	include 'includes/session.php';
	include 'includes/logger.php';
	$pname = 'fs_workflow';	
	$puser = $user['user_id'];
	$paction = 'UPDATE';
	if(isset($_POST['id'])){
		$id = $_POST['id'];
		$form_id = $_GET['form_id'];
		$output = array('error'=>false);

		$sql = "SELECT * FROM fs_workflow WHERE id='$id' and form_id='$form_id'";	
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		$priority = $row['form_sequence'] - 1;

		if($priority == 0){
			$output['error'] = true;
			$output['message'] = 'This position is already at the top';
		}
		else{
			$sql = "UPDATE fs_workflow SET form_sequence = form_sequence + 1 WHERE form_sequence = '$priority' and form_id='$form_id' ";
			$conn->query($sql);

			$sql = "UPDATE fs_workflow SET form_sequence = '$priority' WHERE id = '$id'";
			$conn->query($sql);
		}

		echo json_encode($output);
		
	$pattrib = json_encode($_POST);
	$pattrib .= json_encode($_GET);
	attrib_logger($pname, $paction, $puser, $pattrib);
	}
	
?>