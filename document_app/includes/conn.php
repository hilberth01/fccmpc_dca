<?php
	
	//$conn = new mysqli('localhost', 'user', 'user', 'coop_system');	
	$conn = new mysqli('localhost', 'root', '', 'coop_system');
	//$conn= mysqli_connect ('localhost', 'root', '' , 'coop_system') or die('Not connected : Ah sh*t ' . mysqli_connect_error());	
	
if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
?>