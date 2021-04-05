<!DOCTYPE html>
<html class="no-js">

<head>
	<meta charset='UTF-8'>
	
	<title>Email Send PreLoader</title>
	
<style>
/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(images/loader-128x/Preloader_2.gif) center no-repeat #fff;
}
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>
	//paste this code under head tag or in a seperate js file.
	// Wait for window load
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");;
	});
</script>

</head>

<body>
	<!-- Paste this code after body tag -->
	<div class="se-pre-con"></div>
	<!-- Ends -->
	
	<div class="content">


<?php 
	include 'includes/session.php';	
	include 'includes/functions.php';
	include 'includes/functions_mail.php';
	
	if(isset($_SESSION['request_no']) || trim($_SESSION['request_no']) != ''){
		$reqNo = $_SESSION['request_no'];
		$nextpg = $_SESSION['next_page'];
		sleep(3);
		send_mail($reqNo);	
		
		
		unset($_SESSION['request_no']);
		unset($_SESSION['next_page']);
		header('location:'.$nextpg.'');
		
	}
	else{
		header('location: ./?pid=dashboard');
	}
	
?>
	</div>
		<style>
		.content {
			background: url(http://smallenvelop.com/wp-content/uploads/2014/08/simple-pre-loader.jpg
) center no-repeat;
			background-size: 100%;
			width: 100%;
		}
	</style>
</body>
</html>