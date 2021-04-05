<?php 

function get_client_ip() {
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}
//$PublicIP = get_client_ip();


function attrib_logger($pname, $paction, $puser, $pattrib){
		$conn = $GLOBALS['conn'];
		//SELECT `id`, `page_name`, `page_action`, `page_attrib`, `page_user`, `date_update` FROM `fs_attribute_logger` WHERE 1

	
		$publicIP = get_client_ip();
		$date_time = time();
		$sql = "INSERT INTO fs_attribute_logger (page_name, page_action, page_attrib, page_user, user_ip, date_update) 
										VALUES ('$pname', '$paction', '$pattrib', '$puser', '$publicIP', '$date_time')";
		
		if($conn->query($sql)){
			return 'saved';
		}
		else{
			return $conn->error;
		}
		$conn->close();
		
}		
?>