<?php
	session_start();
	include 'includes/conn.php';
	
	date_default_timezone_set('Asia/Manila');

	if(!isset($_SESSION['system_user']) || trim($_SESSION['system_user']) == ''){
		$_SESSION['url_from_extnal'] = $_SERVER['REQUEST_URI'];  //store the last URL visited
		unset($_SESSION['system_user']);
		header('location: login_form.php');
	}



	if(isset($_SESSION['system_user'])){
		$sql = "SELECT * FROM fs_users WHERE user_id = '".$_SESSION['system_user']."'";
		$query = $conn->query($sql);
		$user = $query->fetch_assoc();
	}

	
?>