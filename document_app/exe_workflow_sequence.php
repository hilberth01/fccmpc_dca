<?php
	include 'includes/session.php';
	include 'includes/functions.php';
	include 'includes/logger.php';
	
	$paction = '';
	
	$pageid = (isset($_GET['formid']))? $_GET['formid'] : '';
	//execute add item=======================================
	if(isset($_POST['addstep'])){
		$description = $_POST['description'];
		$approvaltype = $_POST['approvaltype'];
		$form_id = $_POST['form_id'];
		$ug_name = 'NA';
		
        $sql = "SELECT count(id) as nomRow FROM fs_workflow WHERE form_id = '$form_id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
        $step_seq = $row['nomRow'];		
		$step_seq++;
		
		  
		if(!empty($_POST['worksteps'])) {		  
			$worksteps=$_POST['worksteps'];
			
			$sql = "INSERT INTO fs_workflow (form_id, form_name, form_steps_id, form_sequence, form_approver, form_approval_type) 
									VALUES ('$form_id', '$description', '$worksteps', '$step_seq', '$ug_name', '$approvaltype')";
			if($conn->query($sql)){
				$_SESSION['success'] = 'Work step was successfully added';
			}
			else{
				$_SESSION['error'] = $conn->error;
			}
			
			
		}else{
				$_SESSION['error'] = "No Step is selected.";
		}
		$paction = 'INSERT';
	}
	
	//execute edit item=======================================
	else if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$steps_id = $_POST['steps_id'];
		$department = $_POST['department'];
		$ug_name = 'NA';

		$sql = "UPDATE fs_workflow SET form_steps_id = '$steps_id', form_approver = '$ug_name'  WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = $department.' - Workflow step was successfully updated';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
		$paction = 'UPDATE';
	}
		
	//execute DELETE item ====================================
	else if(isset($_POST['delete'])){
		$id = $_POST['id'];
		$sql = "DELETE FROM fs_workflow WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Work Step was successfully deleted';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
		$paction = 'DELETE';
	}
	//execute get row item====================================
	else if(isset($_GET['view']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT form_id,form_name,form_approval_type FROM fs_workflow WHERE form_id = '$id' GROUP BY form_id, form_name, form_approval_type";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}

	//execute get row item====================================
	else if(isset($_GET['maintbl']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$filter = $_POST['filter'];
		
		if($filter=='flow'){
			$sqlfilter = "fsw.form_id = '$id'";
		}else{
			$sqlfilter = "fsw.id = '$id'";
		}
		
		$sql = "SELECT fsw.*, fss.work_name FROM fs_workflow fsw LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id WHERE $sqlfilter";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}
	
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}
	
	$pname = 'fs_workflow';	
	$puser = $user['user_id'];
	$pattrib = json_encode($_POST);
	attrib_logger($pname, $paction, $puser, $pattrib);
	
	if(empty($pageid)){
		header('location: ./?pid=flowsteps');
	}else{
		header('location: ./?pid=workflow_sequence&id='.$pageid.'');
	}
	
?>