<?php
	include 'includes/session.php';
	include 'includes/functions.php';
	include 'includes/logger.php';
	
	$paction = '';
	//execute add item=======================================
	if(isset($_POST['add'])){
		$description = $_POST['description'];
		$approvaltype = 'series';
		$steps_id = gererate_id(15);
		$step_seq = 1;
		          // Retrieving each selected option   
		if(!empty($_POST['worksteps'])) {		  
        foreach($_POST['worksteps'] as $worksteps){
			// print "You selected $worksteps<br/>"; 
			$sql = "INSERT INTO fs_workflow (form_id, form_name, form_steps_id, form_sequence, form_approval_type) 
									VALUES ('$steps_id', '$description', '$worksteps', '$step_seq', '$approvaltype')";
			if($conn->query($sql)){
				$_SESSION['success'] = 'Work step was successfully added';
			}
			else{
				$_SESSION['error'] = $conn->error;
			}
			$step_seq++;
			} 
		}else{
				$_SESSION['error'] = "No Step is selected.";
		}
		$paction = 'INSERT';
	}
	
	//execute edit item=======================================
	else if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$description = $_POST['description'];
		//$approvaltype = $_POST['approvaltype'];

		$sql = "UPDATE fs_workflow SET form_name = '$description' WHERE form_id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Workflow name was successfully updated';
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
	else if(isset($_GET['group']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT form_id,form_name,form_approval_type FROM fs_workflow WHERE form_id = '$id' GROUP BY form_id, form_name, form_approval_type";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}
	
	//execute get row item====================================
	else if(isset($_GET['view']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT fsw.*, fss.work_name FROM fs_workflow fsw LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id WHERE fsw.form_id = '$id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}

	//execute get row item====================================
	else if(isset($_GET['maintbl']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT fsw.*, fss.work_name FROM fs_workflow fsw LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id WHERE fsw.id = '$id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}

	//execute get row item====================================
	else if(isset($_GET['showtable']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$output = '<div class="row">';
		$sql = "SELECT * FROM fs_workflow  WHERE fsw.form_id = '$id'";
		$query = $conn->query($sql);
		while($row = $query->fetch_assoc()){			
			$output .= '
			<div class="form-group">
				<label class="col-sm-3 control-label">'.$row['work_name'].'</label>
			</div>
		';
		}
		$output .= '</div>';
		echo json_encode($output);
		exit();
	}

	
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}
	
	$pname = 'fs_workflow';	
	$puser = $user['user_id'];
	$pattrib = json_encode($_POST);
	attrib_logger($pname, $paction, $puser, $pattrib);
	
	header('location: ./?pid=workflow');
?>