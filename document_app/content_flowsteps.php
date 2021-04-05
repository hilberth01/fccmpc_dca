<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <?php include 'includes/navbar.php'; 
              include 'includes/menubar.php'; 
              include 'includes/functions.php'; 
              include 'classes/task.php';  ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Task
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Task</li>
                </ol>
            </section>
            <!-- Main content -->
            <section class="content">
                <?php
        if(isset($_SESSION['error'])){
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              ".$_SESSION['error']."
            </div>
          ";
          unset($_SESSION['error']);
        }
        if(isset($_SESSION['success'])){
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              ".$_SESSION['success']."
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
                                    data-toggle="tooltip" data-placement="top" title="Create new step"><i
                                        class="fa fa-plus"></i> New</a>
                            </div>
                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-hover">
                                    <thead>
                                        <th class="hidden"></th>
                                        <th>TaskName</th>
                                        <th>Approver</th>
                                        <th>ApprovalType </th>
                                        <th d-none d-sm-table-cell>ConfirmationType </th>
                                        <th d-none d-sm-table-cell>Duration</th>
                                        <th class="d-none d-sm-table-cell">RejectFirst</th>
                                        <th class="d-none d-sm-table-cell">RejectChange</th>
                                        <th class="d-block d-sm-none">RejectAnchor</th>
                                        <th class="d-block d-sm-none">SelectGroup</th>
                                        <th>Tools</th>
                                    </thead>
                                    <tbody>
                                        <?php

        // list the task with the approvers
          $query = task::list_task_with_approvers();

            while ($row = $query->fetch_assoc()) {
         $last_rec_task = last_record_step($row['work_id']);
                      
         if ($last_rec_task==0) {
             $delete_btn = "<button class='btn btn-danger btn-sm delete btn-flat' 
                data-id='".$row['wid']."' >
                <i class='fa fa-trash'></i> Delete</button>";
         } else {
             $delete_btn = "";
         }
                      
         echo "
                        <tr>
                          <td class='hidden'></td>
                          <td>".$row['work_name']."</td>
						              <td>".get_usergroup_record($row['approver'])."</td>
                          <td>".$row['approval_type']."</td>
                          <td>".$row['confirm_type']."</td>
                          <td>".$row['time_window']." Day/s</td>
                          <td>".$row['reject_first']."</td>
                          <td>".$row['reject_change']."</td>
                          <td>".$row['reject_anchor']."</td>
                          <td>".$row['select_group']."</td>
                          <td>
                          
                            <button class='btn btn-success btn-sm edit btn-flat' 
                            data-id='".$row['wid']."' readonly><i class='fa fa-edit'></i> Edit</button>
                            ".$delete_btn."
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
        <?php include 'includes/flowsteps_modal.php'; ?>
    </div>
    <?php include 'includes/scripts.php'; ?>
    <script>
    $(function() {

        $('#pre-selected-options').multiSelect({
            selectableHeader: "<div class='custom-header'>Selectable Users Group</div>",
            selectionHeader: "<div class='custom-header'>Selected Users Group</div>"
        });

        $('#edit-selected-options').multiSelect({
            selectableHeader: "<div class='custom-header'>Selectable Users Group</div>",
            selectionHeader: "<div class='custom-header'>Selected Users Group</div>"
        });

        $(document).on('click', '.edit', function(e) {
            e.preventDefault();
            $('#edit').modal('show');
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.delete', function(e) {
            e.preventDefault();
            $('#delete').modal('show');
            var id =  $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.photo', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.platform', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            getRow(id);
        });

    });


    function deselectmulti() {
        //$('#edit-selected-options').multiselect('rebuild');
        //$('#edit-selected-options').multiselect('destroy').multiselect();
        //$('#edit-selected-options').multiselect('clearSelection');
        $('#edit-selected-options').multiSelect('deselect_all');
    }

    function getRow(id) {
        var prevSelect = '';
        $.ajax({
            type: 'POST',
            url: 'exe_flowsteps.php?view=row',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('.id').val(response.id);
                $('.wid').val(response.wid);
                console.log(response.id);
                prevSelect = ((response.approver).split(","));
                $('#edit_description').val(response.work_name);
                $('#edit_usergroup').val(response.approver);
                $('#edit-selected-options').multiselect('select', prevSelect);
                $('#edit_approvaltype').val(response.approval_type);
                $('#edit_confirmtype').val(response.confirm_type);
                $('#edit_timewindow').val(response.time_window);
                $('#edit_rejectfirst').val(response.reject_first);
                $('#edit_rejectchange').val(response.reject_change);
                $('#edit_rejectanchor').val(response.reject_anchor);
                $('#edit_selectgroup').val(response.select_group);
                $('#edit_needed_approval').val(response.needed_approval);
                $('.fullname').html(response.work_name);
            }
        });
    }
    </script>
</body>

</html>