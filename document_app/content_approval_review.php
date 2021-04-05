<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <?php include 'includes/navbar.php'; ?>
        <?php include 'includes/menubar.php'; ?>
        <?php include 'includes/functions.php'; ?>
        <?php include 'classes/request.php'; ?>
        <?php include 'classes/request_attachment.php'; ?>

        <div class="content-wrapper">
            <div class="container">

                <!-- Main content -->
                <section class="content">
                    <?php
					//$parse = parse_ini_file('./config.ini', FALSE, INI_SCANNER_RAW);
					//$title = $parse['election_title'];
					$tracker = (isset($_GET['track'])) ? $_GET['track'] : '';
					$title = "Approval Form";
					?>
                    <h1 class="page-header title"><b><?php echo strtoupper($title); ?></b></h1>
                    <div class="row">
                        <div class="col-sm-11 col-sm-offset-1">
                            <?php
							if (isset($_SESSION['error'])) {
							?>
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                                <ul>
                                    <?php
										foreach ($_SESSION['error'] as $error) {
											echo "
					        					<li>" . $error . "</li>
					        				";
										}
										?>
                                </ul>
                            </div>
                            <?php
								unset($_SESSION['error']);
							}
							if (isset($_SESSION['success'])) {
								echo "
				            	<div class='alert alert-success alert-dismissible'>
				              		<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
				              		<h4><i class='icon fa fa-check'></i> Success!</h4>
				              	" . $_SESSION['success'] . "
				            	</div>
				          	";
								unset($_SESSION['success']);
							}

							?>

                            <div class="alert alert-danger alert-dismissible" id="alert" style="display:none;">
                                <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                                <span class="message"></span>
                            </div>

                            <?php

							$request = new Request($tracker);

							if ($request->getStatus() == 'Completed') {
							?>
                            <div class="text-center">
                                <h3>This request already completed</h3>
                                <a href="#view" data-toggle="modal" class="btn btn-flat btn-primary btn-lg">
                                    Approval History</a>
                            </div>
                            <?php

							} else if ($request->getStatus() == 'Cancelled') {
							?>
                            <div class="text-center">
                                <h3>This request was cancelled.</h3>
                                <a href="#view" data-toggle="modal" class="btn btn-flat btn-primary btn-lg">
                                    Approval History</a>
                            </div>
                            <?php
							} else {
							?>
                            <!-- Approval Form -->
                            <?php
								include 'includes/slugify.php';

								$approvalform = '';
								$workflowName = '';
								$workflowType = '';
								$fileName = 'File: ';
								$instruct = '';
								$seriesCount = 1;

								$request = new Request($tracker);
								$request_id = $request->getRequest_id();
								$request_name = $request->getName();
								$request_desc = $request->getDescription();
								// $sql = "SELECT * FROM fs_request_main WHERE rq_id = '$tracker'";
								// $query = $conn->query($sql);

								//while ($row = $query->fetch_assoc()) {

								//	$sqlFile = "SELECT * FROM fs_request_attachment WHERE file_id = '$tracker'";
								//	$queryFile = $conn->query($sqlFile);

									$attachment = new RequestAttachement($tracker);

									if ($user['user_id'] == $request->Requestor()->getUser_id() || 
									(strpos($user['access_level'], 'DocAdmin') !== false) || 
									(strpos($user['access_level'], 'Administrator') !== false) || 
									(strpos($user['access_level'], 'Approver') !== false) ||
									(strpos($user['access_level'], 'Implementor') !== false)) 
									{
										if (!isset($attachment)){
											$fileName .= "No File Attachment<br>";
										} else {
                                            $fileName .= '<a href="./pdf_doc_viewer.php?fileid=' . $attachment->getFile_name() . '" target="_blank">' .  $attachment->getFile_name() . '</a>';
                                        }
									} else {
										$fileName .= '(hidden)';
									}

									echo '
											<div class="row">
												<div class="col-xs-12">
													<div class="box box-solid" id="' . $request_id . '">
														<div class="box-header with-border">
															<h3 class="box-title"><b>' . $request_id . '</b></h3>
														</div>
														<div class="box-body">
															<p><b>Document#: </b> <i>' . $request_name . '</i>
																<span class="pull-right">																	
																</span>
															</p>
															<p><b>Document Title: </b> <i>' . $request_desc . '</i>
																<span class="pull-right">																	
																</span>
															</p>
															<div id="candidate_list">
																<ul>
																	' . $fileName . '
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										';


									$sql = "SELECT fsw.*, fss.work_name, fss.approval_type, fss.confirm_type, fsg.ug_members
										FROM fs_workflow fsw 
										LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id 
										LEFT JOIN fs_user_group fsg ON fsg.ug_id=fss.approver 
										WHERE fsw.form_id='" . $request->getWokflow_id() . "' ORDER BY fsw.form_sequence ASC";
										
									$cquery = $conn->query($sql);
									while ($crow = $cquery->fetch_assoc()) {
										//from function 
										$slug = slugify($request_name);
										$checked = '';  //SELECT `id`, `rq_work_id`, `rq_step_id`, `rq_no`, `seq_no`, `user_approvers`, `rq_status`, `unix_date`, `app_user` FROM `fs_request_task_status`
										$ug_tbl_app = json_decode(get_appv_members($request_id, $crow['form_id'], $crow['form_steps_id']));
										$ug_tbl_app = json_decode(get_appv_members($request_id, $crow['form_id'], $crow['form_steps_id']));
										
										$approvedCount = get_appv_user_event($request_id, $crow['form_id'], $crow['form_steps_id']);
										 
										if ($request->isTaskHasDisapproval($crow['form_steps_id']) || $request->isTaskHasAnEmptyStatus($crow['form_steps_id'])){
											$approvedCount = 0;
										 }

										$obj_tbl_app = json_decode(get_appv_stat_event($request_id, $crow['form_id'], $crow['form_steps_id']));
										$obj_disapprv = json_decode(get_disapprove_stat($request_id));
										$approver = (!empty($obj_tbl_app->app_user)) ? "(" . $obj_tbl_app->app_user . ")" : "";
										$app_apex = (isset($obj_tbl_app->rq_status)) ? $obj_tbl_app->rq_status : "";
										$app_date = (!empty($obj_tbl_app->app_user)) ? date("Y-m-d H:i", $obj_tbl_app->unix_date) : "";
										$app_name = (isset($obj_tbl_app->firstname)) ? $obj_tbl_app->firstname . ' ' . $obj_tbl_app->lastname : "";
										$app_remarks = get_app_log_remarks($request_id, $crow['form_steps_id']); //(isset($obj_tbl_app->user_remarks)) ? $obj_tbl_app->user_remarks : "";
										$app_remarks = (!empty($obj_tbl_app->app_user)) ? $app_remarks : '';
										$usedisapprv = (isset($obj_disapprv->user_apex)) ? $obj_disapprv->user_apex : "";
										$userTaskapprv = (isset($ug_tbl_app->ug_members)) ? $ug_tbl_app->ug_members : $crow['ug_members'];


										if (isset($_SESSION['post'][$slug])) {
											$value = $_SESSION['post'][$slug];

											if (is_array($value)) {
												foreach ($value as $val) {
													if ($val == $crow['id']) {
														$checked = 'checked';
													}
												}
											} else {
												if ($value == $crow['id']) {
													$checked = 'checked';
												}
											}
										}
										$status_label_x = "<button type=\"button\" class=\"btn-danger platform\" data-platform=\"" . $crow['form_name'] . "\" data-reqest_id=\"" . $request_id . "\" data-wflow_id=\"" . $crow['form_id'] . "\" data-step_id=\"" . $crow['form_steps_id'] . "\"><i class=\"fa fa-times danger\"></i></button>";
										$status_label_p = "<button type=\"button\" class=\"btn-warning platform\" data-platform=\"" . $crow['form_name'] . "\" data-reqest_id=\"" . $request_id . "\" data-wflow_id=\"" . $crow['form_id'] . "\" data-step_id=\"" . $crow['form_steps_id'] . "\"><i class=\"fa fa-random warning\"></i></button>";
										$status_label_o = "<button type=\"button\" class=\"btn-success platform\" data-platform=\"" . $crow['form_name'] . "\" data-reqest_id=\"" . $request_id . "\" data-wflow_id=\"" . $crow['form_id'] . "\" data-step_id=\"" . $crow['form_steps_id'] . "\"><i class=\"fa fa-check success\"></i></button>";
										$workflowName = $crow['form_name'];
										$workflowType = $crow['form_approval_type'];
										$stepApprovalType = $crow['approval_type'];
										$confirmationType = $crow['confirm_type'];
										$lastState = last_state($request_id);


										$userTaskapprv = (isset($ug_tbl_app->ugname)) ? $ug_tbl_app->ugname : 'xxx';
										//var_dump($userTaskapprv);


										$member_array = explode(",", $userTaskapprv);
										$member_array = array_unique($member_array);
										$approver_total = count($member_array);

										//var_dump($member_array);

										if ($approver_total == $approvedCount) {
											$app_apex = $app_apex;

											
										} else {
											$app_apex = 'InProgress';
										}

										if ($app_apex == 'Approved' || $app_apex == 'Confirmed') {
											$seriesCount++;
										}

										

										/* 
											if($stepApprovalType == 'Series'){
												if($crow['form_sequence'] == $seriesCount){
													$allaw_approve = 'true';	
												}else{
													$allaw_approve = 'false';													
												}												
											}else{
												$allaw_approve = 'true';	
											}
											if($row['rq_requestor'] == $user['user_id']){
												$allaw_approve = 'false';
											} */
										if ($crow['form_sequence'] == $seriesCount) {
											$allaw_approve = 'true';
										} else {
											$allaw_approve = 'false';
										}

										//if ((strpos($user['access_level'], 'Administrator') !== false) || ((strpos($crow['ug_members'], $user['user_id']) !== false) && ($allaw_approve == 'true'))){
										if ((in_array($user['user_id'], $member_array)) && ($allaw_approve == 'true')) {

											if ($app_apex == 'Approved' || $app_apex == 'Confirmed') {
												$input = $status_label_o;
												//$appbtn = '<button type="button" class="btn btn-primary btn-sm btn-flat clist apex" data-platform="'.$crow['work_name'].'" data-reqest_id="'.$row['rq_id'].'" data-wflow_id="'.$crow['form_id'].'" data-step_id="'.$crow['form_steps_id'].'" disabled><i class="fa fa-retweet"></i> Change</button>';
												$appbtn = '<button type="button" class="btn btn-primary btn-sm btn-flat clist apex" disabled>
														   <i class="fa fa-retweet"></i> Done</button>';
												$rowClass = 'success';
											} else if ($app_apex == 'Disapproved' && $lastState == 'Disapproved') {

												$input = $status_label_x;
												$appbtn = '<button type="button" class="btn btn-danger btn-sm btn-flat clist apex" disabled><i class="fa fa-recycle"></i> Rejected</button>';
												$rowClass = 'danger';
											} else if (($app_apex == 'Disapproved' || $app_apex == 'InProgress' || $app_apex == 'Resubmit') && $lastState == 'Resubmit') {

												$input = $status_label_x;
												$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" data-platform="' 
												. $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' 
												. $crow['form_id'] . '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-recycle"></i> Evaluate</button>';
												$rowClass = 'danger';

											} else if ($usedisapprv == 'Disapproved' and $request_id == 'Disapproved') {
												$input = $status_label_p;
												$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" disabled><i class="fa fa-pencil"></i> Evaluate</button>';
												$rowClass = 'warning';
											} else {

												$task_id = $crow['form_steps_id'];
												// check if the user already approved the steps
												// if already approved the button will be disabled to prevent re-approved
												$is_approved = is_user_already_approved($request_id, $task_id, $user['user_id']);
												
												$isDisapproved = $request->isUserDisapprovedTheTask($task_id, $user['user_id']);

												$input = $status_label_p;

                                                if ($confirmationType == 'Concurrence') {
                                                    if ($is_approved) {
                                                        $appbtn = '<button type="button" disabled="true" class="btn btn-warning btn-sm btn-flat clist reviewal" data-platform="'
                                                        . $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' . $crow['form_id']
                                                        . '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-pencil"></i> Review</button>';
                                                    } else {
                                                        $appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist reviewal" data-platform="'
                                                        . $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' . $crow['form_id']
                                                        . '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-pencil"></i> Review</button>';
                                                    }
                                                } else if ($isDisapproved){
														$appbtn = '<button type="button" disabled="true" class="btn btn-warning btn-sm btn-flat clist apex" data-platform="' 
														. $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' . $crow['form_id'] 
														. '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-pencil"></i> Disapproved</button>';
												} else {
													if ($is_approved)
														$appbtn = '<button type="button" disabled="true" class="btn btn-warning btn-sm btn-flat clist apex" data-platform="' 
														. $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' . $crow['form_id'] 
														. '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-pencil"></i> Approved</button>';
													else
														$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" data-platform="' 
														. $crow['work_name'] . '" data-reqest_id="' . $request_id . '" data-wflow_id="' . $crow['form_id'] 
														. '" data-step_id="' . $crow['form_steps_id'] . '"><i class="fa fa-pencil"></i> Evaluate</button>';
												}

												$rowClass = 'warning';
											}
										} else {
											$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" disabled><i class="fa fa-pencil"></i> Evaluate</button>';
											if ($app_apex == 'Approved'  || $app_apex == 'Confirmed') {
												$input = $status_label_o;
												$appbtn = '<button type="button" class="btn btn-primary btn-sm btn-flat clist apex" disabled><i class="fa fa-retweet"></i> Done</button>';
												$rowClass = 'success';
											} else if ($app_apex == 'Disapproved') {
												$input = $status_label_x;
												$appbtn = '<button type="button" class="btn btn-danger btn-sm btn-flat clist apex" disabled><i class="fa fa-recycle"></i> Rejected</button>';
												$rowClass = 'danger';
											} else if ($usedisapprv == 'Disapproved') {
												$input = $status_label_p;
												$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" disabled><i class="fa fa-pencil"></i> Evaluate</button>';
												$rowClass = 'warning';
											} else {
												$input = $status_label_p;
												$appbtn = '<button type="button" class="btn btn-warning btn-sm btn-flat clist apex" disabled><i class="fa fa-pencil"></i> Evaluate</button>';
												$rowClass = '';
											}
										}


										//$image = (!empty($crow['form_approver'])) ? 'file_dump/'.$crow['id'] : '../images/profile.jpg';

										/*
											$approvalform .= '
												<li>
													<span class="cname clist">'.$input.' '.$crow['work_name'].'</span>
												</li>
												<li>
												<button type="button" class="btn btn-primary btn-sm btn-flat clist apex" data-platform="'.$crow['work_name'].'" data-reqest_id="'.$row['rq_id'].'" data-wflow_id="'.$crow['form_id'].'" data-step_id="'.$crow['form_steps_id'].'"><i class="fa fa-pencil"></i> Apex</button>
												Approver: '.$app_name.''.$approver.' - '.$app_apex.' - '.$app_date.'
												</li> 
											'; */


										$approvalform .= '<tr class="' . $rowClass . '">
												  <td class=\'hidden\'></td>
												  <td><div class=\'\'>' . $input . '</div></td>
												  <td>' . $crow['form_sequence'] . '</td>
												  <td>' . $crow['work_name'] . '</td>
												  <td>' . $app_name . ' ' . $approver . '</td>
												  <td>' . $app_apex . '</td>
												  <td>' . $app_date . '</td>
												  <td>' . $app_remarks . ' </td>
												  <td>' . $appbtn . '</td>
												</tr>
											  ';
									}

									$instruct = ($workflowType == 'Series') ? 'Sequence Approval, currently at ' . $row['rq_status'] . ' approver' : 'Parallel Approval';

									echo '
											<div class="row">
												<div class="col-xs-12">
													<div class="box box-solid" id="' . $request->getId() . '">
														<div class="box-header with-border">
															<h3 class="box-title"><b>' . $workflowName . '</b></h3>
														</div>
														<div class="box-body">
															<p>' . $instruct . '
																<span class="pull-right">
																	<a href="./?pid=approval_rev&track=' . $request_id . '" class="btn btn-success btn-sm btn-flat reset" data-desc="' . slugify($request_id) . '"><i class="fa fa-refresh"></i> Refesh</a>
																</span>
															</p>
															<div id="candidate_list">
																              <table id="example1" class="table table-bordered table-hover">
																				<thead>
																				  <th class="hidden"></th>
																				  <th><i class="fa fa-info"></i></th>
																				  <th>Seq</th>	
																				  <th>Task</th>	
																				  <th>Approver</th>
																				  <th>Status</th>
																				  <th>Date</th>
																				  <th>Remarks</th>
																				  <th>Action</th>
																				</thead>
																				<tbody>
																			' . $approvalform . '
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										';
									$approvalform = '';
								//}

								?>



                            <div class="text-center hhiden">
                                <a href="./?pid=approval" class='btn btn-success edit btn-flat'><i
                                        class="fa fa-file-text"></i> Back</a>
                                <button type="button" class="btn btn-primary btn-flat" id="logview"><i
                                        class="fa fa-check-square-o"></i> Log View</button>
                            </div>

                            <!-- End Voting Ballot -->
                            <?php
							}

							?>

                        </div>
                    </div>
                </section>

            </div>
        </div>

        <?php include 'includes/footer.php'; ?>
        <?php include 'includes/approval_review_modal.php'; ?>
    </div>

    <?php include 'includes/scripts.php'; ?>
    <script>
    $(function() {
        $('.content').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });

        $(document).on('click', '#logview', function(e) {
            e.preventDefault();
            $('#view').modal('show');
            var id = "<?php echo $tracker; ?>"; //$(this).data('id');
            showTable(id);
        });

        /* 	  $(document).on('click', '#user_apex', function(e){
        		e.preventDefault();
        		$('#preview_modal').modal('show');			
        		$('#apex').modal('hide');
        		$('#frm_apex').submit();
        		
        		return false;
        	  }); */


        $(document).on('click', '.apexx', function(e) {
            e.preventDefault();
            $('#apexx').modal('show');
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.reset', function(e) {
            e.preventDefault();
            var desc = $(this).data('desc');
            $('.' + desc).iCheck('uncheck');
        });

        $(document).on('click', '.apex', function(e) {
            e.preventDefault();
            $('#apex').modal('show');
            var platform = $(this).data('platform');
            var req_id = $(this).data('reqest_id');
            var wflw_id = $(this).data('wflow_id');
            var stp_id = $(this).data('step_id');
            $('.requestid').html(req_id);
            $('#plat_view').html(platform);
            $('#wflowid').val(wflw_id);
            fetch_table(req_id, wflw_id, stp_id);
        });

        $(document).on('click', '.reviewal', function(e) {
            e.preventDefault();
            $('#reviewal').modal('show');
            var platform = $(this).data('platform');
            var req_id = $(this).data('reqest_id');
            var wflw_id = $(this).data('wflow_id');
            var stp_id = $(this).data('step_id');
            $('.requestid').html(req_id);
            $('#plat_view').html(platform);
            $('#wflowid').val(wflw_id);
            fetch_table(req_id, wflw_id, stp_id);
        });

        $(document).on('click', '.platform', function(e) {
            e.preventDefault();
            $('#platform').modal('show');
            var platform = $(this).data('reqest_id');
            var headlabel = $(this).data('platform');
            var req_id = $(this).data('reqest_id');
            var wflw_id = $(this).data('wflow_id');
            var stp_id = $(this).data('step_id');
            $('.info_title').html(headlabel);
            fetch_approver(req_id, wflw_id, stp_id);
        });

        function fetch_table(rid, wlid, stpid) {
            console.log(rid + wlid + stpid);
            $.ajax({
                type: 'POST',
                url: 'exe_approval_review.php?showtable=row',
                data: {
                    reqid: rid,
                    wlid: wlid,
                    stpid: stpid
                },
                dataType: 'json',
                success: function(response) {
                    $('.flowname').html(response.form_name);
                    $('.stepname').html(response.work_name);
                    $('#req_id').val(response.rq_id);
                    $('#wlid').val(response.form_id);
                    $('#wlname').val(response.form_name);
                    $('#stpid').val(response.work_id);
                    $('#stpname').val(response.work_name);
                    $('.flowname_r').html(response.form_name);
                    $('.stepname_r').html(response.work_name);
                    $('#wlname_r').val(response.form_name);
                    $('#req_id_r').val(response.rq_id);
                    $('#wlid_r').val(response.form_id);
                    $('#stpid_r').val(response.work_id);
                    $('#stpname_r').val(response.work_name);
                    //console.log('rid:'+response.rq_id);
                    //console.log('wlid:'+response.form_name);
                    //console.log('stpid:'+response.work_name);
                }
            });
        }

        $('#preview').click(function(e) {
            e.preventDefault();
            var form_id = "<?php echo $tracker; ?>"; //$('#ballotForm').serialize();
            var reqnter = 0;
            $.ajax({
                type: 'POST',
                url: 'preview_approval_history.php?count=row',
                data: {
                    reqid: form_id
                },
                dataType: 'json',
                success: function(response) {
                    reqnter = response.numrows;
                    console.log('num reqA:' + reqnter);
                    //console.log('wlid:'+response.form_name);		  
                    //console.log('num reqB:'+reqnter);
                    if (reqnter == 0) {
                        $('.message').html('There is no approval history yet');
                        $('#alert').show();
                    } else {
                        showTable(form_id);
                        //console.log('form_id:'+form_id);
                    }
                    //console.log('stpid:'+response.work_name);	
                }
            });
        });

        function showTable(form_id) {
            console.log('form_id:' + form_id);
            $.ajax({
                type: 'POST',
                url: 'preview_approval_history.php?approval_history=view',
                data: {
                    reqid: form_id
                },
                dataType: 'json',
                success: function(response) {
                    console.log('form_id:' + form_id);
                    if (response.error) {
                        var errmsg = '';
                        var messages = response.message;
                        for (i in messages) {
                            errmsg += messages[i];
                        }
                        $('.message').html(errmsg);
                        $('#alert').show();
                        console.log('messages:' + messages);
                    } else {
                        $('#preview_modal').modal('show');
                        $('#preview_body').html(response.list);
                        console.log('responsemessages:' + response.list);
                    }
                }
            });
        }

        $('#load-image').hide();
        $('#load-imagerev').hide();
        $('form').on('submit', function() {
            var $loadImage = $('#load-image').show(); // show loading image
            var $loadImagerev = $('#load-imagerev').show(); // show loading image
            var $mailSubmit = $('#user_apex').prop('disabled', true); // disable the submit buttond
            var $mailSubmitrev = $('#user_apex_r').prop('disabled', true); // disable the submit buttond
            var $selected_approval = $("#sel_actiond").val();

            $('#load-image').show();
            //$mailSubmit.prop('disabled', false); // enable the submit button
            // do some stuff, and if it's okay:
            //$(this).off('#user_apex').submit();
            //$("#frm_apex").submit();

            if ($selected_approval == '')
                $selected_approval = "Confirm";

            if (confirm("Do you really want to " + $selected_approval + " the request?")) {
                //$loadImage.hide(); // hide loading image
                //$mailSubmit.prop('disabled', false); // enable the submit button
                $mailSubmit.hide(); // enable the submit button
                $mailSubmitrev.hide(); // enable the submit button
                return true;
            } else {
                $loadImage.hide(); // hide loading image
                $loadImagerev.hide(); // hide loading image
                $mailSubmit.prop('disabled', false); // enable the submit button
                $mailSubmitrev.prop('disabled', false); // enable the submit button
                return false;
            }

        });


        function fetch_approver(rid, wlid, stpid) {
            $.ajax({
                type: 'POST',
                url: 'fetch_approver_per_step.php',
                data: {
                    reqid: rid,
                    wlid: wlid,
                    stpid: stpid
                },
                dataType: 'json',
                success: function(response) {
                    $('#content').html(response).iCheck({
                        checkboxClass: 'icheckbox_flat-green',
                        radioClass: 'iradio_flat-green'
                    });
                }
            });
        }




    });
    </script>
</body>

</html>