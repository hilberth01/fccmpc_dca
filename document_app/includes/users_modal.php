<!-- Add -->
<div class="modal fade" id="addnew">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b>Add New User</b></h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="exe_user.php" enctype="multipart/form-data">
          <div class="form-group">
            <label for="userId" class="col-sm-3 control-label">User Name</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="userId" name="userId" required>
            </div>
          </div>
          <div class="form-group">
            <label for="firstname" class="col-sm-3 control-label">Firstname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="firstname" name="firstname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="middlename" class="col-sm-3 control-label">Middlename</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="middlename" name="middlename" required>
            </div>
          </div>
          <div class="form-group">
            <label for="lastname" class="col-sm-3 control-label">Lastname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="lastname" name="lastname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="emailadd" class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="emailadd" name="emailadd" required>
            </div>
          </div>
          <div class="form-group">
            <label for="password" class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9">
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
          </div>
          <div class="form-group">
            <label for="accesslevel" class="col-sm-3 control-label">AccessLevel</label>

            <div class="col-sm-9">
              <select class="form-control" id="multiple-checkboxes" multiple="multiple" name="accesslevel[]">
                <?php
                $sql = "SELECT * FROM fs_settings WHERE group_name = 'access_level' and status='enable'";
                $query = $conn->query($sql);
                while ($row = $query->fetch_assoc()) {
                  echo "
                              <option value='" . $row['settings_value'] . "'>" . $row['settings_label'] . "</option>
                            ";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="department" class="col-sm-3 control-label">Department</label>

            <div class="col-sm-9">
              <select class="form-control" id="department" name="department" required>
                <option value="" selected>- Select -</option>
                <?php
                $sql = "SELECT * FROM fs_department";
                $query = $conn->query($sql);
                while ($row = $query->fetch_assoc()) {
                  echo "
                              <option value='" . $row['id'] . "'>" . $row['dept_no'] . "</option>
                            ";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="photo" class="col-sm-3 control-label">Photo</label>

            <div class="col-sm-9">
              <input type="file" id="photo" name="photo">
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
        <h4 class="modal-title"><b>Edit User</b></h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="exe_user.php">
          <input type="hidden" class="id" name="id">
          <div class="form-group">
            <label for="edit_userId" class="col-sm-3 control-label">User Name</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="edit_userId" name="userId" readonly>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_firstname" class="col-sm-3 control-label">Firstname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="edit_firstname" name="firstname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_middlename" class="col-sm-3 control-label">Middlename</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="edit_middlename" name="middlename" required>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_lastname" class="col-sm-3 control-label">Lastname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="edit_lastname" name="lastname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_emailadd" class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9">
              <input type="text" class="form-control" id="edit_emailadd" name="emailadd" required>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_password" class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9">
              <input type="password" class="form-control" id="edit_password" name="password" required>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_accesslevel" class="col-sm-3 control-label">AccessLevel</label>

            <div class="col-sm-9">
              <select class="form-control" id="edit-multiple-checkboxes" multiple="multiple" name="accesslevel[]">
                <?php
                $sql = "SELECT * FROM fs_settings WHERE group_name = 'access_level' and status='enable'";
                $query = $conn->query($sql);
                while ($row = $query->fetch_assoc()) {
                  echo "
                              <option value='" . $row['settings_value'] . "'>" . $row['settings_label'] . "</option>
                            ";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_department" class="col-sm-3 control-label">Department</label>

            <div class="col-sm-9">
              <select class="form-control" id="edit_department" name="department" required>
                <option value="" selected>- Select -</option>
                <?php
                $sql = "SELECT * FROM fs_department";
                $query = $conn->query($sql);
                while ($row = $query->fetch_assoc()) {
                  echo "
                              <option value='" . $row['id'] . "'>" . $row['dept_no'] . "</option>
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
              <form class="form-horizontal" method="POST" action="exe_user.php">
                <input type="hidden" id="user_id" name="user_id" >
                <div class="text-center">
                    <p>DELETE USER</p>
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

<!-- Update Photo -->
<div class="modal fade" id="edit_photo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b><span class="fullname"></span></b></h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="exe_user.php" enctype="multipart/form-data">
          <input type="hidden" id="user_id" name="user_id">
          <div class="form-group">
            <label for="photo" class="col-sm-3 control-label">Photo</label>

            <div class="col-sm-9">
              <input type="file" id="photo" name="photo" required>
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-success btn-flat" name="upload"><i class="fa fa-check-square-o"></i> Update</button>
        </form>
      </div>
    </div>
  </div>
</div>