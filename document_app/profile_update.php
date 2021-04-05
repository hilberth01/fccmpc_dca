<?php
	include 'includes/session.php';

	if(isset($_GET['return'])){
		$return = $_GET['return'];
		
	}
	else{
		$return = 'dashboard';
	}

	if(isset($_POST['save'])){
		$curr_password = $_POST['curr_password'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$firstname = $_POST['firstname'];
		$middlename = $_POST['middlename'];
		$lastname = $_POST['lastname'];
		$photo = $_FILES['photo']['name'];
		
		$password_new = $_POST['newpassword'];
		$password_rep = $_POST['repassword'];
		if(password_verify($curr_password, $user['password'])){
			if(!empty($photo)){
				move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$photo);
				$filename = $photo;	
			}
			else{
				$filename = $user['photo'];
			}

			$password_status = " and NO changes on current password.";


			if(empty($password_new)){
				$password = $user['password'];
			}
			else{
				if($password_new == $password_rep){
					$password = password_hash($password_new, PASSWORD_DEFAULT);
					$password_status = " and password has been changed.";
				}else{
					$password = $user['password'];
					$_SESSION['error'] = 'The new password and confirmation password do not match.';
				}
			}
			
			

			$sql = "UPDATE fs_users SET password = '$password', firstname = '$firstname', middlename = '$middlename', lastname = '$lastname', photo = '$filename' WHERE user_id = '$username'";
			if($conn->query($sql)){
				$_SESSION['success'] = 'User profile updated successfully'.$password_status;
			}
			else{
				$_SESSION['error'] = $conn->error;
			}
			
		}
		else{
			$_SESSION['error'] = 'Incorrect password';
		}
	}
	else{
		$_SESSION['error'] = 'Fill up required details first';
	}

	header('location: main.php?pid='.$return);

?>