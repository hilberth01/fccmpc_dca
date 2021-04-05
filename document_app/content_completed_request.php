<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>
    <?php include 'includes/functions.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Completed List
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Completed List</li>
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
                <span class="pull-right">
                  <a href="./?pid=complited_list&requester=<?php echo $user['user_id']; ?>" class="btn btn-success btn-sm btn-flat reset"><i class="fa fa-refresh"></i> My Request</a>
                </span>
              </div>
              <div class="box-body">
                <table id="example1" class="table table-bordered table-hover">
                  <thead>
                    <th class="hidden"></th>
                    <th>Control No</th>
                    <th>Rev.No</th>
                    <th>Document#</th>
                    <th>DocumentTitle</th>
                    <th>Attachment</th>
                    <th>Requestor</th>
                    <th>Status</th>
                    <th>Date Created</th>
                    <th>History</th>
                  </thead>
                  <tbody>
                    <?php



                    //if ((strpos($user['access_level'], 'Administrator') !== false) || ((strpos($crow['ug_members'], $user['user_id']) !== false) && ($allaw_approve == 'true'))){
                    if (strpos($user['access_level'], 'Administrator') !== false || strpos($user['access_level'], 'Approver') !== false) {
                      $sql = "SELECT rm.*,u.firstname, u.lastname 
							FROM fs_request_main rm 
							LEFT JOIN fs_users u on u.user_id=rm.rq_requestor 
							INNER JOIN (SELECT rq_name, MAX(rq_id) AS maxsign FROM fs_request_main WHERE rq_status = 'Completed' GROUP BY rq_name) ms ON rm.rq_id = ms.maxsign 
							ORDER BY rm.id DESC";
                    } else {
                      $users_id = $user['user_id'];
                      $sql = "SELECT rm.*,u.firstname, u.lastname 
							FROM fs_request_main rm 
							LEFT JOIN fs_users u on u.user_id=rm.rq_requestor 
							INNER JOIN (SELECT rq_name, MAX(rq_id) AS maxsign FROM fs_request_main WHERE rq_status = 'Completed' and rq_requestor = '{$users_id}' GROUP BY rq_name) ms ON rm.rq_id = ms.maxsign 
							ORDER BY rm.id DESC";
                    }

                    if (isset($_GET['requester'])) {
                              $users_id = $user['user_id'];
                              $sql = "SELECT rm.*,u.firstname, u.lastname 
                      FROM fs_request_main rm 
                      LEFT JOIN fs_users u on u.user_id=rm.rq_requestor 
                      INNER JOIN (SELECT rq_name, MAX(rq_id) AS maxsign FROM fs_request_main WHERE rq_status = 'Completed' and rq_requestor = '{$users_id}' GROUP BY rq_name) ms ON rm.rq_id = ms.maxsign 
                      ORDER BY rm.id DESC";

//                       $sql = "SELECT rm.*,u.firstname, u.lastname 
// FROM fs_request_main rm 
// where rm.rq_status = 'Completed';

                    }

                    $query = $conn->query($sql);

                    while ($row = $query->fetch_assoc()) {
                      $reqid = $row['rq_id'];
                      $lastStep = last_task($row['rq_id']);
                      $app_apex = $row['rq_status'];
                      $file_name = '';
                      $sqlfile = "SELECT * FROM fs_request_attachment WHERE file_id = '$reqid' ORDER BY id ASC";
                      $queryfile = $conn->query($sqlfile);
                      if ($user['user_id'] == $row['rq_requestor'] || (strpos($user['access_level'], 'Administrator') !== false)) {
                        while ($rowfile = $queryfile->fetch_assoc()) {
                          //$file_name .= (!empty($rowfile['file_name'])) ? '<a href="./file_dump/'.$rowfile['file_name'].'" download>'.$rowfile['file_name'].'</a>' : 'No File';
                          $file_name .= (!empty($rowfile['file_name'])) ? '<a href="./pdf_doc_viewer.php?fileid=' . $rowfile['file_name'] . '&reqid=' . $row['rq_id'] . '" target="_blank">' . $rowfile['file_name'] . '</a>' : 'No File';
                        }
                      } else {
                        $file_name .= '(hidden)';
                      }
                      if ($app_apex == 'New') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' data-id='" . $row['rq_id'] . "'><i class='fa fa-edit'></i> Edit</button>";
                        $rowClass = 'warning';
                      } else if ($app_apex == 'Completed') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' disabled><i class='fa fa-edit'></i> Edit</button>";
                        $edit_btn .= "<button class='btn btn-danger btn-sm cancel btn-flat' disabled><i class='fa fa-times-circle'></i> Cancel</button>";
                        $rowClass = 'success';
                      } else if ($app_apex == 'Approved' || $app_apex == 'Confirmed' || $app_apex == 'InProgress') {
                        $edit_btn = "<button class='btn btn-danger btn-sm cancel btn-flat' data-id='" . $row['rq_id'] . "'><i class='fa fa-times-circle'></i> Cancel</button>";
                        $rowClass = 'info';
                      } else if ($app_apex == 'Disapproved') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' data-id='" . $row['rq_id'] . "'><i class='fa fa-edit'></i> Edit</button>";
                        $rowClass = 'danger';
                      } else if ($app_apex == 'Cancelled') {
                        $edit_btn = "<button class='btn btn-success btn-sm edit btn-flat' disabled><i class='fa fa-edit'></i> Edit</button>";
                        $edit_btn .= "<button class='btn btn-danger btn-sm cancel btn-flat' disabled><i class='fa fa-times-circle'></i> Cancel</button>";
                        $rowClass = 'active';
                      } else {
                        $edit_btn = "<button class='btn btn-danger btn-sm cancel btn-flat' data-id='" . $row['rq_id'] . "'><i class='fa fa-times-circle'></i> Cancel</button>";
                        $rowClass = '';
                      }
                      echo "
                        <tr class='" . $rowClass . "'>
                          <td class='hidden'></td>
                          <td>" . $row['rq_id'] . "</td>
                          <td>" . $row['revision_id'] . "</td>
                          <td>" . $row['rq_name'] . "</td>
                          <td>" . $row['rq_description'] . "</td>
                          <td>" . $file_name . "</td>
                          <td>" . $row['firstname'] . " " . $row['lastname'] . "(" . $row['rq_requestor'] . ")</td>
                          <td>" . $row['rq_status'] . "</td>
                          <td>" . $row['rq_created'] . "</td>
                          <td><a href='#platform' data-toggle='modal' class='btn btn-info btn-sm btn-flat platform' data-id='" . $row['rq_id'] . "'><i class='fa fa-search'></i> View</a></td>
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
    <?php include 'includes/completed_request_modal.php'; ?>
  </div>

  <?php include 'includes/scripts.php'; ?>
  
  <script>
    $(function() {
      $(document).on('click', '.edit', function(e) {
        e.preventDefault();
        $('#edit').modal('show');
        var id = $(this).data('id');
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
        $('.info_title').html(id);
        fetch_approver(id);
      });

    });


    function fetch_approver(rid) {
      $.ajax({
        type: 'POST',
        url: 'fetch_log_history.php',
        data: {
          reqid: rid
        },
        dataType: 'json',
        success: function(response) {
          $('#content').html(response);
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
          $('#edit_rq_status').val(response.rq_status);
          $('#edit_rq_requestor').val(response.rq_requestor);
          $('#edit_rq_description').val(response.rq_description);
          //$('#posselect').val(response.position_id).html(response.description);      
          //$('#edit_platform').val(response.platform);
          $('.fullname').html(response.rq_id);
          $('#desc').html(response.rq_description);
        }
      });
    }
  </script>
</body>

</html>