<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>
	
	<?php
	$id = $_GET['id'];
	$sql = "SELECT * FROM fs_workflow WHERE form_id='$id'";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();
	?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Arrange Sequence 
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#"><i class="fa fa-arrow-down"></i> Workflow</a></li>
        <li class="active">Arrange Sequence</li>
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
          <h3>Flow: <b><?php echo $row['form_name'];?></b>
            <span class="pull-right">
				<a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat" data-id="<?php echo $id;?>"><i class="fa fa-plus"></i>Add New Task</a>              
            </span>
          </h3>
        </div>
			
		
        <div class="col-xs-10 col-xs-offset-1" id="content">        
      </div>
	 </div>
    </section>

    
	</div>

    
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/workflow_sequence_modal.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	fetch();
	fetch_form('<?php echo $id;?>');

   $(document).ready(function() { 
        $('#worksteps').multiselect({ 
        nonSelectedText: 'Select Work Step', 
        buttonWidth: 250, 
        enableFiltering: true 
        }); 
   }); 

   $(document).ready(function() { 
        $('#ug_name').multiselect({ 
        nonSelectedText: 'Select User Group', 
        buttonWidth: 250, 
        enableFiltering: true 
        }); 
   }); 

/*    $(document).ready(function() { 
        $('#edit_steps').multiselect({ 
        nonSelectedText: 'Select Work Step', 
        buttonWidth: 250, 
        enableFiltering: true 
        }); 
   }); 

   $(document).ready(function() { 
        $('#edit_ug_name').multiselect({ 
        nonSelectedText: 'Select User Group', 
        buttonWidth: 250, 
        enableFiltering: true 
        }); 
   });  
   */

  $(document).on('click', '.reset', function(e){
    e.preventDefault();
    var desc = $(this).data('desc');
    $('.'+desc).iCheck('uncheck');
  });

  $(document).on('click', '.moveup', function(e){
    e.preventDefault();
    var id = $(this).data('id');
    $('#'+id).animate({
      'marginTop' : "-300px"
    });
    $.ajax({
      type: 'POST',
      url: 'exe_workflow_up.php?form_id=<?php echo $_GET['id']?>',
      data:{id:id},
      dataType: 'json',
      success: function(response){
        if(!response.error){
          fetch();
        }
      }
    });
  });

  $(document).on('click', '.movedown', function(e){
    e.preventDefault();
    var id = $(this).data('id');
    $('#'+id).animate({
      'marginTop' : "+300px"
    });
    $.ajax({
      type: 'POST',
      url: 'exe_workflow_down.php?form_id=<?php echo $_GET['id']?>',
      data:{id:id},
      dataType: 'json',
      success: function(response){
        if(!response.error){
          fetch();
        }
      }
    });
  });

  $(document).on('click', '.addnew', function(e){
    e.preventDefault();
    $('#addnew').modal('show');
    var id = $(this).data('id');
	fetch_form(id);
  });
  
  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id,'step');
  });

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
	deselectmulti();
    $('#edit').modal('show');
    var id = $(this).data('id');
    getRow(id,'step');
  });

});

function deselectmulti(){
	//task name reset
  //$("#edit_steps").multiselect('rebuild');
  //$("#edit_steps").multiselect('destroy').multiselect();
  //$("#edit_steps").multiselect('clearSelection');
  //$("#edit_steps").multiselect('refresh');
  //$('#edit_steps').multiSelect('deselect');
  //$("#edit_steps option[value]").prop("selected", false);
	//user group reset
  //$("#edit_ug_name").multiselect('rebuild');
  //$("#edit_ug_name").multiselect('destroy').multiselect();
  //$("#edit_ug_name").multiselect('clearSelection');
  //$("#edit_ug_name").multiselect('refresh');
  //$('#edit_ug_name').multiSelect('deselect');
   //$("#edit_ug_name option[value]").prop("selected", false);
  //$("#edit_ug_name:selected").prop("selected", false);
  //$("#edit_ug_name").multiselect('refresh');
}

function fetch(){
  $.ajax({
    type: 'POST',
    url: 'fetch_workflow_sequence.php',
	data: {id:'<?php echo $id;?>'},
    dataType: 'json',
    success: function(response){
      //$('#content').html(response).iCheck({checkboxClass: 'icheckbox_flat-green',radioClass: 'iradio_flat-green'});
      $('#content').html(response);
    }
  });
}

function fetch_form(id){
  $.ajax({
    type: 'POST',
    url: 'exe_workflow_sequence.php?view=row',
	data: {id:id},
    dataType: 'json',
    success: function(response){
      $('#addn_form_id').val(response.form_id);
      $('#addn_form_name').val(response.form_name);
      $('#addn_approval_type').val(response.form_approval_type);
    }
  });
}

function getRow(id,filter){
  
  $.ajax({
    type: 'POST',
    url: 'exe_workflow_sequence.php?maintbl=row',
    data: {id:id,filter:filter},
    dataType: 'json',
    success: function(response){
		deselectmulti();
      $('.id').val(response.id);
      $('#form_id').val(response.form_id);
      $('#edit_description').val(response.form_name);
      $('#edit_steps').val(response.form_steps_id); //.val(response.form_steps_id);  .multiselect('select',response.form_steps_id);
	  $('#edit_ug_name').val(response.form_approver);  // .multiselect('select',response.form_approver);
      $('#edit_work_name').val(response.work_name);
      $('#edit_sequence').val(response.form_sequence);
      $('#edit_approval_type').val(response.form_approval_type);
      $('.fullname').html(response.work_name);
    }
  });
}

</script>
</body>
</html>
