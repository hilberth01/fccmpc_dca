<?php
	//$conn = new mysqli('sql101.epizy.com', 'epiz_24868161', 'tuIqPc8koT', 'epiz_24868161_votesystem');
	$conn = new mysqli('localhost', 'user', 'user', 'coop_system_db');	

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
?>