<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Users List
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Users</li>
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
                <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> New</a>
              </div>
              <div class="box-body">
                <table id="example1" class="table table-bordered table-hover">
                  <thead>
                    <th>User Name</th>
                    <th>Firstname</th>
                    <th>Middlename</th>
                    <th>Lastname</th>
                    <th>Email</th>
                    <th>Access</th>
                    <th>Dept.</th>
                    <th>Photo</th>
                    <th>Tools</th>
                  </thead>
                  <tbody>
                    <?php
                    $sql = "SELECT fsu.*, fsd.dept_no FROM fs_users fsu left join fs_department fsd on fsd.id = fsu.department";
                    $query = $conn->query($sql);
                    while ($row = $query->fetch_assoc()) {
                      $image = (!empty($row['photo'])) ? '../images/' . $row['photo'] : '../images/profile.jpg';
                      echo "
                        <tr>
                          <td>" . $row['user_id'] . "</td>
                          <td>" . $row['firstname'] . "</td>
                          <td>" . $row['middlename'] . "</td>
                          <td>" . $row['lastname'] . "</td>
                          <td>" . $row['user_email'] . "</td>
                          <td>" . $row['access_level'] . "</td>
                          <td>" . $row['dept_no'] . "</td>
                          <td>
                            <img src='" . $image . "' width='30px' height='30px'>
                            <a href='#edit_photo' data-toggle='modal' class='pull-right photo' data-user_id='" . $row['user_id'] . "'><span class='fa fa-edit'></span></a>
                          </td>
                          <td>
                            <button class='btn btn-success btn-sm edit btn-flat' data-user_id='" . $row['user_id'] . "'><i class='fa fa-edit'></i> Edit</button>
                            <button class='btn btn-danger btn-sm delete btn-flat' data-user_id='" . $row['user_id'] . "'><i class='fa fa-trash'></i> Delete</button>
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
    <?php include 'includes/users_modal.php'; ?>
  </div>

  <?php include 'includes/scripts.php'; ?>
  <script>
    $(function() {

      $(document).ready(function() {
        $('#multiple-checkboxes').multiselect({
          includeSelectAllOption: true,
        });
      });

      $(document).ready(function() {
        $('#edit-multiple-checkboxes').multiselect({
          includeSelectAllOption: true,
        });
      });

      $(document).on('click', '.edit', function(e) {
        deselectmulti();
        e.preventDefault();
        $('#edit').modal('show'); // show the edit modal
        var user_id = $(this).data('user_id');
        getRow(user_id);
      });

      // delete a user
      $(document).on('click', '.delete', function(e) {
        e.preventDefault();
        $('#delete').modal('show'); // show the delete modal
        var user_id = $(this).data('user_id');
        getRow(user_id);
      });

      $(document).on('click', '.photo', function(e) {
        e.preventDefault();
        var user_id = $(this).data('user_id');
        getRow(user_id);
      });

    });

    function deselectmulti() {
      $("#edit-multiple-checkboxes").multiselect('rebuild');
      $("#edit-multiple-checkboxes").multiselect('destroy').multiselect();
      $("#edit-multiple-checkboxes").multiselect('clearSelection');
      $("#edit-multiple-checkboxes").multiselect('refresh');
    }


    function getRow(user_id) {
      var prevSelect = '';
      deselectmulti();
      $.ajax({
        type: 'POST',
        url: 'exe_user.php?view=row',
        data: {
          user_id: user_id
        },
        dataType: 'json',
        success: function(response) {
          prevSelect = ((response.access_level).split(","));

          // through class
          $('.id').val(response.id);

          // through id
          $('#user_id').val(response.user_id); // for delete user id
          $('#edit_userId').val(response.user_id); 
          $('#edit_firstname').val(response.firstname);
          $('#edit_middlename').val(response.middlename);
          $('#edit_lastname').val(response.lastname);
          $('#edit_emailadd').val(response.user_email);
          //$('#edit-multiple-checkboxes').val((response.access_level).split(","));	  
          $("#edit-multiple-checkboxes").multiselect('select', prevSelect);
          $('#edit_department').val(response.department);
          $('#edit_password').val(response.password);
          $('.fullname').html(response.firstname + ' ' + response.lastname);
          // console.log((response.access_level).split(","));
          // console.log('id:' + id);
        }
      });


    }
  </script>
</body>

</html>