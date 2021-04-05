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
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
            </div>
        </div>
    </div>
</div>

<!-- resubmit disapproved -->
<div class="modal fade" id="resubmit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b><span class="fullname"></span></b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="exe_request.php" enctype="multipart/form-data">
                    <input type="hidden" class="reqid_res" name="rqid">
                    <input type="hidden" class="edit_rq_workflow_id" name="wrkflow_id">
                    <div class="text-center">
                        <p>RESUBMIT REQUEST</p>
                        <h2 class="bold"> Re-submit for approval.</h2>
                    </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" name="resubmit" value="submit">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <img id="load-image" src="images/preloader.gif" width="31" height="31" alt="Loading image" />
                <button type="submit" class="btn btn-primary btn-flat" name="resubmitbtn" id="resubmitbtn"><i
                        class="fa fa-save"></i> Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Add new request -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b>Add New Request</b></h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="exe_request.php" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="docname" class="col-sm-3 control-label">Document #</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="docname" name="docname" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="revno" class="col-sm-3 control-label">New Revision</label>

                        <div class="col-sm-9">
                            <input type="text" class="form-control revno" id="revno" name="revno" maxlength="5"
                                required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="docdesp" class="col-sm-3 control-label">Document title</label>

                        <div class="col-sm-9">
                            <textarea class="form-control" id="docdesp" name="docdesp" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="workflow" class="col-sm-3 control-label">Workflow</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="workflow" name="workflow" required>
                                <option value="" selected>- Select -</option>
                                <?php
                                
                            $query = Workflow::list_workflow_group();
                            while ($row = $query->fetch_assoc()) {
                            echo "
                              <option value='" . $row['form_id'] . "'>" . $row['form_name'] . "</option>
                            ";
                }
                ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" id="task">
                        <label for="task" class="col-sm-3 control-label">Task</label>

                        <div class="col-sm-9">
                            <input type="text" class="form-control task" id="task_val" name="task" readonly>
                            <input type="hidden" class="form-control task_id" id="task_id" name="task_id">
                        </div>
                    </div>

                    <div class="form-group" id="app_group">
                        <label for="app_group" class="col-sm-3 control-label">User Group</label>
                        <div class="col-sm-9">
                            <select class="form-control app_group" id="app_group_val" name="app_group[]"
                                multiple="multiple">
                                <option value="" selected>- Select -</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="docname" class="col-sm-3 control-label">Document</label>

                        <div class="col-sm-9">
                            <input type="file" id="docname" name="docname">
                        </div>
                    </div>

            </div>

            <div class="modal-footer">
                <input type="hidden" name="add" value="submit">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <img id="load-image_anew" src="images/preloader.gif" width="31" height="31" alt="Loading image" />
                <button type="submit" class="btn btn-primary btn-flat" class="addbtn" id="addbtn" name="add_btn"><i
                        class="fa fa-save"></i> Save</button>
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
                <h4 class="modal-title"><b>Edit Request</b> <i class="fullname"></i></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="exe_request.php">
                    <input type="hidden" class="id" name="id">
                    <div class="form-group">
                        <label for="edit_rq_name" class="col-sm-3 control-label">Document #</label>

                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="edit_rq_name" name="edit_docname" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_rq_description" class="col-sm-3 control-label">Document title</label>

                        <div class="col-sm-9">
                            <textarea class="form-control" id="edit_rq_description" name="edit_docdesp"
                                rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_revno" class="col-sm-3 control-label">Revision</label>

                        <div class="col-sm-9">
                            <input type="text" class="form-control revno" id="edit_revno" name="edit_revno"
                                maxlength="5" required>
                        </div>
                    </div>
                    <!--
                <div class="form-group">
                    <label for="edit_rq_workflow" class="col-sm-3 control-label">Workflow</label>

                    <div class="col-sm-9">
                      <select class="form-control" id="edit_rq_workflow" name="edit_workflow" readonly>
                        <option value="" selected>- Select -</option>
                        <?php
                        /* $sql = "SELECT form_id,form_name FROM fs_workflow GROUP BY form_id,form_name";
                          $query = $conn->query($sql);
                          while($row = $query->fetch_assoc()){
                            echo "
                              <option value='".$row['form_id']."'>".$row['form_name']."</option>
                            ";
                          } */
                        ?>
                      </select>
                    </div>
                </div>
				-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-success btn-flat" name="edit"><i class="fa fa-check-square-o"></i>
                    Update</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Delete -->
<div class="modal fade" id="cancel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b>Cancelling...</b></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="exe_request.php">
                    <input type="hidden" class="id" name="id">
                    <input type="hidden" class="reqid_res" name="rqid">
                    <div class="text-center">
                        <p>CANCEL REQUEST</p>
                        <h2 class="bold fullname"></h2>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-danger btn-flat" name="cancel"><i class="fa fa-trash"></i>
                    Cancel</button>
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
                <form class="form-horizontal" method="POST" action="exe_request.php">
                    <input type="hidden" class="id" name="id">
                    <div class="text-center">
                        <p>DELETE CANDIDATE</p>
                        <h2 class="bold fullname"></h2>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i>
                    Delete</button>
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
                <form class="form-horizontal" method="POST" action="exe_request.php" enctype="multipart/form-data">
                    <input type="hidden" class="id" name="refile_id">
                    <div class="form-group">
                        <label for="reupload" class="col-sm-3 control-label">File </label>

                        <div class="col-sm-9">
                            <input type="file" id="reupload" name="reupload" required>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i
                        class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-success btn-flat" name="upload"><i
                        class="fa fa-check-square-o"></i> Update</button>
                </form>
            </div>
        </div>
    </div>
</div>