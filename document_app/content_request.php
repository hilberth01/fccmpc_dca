<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <?php include 'includes/navbar.php'; ?>
        <?php include 'includes/menubar.php'; ?>
        <?php include 'includes/functions.php'; 
      
      
        ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <?php
        $pgtitle = "Request List";


        if (isset($_GET['status'])) {
          if ($_GET['status'] == 'Completed') {
            $pgtitle = "Completed Request";
          } else if ($_GET['status'] == 'Approved') {
            $pgtitle = "Pending Request";
          } else if ($_GET['status'] == 'Cancelled') {
            $pgtitle = "Cancelled Request";
          } else if ($_GET['status'] == 'All Documents') {
            $pgtitle = "All Documents";
          } else {
            $pgtitle = "Request List";
          }
        }
        ?>
                <h1>
                    <?php echo $pgtitle; ?>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Request</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <?php
     
        if (isset($_SESSION['error'])) {
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              " . $_SESSION['error'] . "
            </div>
          ";
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

                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"
                                    <?php 
                                      if (isset($_GET['status'])) { 
                                        ?> style="visibility: hidden" <?php 
                                    } ?>>
                                    <i class="fa fa-plus"></i> New</a>
                                <!-- <span class="pull-right">
                                    <a href="./?pid=request&requser=<?php echo $user['user_id']; ?>"
                                        class="btn btn-success btn-sm btn-flat reset"><i class="fa fa-refresh">
                                        </i> My Request
                                    </a>
                                </span> -->
                            </div>

                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-hover">
                                    <thead>
                                        <th class="hidden"></th>
                                        <th>Control No</th>
                                        <th>Rev.No</th>
                                        <th>Document</th>
                                        <th>Attachment</th>
                                        <th>Requestor</th>
                                        <th>Current Task</th>
                                        <th>Status</th>
                                        <th>Date Created</th>
                                        <th>Description</th>
                                        <th>Tools</th>
                                    </thead>

                                    <tbody>

                                        <?php
                    include 'classes/user.php';
                    include 'classes/workflow.php';
                    include 'classes/user_group.php';
                    include 'classes/request.php';
                    include 'classes/task.php';
                    include 'classes/request_approval.php';
                    include 'classes/request_attachment.php';

                    $status = 'Request';

                    if (isset($_GET['status'])) {
                      $status = $_GET['status'];
                    }

                    $filter_status = (isset($_GET['status'])) ? ' request.rq_status=\'' . $status . '\'' : ' 1=1';

                    // display all documents
                    if ($status == 'All Documents') {
                      $filter_status = ' 1=1';
                    }

                    if (isset($_GET['requser'])) {
                      $filter_status = ' request.rq_requestor=\'' . $_GET['requser'] . '\'';
                    }

                    $query = request:: list_requests($filter_status);

                    while ($row = $query->fetch_assoc()) {
                      $reqid = $row['rq_id'];

                      if ($status == 'Approved') { // pending
                       // $lastStep = next_task($row['rq_id']);
                      } else {
                        // $next_step =  next_task($row['rq_id']);

                        // if ($next_step == 'COMPLETED') {
                        //    continue;
                        // }
                        $lastStep = RequestApproval::get_last_task($row['rq_id']);
                      }

                      // $lastStep = next_task($row['rq_id']);

                      // if completed skip on the request list
                      // if (!isset($_GET['status'])) {
                      //   if ($lastStep == 'COMPLETED') continue;
                      // }

                      $lastState = RequestApproval::get_last_state($row['rq_id']);    // last_state($row['rq_id']);

                      //$attmnt_updated = last_attnt_update($row['rq_id']);
                      $attachment = new RequestAttachement($row['rq_id']);
                      $attmnt_updated = $attachment->is_attachment_updated();
                                       
                      $app_apex = $row['rq_status'];
                      $file_name = '';
                      $edit_btn = '';
                      $edit_attchment = '';
                      
                      // request attachment
                      $file_name =  $attachment->getFile_name();  //"SELECT * FROM fs_request_attachment WHERE file_id = '$reqid' ORDER BY id ASC";
                      //$queryfile = $conn->query($sqlfile);

                      $request = new Request($reqid);

                      $hasDisapproval = $request->isRequestHasDisapproval();

                      if ($user['user_id'] == $row['rq_requestor']) {
                          $file_name = (!empty($file_name)) ? '<a href="./file_dump/' . $file_name . '" download>' . 
                          $file_name . '</a>' : 'No File';

                          if ($hasDisapproval) {
                            $edit_attchment = "<a href='#edit_photo' data-toggle='modal' class='pull-right refile' data-id='" . 
                            $row['rq_id'] . "'><span class='fa fa-edit'></span></a><br>";  //update attchment btn
                          }

                      } else {
                        $file_name .= '(hidden)';
                      }

                      // for new request, display the request on the requestor itself
                      if ($app_apex == 'New' and $user['user_id'] == $row['rq_requestor']) {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' data-id='" . $row['rq_id'] . "'>
                        <i class='fa fa-edit'></i> Edit</button>";
                        $edit_btn .= " <button class='btn btn-danger btn-sm cancel btn-flat' data-id='" . $row['rq_id'] . "'>
                        <i class='fa fa-times-circle'></i> Cancel</button>";
                        $edit_attchment = "<a href='#edit_photo' data-toggle='modal' class='pull-right refile' data-id='" . $row['rq_id'] . "'>
                        <span class='fa fa-edit'></span></a><br>";  //update attchment btn

                        // for completed request
                      } else if ($app_apex == 'Completed') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' disabled><i class='fa fa-edit'>
                        </i> Edit</button>";
                        $edit_btn .= " <button class='btn btn-danger btn-sm cancel btn-flat' disabled>
                        <i class='fa fa-times-circle'></i> Cancel</button>";

                        // for approved, confirmed but has disapproval (display on the requestor)
                      } else if (($app_apex == 'Approved' || $app_apex == 'Confirmed') 
                          and $user['user_id'] == $row['rq_requestor'] and (!$hasDisapproval )) {
                        $edit_btn = "<button class='btn btn-danger btn-sm cancel btn-flat' data-id='" . $row['rq_id'] . "'>
                        <i class='fa fa-times-circle'></i> Cancel</button>";
                      
                        // contain disapproval list the request on the Requestor
                        // and display the attachment
                      } else if ($hasDisapproval and $user['user_id'] == $row['rq_requestor']) {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' data-id='" . $row['rq_id'] . "'>
                        <i class='fa fa-edit'></i> Edit</button>";

                        // if ($lastState != 'Resubmit' and $attmnt_updated == "Yes") {
                        if ($attmnt_updated == "Yes") {
                          // display the resubmit button if the attachement is updated
                          $edit_btn .= " <button class='btn btn-primary btn-sm resubmit btn-flat' data-id='" . 
                          $row['rq_id'] . "' data-wflow='" . $row['rq_workflow'] . "'>
                          <i class='fa fa-edit'></i> Resubmit</button>";
                        }

                         $edit_attchment = "<a href='#edit_photo' data-toggle='modal' class='pull-right refile' data-id='" . 
                         $row['rq_id'] . "'><span class='fa fa-edit'></span></a><br>";  //update attchment btn
                      } 
                      
                      
                       else if ($app_apex == 'Cancelled') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' disabled>
                        <i class='fa fa-edit'>
                        </i> Edit</button>";
                        $edit_btn .= " <button class='btn btn-danger btn-sm cancel btn-flat' disabled>
                        <i class='fa fa-times-circle'></i> Cancel</button>";

                      } else {

                        $edit_btn = "<button class='btn btn-danger btn-sm cancel btn-flat' disabled>
                        <i class='fa fa-times-circle'></i> Cancel</button>";
                      }

                      //row color coding
                      if ($app_apex == 'New') {
                        $rowClass = 'warning';
                      } else if ($app_apex == 'Completed') {
                        $rowClass = 'success';
                      } else if ($app_apex == 'Approved' || $app_apex == 'Confirmed') {
                        $rowClass = 'info';
                      } else if ($app_apex == 'Disapproved') {
                        $rowClass = 'danger';
                      } else if ($app_apex == 'Cancelled') {
                        $rowClass = 'active';
                      } else {
                        $rowClass = '';
                      }

                      echo "
                        <tr class='" . $rowClass . "'>
                          <td class='hidden'></td>
                          <td>" . $row['rq_id'] . "</td>
                          <td>" . $row['revision_id'] . "</td>
                          <td>" . $row['rq_name'] . "</td>
                          <td>
                            " . $file_name . "
                            " . $edit_attchment . "
                          </td>
                          <td>" . $row['firstname'] . " " . $row['lastname'] . "(" . $row['rq_requestor'] . ")</td>
						              <td>" . $lastStep . "</td>
                          <td>" . $row['rq_status'] . "</td>
                          <td>" . $row['rq_created'] . "</td>
                          <td><a href='#platform' data-toggle='modal' class='btn btn-info btn-sm btn-flat platform' data-id='" . $row['rq_id'] . "'><i class='fa fa-search'></i> View</a></td>
                          <td>
                            " . $edit_btn . "
                            
                          </td>
                        </tr>
                      ";
                    }
                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <?php include 'includes/footer.php'; ?>
        <?php include 'includes/request_modal.php'; ?>
    </div>

    <?php include 'includes/scripts.php'; ?>

    <script>
    $(function() {

        var $add_task_fld = $('#task').prop('disabled', true);
        var $add_sel_group = $('#app_group').prop('disabled', true);
        var $add_sel_group_val = $('#app_group_val').prop('disabled', true);


        $add_task_fld.hide();
        $add_sel_group.hide();
        $add_sel_group_val.hide();

        $(document).on('click', '.addbtn', function(e) {
            e.preventDefault();
            $('#addnew').modal('hide');
            //var id = $(this).data('id');
            //getRow(id);
        });

        $("#workflow").change(function() {
            //$('#fileUploadModal').modal('show');
            //alert($(this).val());
            var id = $(this).val();

            getTaskUGroup(id);

            $add_task_fld.show();
            $add_sel_group.show();
            $add_sel_group_val.show();
            $('#app_group_val').prop('disabled', false).show();

            $add_task_fld.prop('disabled', false);
            $add_sel_group.prop('disabled', false);
            $add_sel_group_val.prop('disabled', false);

        });

        $(document).on('click', '.edit', function(e) {
            e.preventDefault();
            $('#edit').modal('show');
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.resubmit', function(e) {
            e.preventDefault();
            $('#resubmit').modal('show');
            var id = $(this).data('id');
            var flowid = $(this).data('wflow');
            getRow(id);
        });

        $(document).on('click', '.delete', function(e) {
            e.preventDefault();
            $('#delete').modal('show');
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.cancel', function(e) {
            e.preventDefault();
            $('#cancel').modal('show');
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.refile', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            getRowFile(id);
        });

        $(document).on('click', '.platform', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            getRow(id);
        });


        $('#load-image').hide();
        $('#load-image_anew').hide();
        $('form').on('submit', function() {
            var $loadImageNew = $('#load-image_anew').show(); // show loading image
            var $loadImage = $('#load-image').show(); // show loading image
            var $addSubmit = $('#addbtn').prop('disabled', true); // disable the submit button
            var $resSubmit = $('#resubmitbtn').prop('disabled', true); // disable the submit button

            $('#load-image').show();

            if (confirm('Do you really want to submit this request?')) {
                //$loadImage.hide(); // hide loading image
                //$mailSubmit.prop('disabled', false); // enable the submit button
                $addSubmit.hide(); // enable the submit button
                $resSubmit.hide(); // enable the submit button		
                return true;
            } else {
                $loadImageNew.hide(); // hide loading image
                $loadImage.hide(); // hide loading image
                $addSubmit.prop('disabled', false); // enable the submit button
                $resSubmit.prop('disabled', false); // enable the submit button
                return false;
            }

        });

    });

    function deselectmulti() {
        $("#app_group_val").multiselect('rebuild');
        $("#app_group_val").multiselect('destroy').multiselect();
        $("#app_group_val").multiselect('clearSelection');
        $("#app_group_val").multiselect('refresh');
    }

    function getTaskUGroup(id) {
        var strApprover = '';
        var task_id;
        var splitstr;

        $('.task').val('');
        $('.task_id').val('');

        $.ajax({
            type: 'POST',
            url: 'exe_request.php?task_usergroup=view',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                strApprover = response.ugname;
                //$('.task').val(id);
                $('.task').val(response.work_name);
                $('.task_id').val(response.form_steps_id);

                task_id = $('#task_id').val();

                if (task_id == '') {
                    $('#task').prop('disabled', true).hide();
                    $('#app_group').prop('disabled', true).hide();
                    $('.app_group').prop('disabled', true).hide();
                    $('#app_group_val').prop('disabled', true).hide();
                    $('.task').val('');
                    $('.task_id').val('');
                    $("#app_group_val").attr('required', false);
                    deselectmulti();
                } else {
                    $('#app_group_val').multiselect({
                        //includeSelectAllOption: true,
                    });

                    $("#app_group_val").attr('required', true);
                    $('.app_group')
                        .find('option')
                        .remove()
                        .end()
                    $('.app_group').append('<option value="">-Select-</option>');
                    $(".app_group").val('Select');;

                    i = 0;
                    splitstr = response.approver.split(',');

                    response.ugname.split(',').forEach(function(c) {
                        //console.log(response.ugname);
                        // Append the option to select
                        $('.app_group').append('<option value="' + splitstr[i] + '">' + c +
                            '</option>');

                        // Set the select value with new option
                        $(".app_group").val(c);
                        i++;
                    });

                    $('select[name=app_group]').val('');
                    //$(".app_group").section.refresh;
                    deselectmulti();
                }

            }
        });

    }




    function getRowFile(id) {
        $.ajax({
            type: 'POST',
            url: 'exe_request.php?attmtbl=view',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('.id').val(id);
                $('#edit_file_id').val(response.file_id);
                $('#edit_file_name').val(response.file_name);
                //$('#posselect').val(response.position_id).html(response.description);      
                $('#edit_uploader').val(response.file_uploader);
                $('.fullname').html(response.file_id);
                $('#unix').html(response.file_unix);
            }
        });
    }

    function getRow(id) {
        $.ajax({
            type: 'POST',
            url: 'exe_request.php?maintbl=view',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('.id').val(response.id);
                $('#edit_rq_name').val(response.rq_name);
                $('#edit_rq_workflow').val(response.rq_workflow);
                $('.edit_rq_workflow_id').val(response.rq_workflow);
                $('#edit_rq_status').val(response.rq_status);
                $('#edit_rq_requestor').val(response.rq_requestor);
                $('#edit_rq_description').val(response.rq_description);
                $('#edit_revno').val(response.revision_id);
                //$('#posselect').val(response.position_id).html(response.description);      
                //$('#edit_platform').val(response.platform);
                $('.fullname').html(response.rq_id);
                $('.reqid_res').val(response.rq_id);
                $('#desc').html(response.rq_description);
            }
        });
    }
    </script>

</body>

</html>