<?PHP
    include 'includes/session.php';
	include 'includes/logger.php';	
	include 'includes/functions.php';
	include 'includes/functions_mail.php';
	include_once 'includes/class_approver.php';

    $rqid = 'FCCMPC-0000051';
    $wflow_id = '2APIRH90T71B3MO';
    $step_id = 'C3LAT85NIU21P7J';


    $getreqinfo = json_decode(get_request_info($rqid));		
    $requestor_id=$getreqinfo->rq_requestor;
    
    //var_dump($requestor_id);

    //$getAnchor = json_decode(get_flow_step_anchor($rqid));		
    //$setAchor = (isset($getAnchor->work_name)) ? $getAnchor->seq_no : 0;		
    $ug_tbl_app = json_decode(get_appv_members($rqid, $wflow_id, $step_id));
    $userTaskapprv = (isset($ug_tbl_app->ugname)) ? $ug_tbl_app->ugname : $ug_tbl_app->ug_members;
    $member_array = explode(",", $userTaskapprv);
    $uniq_list = array_unique($member_array);
    $approver_total = count($uniq_list);
    $required_number_approval= minimum_approval_needed($step_id);
    $approvedCount = get_appv_user_event($rqid, $wflow_id, $step_id);

    var_dump($approver_total);
    
    //var_dump($userTaskapprv);
    if(in_array($requestor_id,$uniq_list)){
			
        var_dump($uniq_list);

			
    }
    echo  $approvedCount."/".$approver_total;
    ?>