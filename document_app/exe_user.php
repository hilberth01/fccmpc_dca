<?php
include 'includes/session.php';
include 'includes/logger.php';
include 'classes/user.php';

$paction = '';

//execute add item=======================================
if (isset($_POST['add'])) {

	$userId = $_POST['userId'];
	$firstname = $_POST['firstname'];
	$middlename = $_POST['middlename'];
	$lastname = $_POST['lastname'];
	$emailadd = $_POST['emailadd'];
	$accesslevel =  implode(',', $_POST['accesslevel']); //$accesslevel = $_POST['accesslevel'];
	$department = $_POST['department'];
	$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
	$filename = $_FILES['photo']['name'];

	if (!empty($filename)) {
		move_uploaded_file($_FILES['photo']['tmp_name'], '../images/' . $filename);
	}

	$result = user::insert_user(
		$userId,
		$password,
		$firstname,
		$middlename,
		$lastname,
		$emailadd,
		$accesslevel,
		$department,
		$firstname
	);

	if ($result) {
		$_SESSION['success'] = 'User successfully inserted.';
	} else {
		$_SESSION['error'] = "Unable to add user.";
	}

	$paction = 'INSERT';
}

//execute edit item=======================================
else if (isset($_POST['edit'])) {

	$id = $_POST['id'];
	$userId = $_POST['userId'];
	$firstname = $_POST['firstname'];
	$middlename = $_POST['middlename'];
	$lastname = $_POST['lastname'];
	$emailadd = $_POST['emailadd'];
	//$accesslevel = $_POST['accesslevel'];
	$department = $_POST['department'];
	$password = $_POST['password'];

	$accesslevel = isset($_POST['accesslevel']) ? 
				implode(',', $_POST['accesslevel']) :
				"None";

	$user = new user($userId);

	if ($password == $user->getPassword())
		$password = $user->getPassword();
	else
		$password = password_hash($password, PASSWORD_DEFAULT);

	$result =	$user->update_user(
		$userId,
		$firstname,
		$middlename,
		$lastname,
		$emailadd,
		$accesslevel,
		$department,
		$password
	);

	if ($result)
		$_SESSION['success'] = 'User successfully updated';
	else
		$_SESSION['error'] = $user->conn->error;

	$paction = 'UPDATE';
}

//execute update user photo=======================================
else if (isset($_POST['upload'])) {

	$id = $_POST['id'];
	$userId = $_POST['user_id'];
	$filename = $_FILES['photo']['name'];

	if (!empty($filename)) {
		move_uploaded_file($_FILES['photo']['tmp_name'], '../images/' . $filename);
	}

	$user = new user($userId);
	$result = $user->update_photo($filename);

	if ($result)
		$_SESSION['success'] = 'Photo successfully updated';
	else
		$_SESSION['error'] = $user->conn->error;

	$paction = 'UPDATE';
}

//execute DELETE item ====================================
else if (isset($_POST['delete'])) {
	// $id = $_POST['id'];
	$user_id = $_POST['user_id'];

	$user = new user($user_id);
	$result = $user->delete_user();

	if ($result)
		$_SESSION['success'] = 'User successfully deleted';
	else
		$_SESSION['error'] = $user->conn->error;

	$paction = 'DELETE';
}

//execute get row item====================================
else if (isset($_GET['view']) and isset($_POST['user_id'])) {

	$id = $_POST['user_id'];
	$user = new user($id);
	echo json_encode($user->getUser_row());
	exit();

} else {
	$_SESSION['error'] = 'Fill up add form first';
}

$pname = 'fs_users';
$puser = $user->getUser_id();
//$json = file_get_contents('php://input');  //$_POST;
//$pattrib = json_decode($_POST);
$pattrib = json_encode($_POST);
attrib_logger($pname, $paction, $puser, $pattrib);

header('location: ./?pid=users');
