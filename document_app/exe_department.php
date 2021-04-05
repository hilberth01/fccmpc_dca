<?php
	include 'includes/session.php';
	include 'includes/logger.php';	
	include 'classes/department.php';
	
	$paction = '';

//execute add item=======================================
if (isset($_POST['add'])) {

	$dept_no = $_POST['dept_no'];
	$description = $_POST['description'];
	$approver = $_POST['approver'];

	$result = department::insert_department($dept_no, $description, $approver);

	if ($result) {
		$_SESSION['success'] = 'Department successfully added';
	} else {
		$_SESSION['error'] = $conn->error;
	}
	$paction = 'INSERT';
}

//execute edit item=======================================
else if (isset($_POST['edit'])) {

	$dept_id = $_POST['id'];
	$dept_number = $_POST['dept_no'];
	$dept_description = $_POST['description'];
	$approver = $_POST['approver'];

	$department = new department($dept_id);

	$department->setDepartment_no($dept_number);
	$department->setDepartment_name($dept_description);
	$department->setDepartment_approver($approver);

	$result = $department->update_department();

	if ($result)
		$_SESSION['success'] = 'Department successfully updated';
	else
		$_SESSION['error'] = $conn->error;

	$paction = 'UPDATE';
}

//execute DELETE item ====================================
else if (isset($_POST['delete']))
 {
	$dept_id = $_POST['id'];

	$department = new department($dept_id);

	$user = $department->get_department_user();

	if (!isset($user)) {

		if ($department->delete_department())
			$_SESSION['success'] = 'Department successfully deleted';
		else
			$_SESSION['error'] = $department->conn->error;

	} else {
		$_SESSION['error'] = $user->first_name . " " . $user->last_name .
			" is associated to this department, kindly remove or replace the
			 user department to proceed.";
	}

	$paction = 'DELETE';
}
	
	//execute get row item====================================
	else if(isset($_GET['view']) and isset($_POST['id'])){
		$id = $_POST['id'];
		
		$department = new department($id);
		echo json_encode($department->getDepartment_row());
		exit();
	}

	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}
	
	$pname = 'fs_department';	
	$puser = $user['user_id'];
	$pattrib = json_encode($_POST);
	attrib_logger($pname, $paction, $puser, $pattrib);
	
	header('location: ./?pid=department');
