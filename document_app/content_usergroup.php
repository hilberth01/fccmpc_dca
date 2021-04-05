<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>
  <?php include 'includes/functions.php'; ?>
  <?php include 'classes/user_group.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Approvers and Implementers Group
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Users</li>
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
              <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> New</a>
            </div>
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>				
                  <th>Groupname</th>
                  <th>Description</th>
                  <th>Members</th>
                  <th>Tools</th>
                </thead>
                <tbody>
                  <?php
                    $query = user_group::list_user_groups();
                    while($row = $query->fetch_assoc()){
					  $last_rec = last_record_ugroup($row['ug_id']);

					  if($last_rec==0){
						  $delete_btn = "<button class='btn btn-danger btn-sm delete btn-flat' data-id='".$row['id']."'><i class='fa fa-trash'></i> Delete</button>";
					  }else{
						  $delete_btn = "";
					  }						
                      echo "
                        <tr>
                          <td>".$row['ug_name']."</td>
                          <td>".$row['ug_description']."</td>
                          <td>".$row['ug_members']."</td>
                          <td>
                            <button class='btn btn-success btn-sm edit btn-flat' data-id='".$row['id']."'><i class='fa fa-edit'></i> Edit</button>
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
  <?php include 'includes/usergroup_modal.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	
  $('#pre-selected-options').multiSelect({
  selectableHeader: "<div class='custom-header'>Selectable Users</div>",
  selectionHeader: "<div class='custom-header'>Selected Users</div>"
  });
	
  $('#edit-selected-options').multiSelect({
  selectableHeader: "<div class='custom-header'>Selectable Users</div>",
  selectionHeader: "<div class='custom-header'>Selected Users</div>"
  });	

	$('#custom-headers').multiSelect({
	  selectableHeader: "<div class='custom-header'>Selectable items</div>",
	  selectionHeader: "<div class='custom-header'>Selection items</div>",
	  selectableFooter: "<div class='custom-header'>Selectable footer</div>",
	  selectionFooter: "<div class='custom-header'>Selection footer</div>"
	});

	
  $(document).on('click', '.edit', function(e){
    e.preventDefault();
	deselectmulti();
    $('#edit').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $(document).on('click', '.photo', function(e){
    e.preventDefault();
    var id = $(this).data('id');
    getRow(id);
  });

});

function deselectmulti(){
  //$('#edit-selected-options').multiselect('rebuild');
  //$('#edit-selected-options').multiselect('destroy').multiselect();
  //$('#edit-selected-options').multiselect('clearSelection');
  $('#edit-selected-options').multiSelect('deselect_all');
}


function getRow(id){
	var prevSelect = '';
	deselectmulti(); 
  $.ajax({
    type: 'POST',
    url: 'exe_usergroup.php?view=row',
    data: {id:id},
    dataType: 'json',
    success: function(response){
	  prevSelect = ((response.ug_members).split(","));
	  console.log('members:' + prevSelect);
      $('.id').val(response.id);
      $('#edit_gname').val(response.ug_name);
      $('#edit_gdescription').val(response.ug_description);
      $('#edit-selected-options').multiselect('select',prevSelect); //val((response.ug_members).split(","));
      $('.fullname').html(response.ug_name);
    }
  });
}
</script>
</body>
</html>
