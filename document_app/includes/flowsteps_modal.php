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
              <form class="form-horizontal" method="POST" action="exe_flowsteps.php" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="description" class="col-sm-3 control-label">Task Name</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                </div>
                <div class="form-group">
					<label for="usergroup" class="col-sm-3 control-label">User Group</label>

                    <div class="col-sm-9">
					<!--	<select class="form-control" id="usergroup" name="usergroup" required>
						<option value="" selected>- Select -</option> -->
						<select id='pre-selected-options' multiple='multiple' name="usergroup[]" required>
						<optgroup label="By User Group">
                        <?php
                          $sql = "SELECT * FROM fs_user_group";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['ug_id']."'>".$row['ug_name']."</option>
                            ";
                          }
                        ?>
						</optgroup>			 
						</select>

                    </div>
                </div>
                <div class="form-group">
					<label for="approvaltype" class="col-sm-3 control-label">Approval Type</label>

                    <div class="col-sm-9">
						<select class="form-control" id="approvaltype" name="approvaltype" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'approvaltype' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
						</select>

                    </div>
                </div>
                <div class="form-group">
					<label for="confirmtype" class="col-sm-3 control-label">Confirmation Type</label>

                    <div class="col-sm-9">
						<select class="form-control" id="confirmtype" name="confirmtype" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'confirmation_type' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
						</select>

                    </div>
                </div>
				<div class="form-group">
                    <label for="timewindow" class="col-sm-3 control-label">Duration</label>

                    <div class="col-sm-9">
                      <input type="number" class="form-control" max="100" min="0" id="timewindow" name="timewindow" placeholder="Number of days" required>					   
                    </div>
                </div>
                <div class="form-group">
                    <label for="rejectfirst" class="col-sm-3 control-label">Reject First</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="rejectfirst" name="rejectfirst" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rejectchange" class="col-sm-3 control-label">Reject Change</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="rejectchange" name="rejectchange" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rejectanchor" class="col-sm-3 control-label">Reject Anchor</label>
                    <div class="col-sm-9">                    
					<select class="form-control" id="rejectanchor" name="rejectanchor" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'yes_no' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
					</select>
					</div>
                </div>
                <div class="form-group">
                    <label for="selectgroup" class="col-sm-3 control-label">Can Select Group</label>
                    <div class="col-sm-9">                    
					<select class="form-control" id="selectgroup" name="selectgroup" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'yes_no' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
					</select>
					</div>
                </div>				
                <div class="form-group">
                    <label for="needed_approval" class="col-sm-3 control-label">No. approval Needed</label>

                    <div class="col-sm-9">
                      <input type="number" class="form-control" id="needed_approval" name="needed_approval" min="0" max="50" placeholder="Minimum number of approval needed" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
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
              <h4 class="modal-title"><b>Edit Task</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="exe_flowsteps.php" enctype="multipart/form-data">
			  <input type="hidden" class="id" name="id">
                <div class="form-group">
                    <label for="edit_description" class="col-sm-3 control-label">Task Name</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_description" name="edit_description" required>
                    </div>
                </div>
                <div class="form-group">
					<label for="edit_usergroup" class="col-sm-3 control-label">User Group</label>

                    <div class="col-sm-9">
					<!--	<select class="form-control" id="edit_usergroup" name="edit_usergroup" required>
						<option value="" selected>- Select -</option> -->
						<select id='edit-selected-options' multiple='multiple' name="edit_usergroup[]" required>
						<optgroup label="By User Group">
						<optgroup label="By User Group">
                        <?php
                          $sql = "SELECT * FROM fs_user_group";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['ug_id']."'>".$row['ug_name']."</option>
                            ";
                          }
                        ?>
						</optgroup>			 
						</select>

                    </div>
                </div>
                <div class="form-group">
					<label for="edit_approvaltype" class="col-sm-3 control-label">Approval Type</label>

                    <div class="col-sm-9">
						<select class="form-control" id="edit_approvaltype" name="edit_approvaltype" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'approvaltype' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
						</select>

                    </div>
                </div>
                <div class="form-group">
					<label for="edit_confirmtype" class="col-sm-3 control-label">Confirmation Type</label>

                    <div class="col-sm-9">
						<select class="form-control" id="edit_confirmtype" name="edit_confirmtype" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'confirmation_type' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
						</select>

                    </div>
                </div>	
				<div class="form-group">
                    <label for="edit_timewindow" class="col-sm-3 control-label">Duration</label>

                    <div class="col-sm-9">
                      <input type="number" class="form-control" max="100" min="0" id="edit_timewindow" name="edit_timewindow" placeholder="Number of days" required>					   
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_rejectfirst" class="col-sm-3 control-label">Reject First</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_rejectfirst" name="edit_rejectfirst" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_rejectchange" class="col-sm-3 control-label">Reject Change</label>

                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="edit_rejectchange" name="edit_rejectchange" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edit_rejectanchor" class="col-sm-3 control-label">Reject Anchor</label>
                    <div class="col-sm-9">                    
					<select class="form-control" id="edit_rejectanchor" name="edit_rejectanchor" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'yes_no' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
					</select>
					</div>
                </div>
                <div class="form-group">
                    <label for="edit_selectgroup" class="col-sm-3 control-label">Can Select Group</label>
                    <div class="col-sm-9">                    
					<select class="form-control" id="edit_selectgroup" name="edit_selectgroup" required>
						<option value="" selected>- Select -</option> 
                        <?php
                          $sql = "SELECT * FROM fs_settings WHERE group_name = 'yes_no' and status='enable'";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['settings_value']."'>".$row['settings_label']."</option>
                            ";
                          }
                        ?>						
					</select>
					</div>
                </div>				
                <div class="form-group">
                    <label for="edit_needed_approval" class="col-sm-3 control-label">No. approval Needed</label>

                    <div class="col-sm-9">
                      <input type="number" class="form-control" id="edit_needed_approval" name="edit_needed_approval" min="0" max="50" placeholder="Minimum number of approval needed" required>
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
              <form class="form-horizontal" method="POST" action="exe_flowsteps.php">
                <input type="hidden" class="id" name="id">
                <div class="text-center">
                    <p>DELETE TASK</p>
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





     