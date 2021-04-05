<!-- Description -->
<div class="modal fade" id="platform">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b><span class="fullname"></span></b></h4>
            </div>
            <div class="modal-body">
                <p id="desc"></p>
				<div class="form-group">
					<div class="col-sm-9">
						 
                      				 
					

                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Task</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="exe_workflow_sequence.php?formid=<?php echo $id;?>" enctype="multipart/form-data">
				<input type="hidden" id="addn_form_id" name="form_id" value="<?php echo $id;?>">
				<input type="hidden" id="addn_approval_type" name="approvaltype" >
                <div class="form-group">
                    <label for="addn_form_name" class="col-sm-3 control-label">Description</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="addn_form_name" name="description" readonly>
                    </div>
                </div>
                <div class="form-group">
					<label for="worksteps" class="col-sm-3 control-label">Task Name</label>

                    <div class="col-sm-9">
						<select class="form-control" id="worksteps" name="worksteps" required>
						 <option value=''>Select Task Name</option>
                        <?php
                          $sql = "SELECT * FROM fs_workstpes";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['work_id']."'>".$row['work_name']."</option>
                            ";
                          }
                        ?>					 
						</select>

                    </div>
                </div>

				<h5 class="modal-title"><b class="fa fa-info-circle"></b><i> Please avoid from using duplicate TASK in a workflow</i></h5>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-primary btn-flat" name="addstep"><i class="fa fa-save"></i> Save</button>
              </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Edit Task Sequence</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="exe_workflow_sequence.php?formid=<?php echo $id;?>" enctype="multipart/form-data">
			  <input type="hidden" class="id" id="id" name="id">
                <div class="form-group">
                    <label for="edit_description" class="col-sm-3 control-label">Workflow</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_description" name="description" readonly>
                    </div>
                </div>
				<div class="form-group">
					<label for="edit_steps" class="col-sm-3 control-label">Task Name</label>

                    <div class="col-sm-9">
						<select class="form-control select2" data-toggle="select2" id="edit_steps" name="steps_id" required>						 
                        <?php
                          $sql = "SELECT * FROM fs_workstpes";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['work_id']."'>".$row['work_name']."</option>
                            ";
                          }
                        ?>					 
						</select>

                    </div>					
                </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-success btn-flat" name="edit"><i class="fa fa-check-square-o"></i> Update</button>
              </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete -->
<div class="modal fade" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Deleting...</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="exe_workflow_sequence.php?formid=<?php echo $id;?>">
                <input type="hidden" class="id" name="id">
                <div class="text-center">
                    <p>DELETE WORKFLOW</p>
                    <h2 class="bold fullname"></h2>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Delete</button>
              </form>
            </div>
        </div>
    </div>
</div>





     