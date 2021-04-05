<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <?php include 'includes/navbar.php'; ?>
        <?php include 'includes/menubar.php'; ?>
        <?php include 'includes/functions.php'; ?>
        <?php include 'classes/workflow.php'; ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Workflows
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Workflow</li>
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
                                <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i
                                        class="fa fa-plus"></i> New</a>
                            </div>
                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-hover">
                                    <thead>
                                        <th class="hidden"></th>
                                        <th>Description</th>
                                        <th>Settings</th>
                                        <th>Tools</th>
                                    </thead>
                                    <tbody>
                                        <?php

                  $query = workflow::list_workflow_group();
                    while($row = $query->fetch_assoc()){
                        //$image = (!empty($row['photo'])) ? '../images/'.$row['photo'] : '../images/profile.jpg';
                    //<a href='#platform' data-toggle='modal' class='btn btn-info btn-sm btn-flat platform' data-id='".$row['id']."'><i class='fa fa-search'></i> View</a>
                    $last_rec_flow = last_record_workflow($row['form_id']);
                    
                    if($last_rec_flow==0){
                      $delete_btn = "<button class='btn btn-danger btn-sm delete 
                      btn-flat' data-id='".$row['form_id']."'>
                      <i class='fa fa-trash'>
                      </i> Delete</button>";
                    }else{
                      $delete_btn = "";
                    }                     

					 echo "
                        <tr>
                          <td class='hidden'></td>
                          <td>".$row['form_name']."</td>
						              <td>
						                <a href='./?pid=workflow_sequence&id=".$row['form_id']."' 
                            data-toggle='modal' class='btn btn-primary 
                            btn-sm btn-flat platform' data-id='".$row['form_id']."'>
                            <i class='fa fa-wrench'></i> Steps List</a>
            							</td>
                          <td>
                            <button class='btn btn-success btn-sm edit btn-flat' 
                            data-id='".$row['form_id']."'><i class='fa fa-edit'></i> Edit</button>
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
        <?php include 'includes/workflow_group_modal.php'; ?>
    </div>
    <?php include 'includes/scripts.php'; ?>


    <script>
    $(function() {

        $(document).ready(function() {
            $('#worksteps').multiselect({
                nonSelectedText: 'Select Work Step',
                buttonWidth: 250,
                enableFiltering: true
            });
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
            var id = $(this).data('id');
            fetch_form(id);
        });

        $(document).on('click', '.photo', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            getRow(id);
        });

        $(document).on('click', '.platform', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            fetch_table(id);
        });


    });

    function fetch_table(id) {
        $.ajax({
            type: 'POST',
            url: 'exe_workflow_group.php?showtable=row',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('#view_table_desc').html(response);
            }
        });
    }


    function fetch_form(id) {
        $.ajax({
            type: 'POST',
            url: 'exe_workflow_group.php?group=row',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('#grp_form_id').val(response.form_id);
                $('#grp_form_name').val(response.form_name);
                $('#grp_approval_type').val(response.form_approval_type);
                $('.fullnameflow').html(response.form_name);
            }
        });
    }

    function getRow(id) {
        $.ajax({
            type: 'POST',
            url: 'exe_workflow_group.php?view=row',
            data: {
                id: id
            },
            dataType: 'json',
            success: function(response) {
                $('.id').val(response.id);
                $('#form_id').val(response.form_id);
                $('#edit_description').val(response.form_name);
                $('#edit_approval_type').val(response.form_approval_type);
                $('.fullname').html(response.work_name);
            }
        });
    }
    </script>

</body>

</html>