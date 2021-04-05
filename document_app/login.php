<?php
	session_start();
	include 'includes/conn.php';
	$url = "./login_form.php?pid=dashboard"; 


	if(isset($_POST['login'])){
		$username = $_POST['username'];
		$password = $_POST['password'];

		$sql_u = "SELECT * FROM fs_users WHERE user_id = '$username'";
		$query_user = $conn->query($sql_u);


		if($query_user->num_rows < 1){
			$_SESSION['error'] = 'Cannot find account with the username';
		}else{
			$row_u = $query_user->fetch_assoc();
			if(password_verify($password, $row_u['password'])){
				$_SESSION['system_user'] = $row_u['user_id'];
				
				$sqllast = "UPDATE fs_users SET last_login = now() WHERE user_id = '$username'";
				$conn->query($sqllast);
				
				if(isset($_SESSION['url_from_extnal'])) {
				   $url = $_SESSION['url_from_extnal']; // holds url for last page visited.
				   unset($_SESSION['url_from_extnal']);
				}else{ 
				   $url = "./login_form.php?pid=dashboard"; 
				}								
				
			}
			else{
				$_SESSION['error'] = 'Incorrect password';
			}
		}
		
	}
	else{
		$_SESSION['error'] = 'Input admin credentials first';
	}
	header( "refresh:1;url=$url" );
	//header('location: ./login_form.php?pid=dashboard');

?>