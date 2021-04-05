<?php 
	include 'includes/session.php';
	include 'includes/logger.php';	
	include 'includes/functions.php';
	include 'includes/functions_mail.php';
	
	$paction = '';	
	$pname = 'fs_request_main';
	//execute add item=======================================
	if(isset($_POST['add'])){
		$docname = $_POST['docname'];
		$docdesp = $_POST['docdesp'];
		$workflow = $_POST['workflow'];
		$platform = $_POST['platform'];
		$filename = $_FILES['docname']['name'];	
		$unixtime = time();
		$activeuser = $user['user_id'];
		$initstat = "New";
		
		$sql = "SELECT MAX(id) as lastno FROM fs_request_main";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();
		
		$genControlNo = $row['lastno'] + 1;
		$genControlNo = "FCCMPC-".sprintf("%07d", $genControlNo);
		 

		$sql = "INSERT INTO fs_request_main (rq_id, rq_name, rq_description, rq_workflow, rq_status, rq_requestor, rq_unix) 
				VALUES ('$genControlNo', '$docname', '$docdesp', '$workflow', '$initstat', '$activeuser', '$unixtime')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'New request has been successfully generated';
			send_mail($genControlNo);
		}
		else{
			$_SESSION['error'] = $conn->error;
		}


		if(!empty($filename)){
			move_uploaded_file($_FILES['docname']['tmp_name'], './file_dump/'.$filename);
			$sql = "INSERT INTO fs_request_attachment (file_id, file_name, file_uploader, file_unix) 
			VALUES ('$genControlNo', '$filename', '$activeuser', '$unixtime')";
			
			if($conn->query($sql)){
				$_SESSION['success'] .= ' New file has been successfully uploaded';
			}
			else{
				$_SESSION['error'] .= $conn->error;
			}
			
		} 
	$paction = 'INSERT';	

	}
	//execute edit item=======================================
	else if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$docname = $_POST['edit_docname'];
		$docdesp = $_POST['edit_docdesp'];
		$workflow = $_POST['edit_workflow'];

		$sql = "UPDATE fs_request_main SET rq_name = '$docname', rq_description = '$docdesp', rq_workflow = '$workflow' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Request has been successfully updated';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	$paction = 'UPDATE';	
	}	
	//execute UPDATE file attachment =============================
	else if(isset($_POST['upload'])){
		$file_id = $_POST['refile_id'];
		$filename = $_FILES['reupload']['name'];
		$unixtime = time();
		$activeuser = $user['user_id'];
		
		if(!empty($filename)){
			move_uploaded_file($_FILES['reupload']['tmp_name'], './file_dump/'.$filename);	
		}
		
		$sql = "SELECT count(id) as recno FROM fs_request_attachment WHERE file_id = '$file_id' ";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();	

		
		if($row['recno'] == 0){
			$sql = "INSERT INTO fs_request_attachment (file_id, file_name, file_uploader, file_unix) 
			VALUES ('$file_id', '$filename', '$activeuser', '$unixtime')";
		$paction = 'INSERT';		
		}else{
			$sql = "UPDATE fs_request_attachment SET file_name = '$filename', file_uploader='$activeuser', file_unix='$unixtime'  
			WHERE file_id = '$file_id'";
		$paction = 'UPDATE';
		}			
		
		if($conn->query($sql)){
			$_SESSION['success'] = 'File was successfully updated';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	$pname = 'fs_request_attachment';
	}
	//execute CANCEL item ====================================
	else if(isset($_POST['cancel'])){
		$id = $_POST['id'];
		$sql = "UPDATE FROM fs_request_main SET rq_status='Cancelled' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Request has been successfully cancelled';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	$paction = 'UPDATE';	
	}
	//execute DELETE item ====================================
	else if(isset($_POST['delete'])){
		$id = $_POST['id'];
		$sql = "DELETE FROM fs_request_main WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Candidate was successfully deleteds';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	$paction = 'DELETE';	
	}
	//execute get row item====================================
	else if(isset($_GET['attmtbl']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT * FROM fs_request_attachment  WHERE file_id = '$id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}	
	//execute get row item====================================
	else if(isset($_GET['maintbl']) and isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT * FROM fs_request_main WHERE rq_id = '$id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
		exit();
	}else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	
	$puser = $user['user_id'];
	$pattrib = json_encode($_POST);
	attrib_logger($pname, $paction, $puser, $pattrib);
	
	header('location: ./?pid=request');
?>