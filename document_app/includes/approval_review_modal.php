<!-- Platform -->
<div class="modal fade" id="platform">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b><span class="info_title"></b></h4>
      </div>
      <div class="modal-body">
        <div class="form-group" id="content">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
      </div>
    </div>
  </div>
</div>



<!-- Apex -->
<div class="modal fade" id="apex">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b><span class="requestid"></b> <i class="fullname"></i></h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="frm_apex" action="exe_approval_review.php?track=<?php echo $_GET['track']; ?>">
          <input type="hidden" id="req_id" name="rqid">
          <input type="hidden" id="wlid" name="wflow_id">
          <input type="hidden" id="stpid" name="step_id">
          <p class="form-message"></p>
          <div class="form-group">
            <label for="sel_actiond" class="col-sm-3 control-label">Action</label>

            <div class="col-sm-9">
              <select class="form-control" id="sel_actiond" name="sel_actiond" required>
                <option value="" selected>- Select -</option>
                <?php
                //$sql = "SELECT form_id,form_name FROM fs_workflow GROUP BY form_id,form_name";
                //$query = $conn->query($sql);
                //while($row = $query->fetch_assoc()){
                echo "
                              <option value='Approved'>Approve</option>
                              <option value='Disapproved'>Disapprove</option>
                            ";
                //}
                ?>

              </select>

            </div>
          </div>
          <div class="form-group">
            <label for="remarks" class="col-sm-3 control-label">Remarks</label>

            <div class="col-sm-9">
              <textarea class="form-control" id="remarks" name="remarks" rows="5" required></textarea>
            </div>
          </div>
          <h5 class="modal-title"><b><span class="flowname"></b> --> <i class="stepname"></i></h5>
      </div>
      <div class="modal-footer">
        <input type="hidden" name="user_apex" value="submit">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <img id="load-image" src="images/preloader.gif" width="31" height="31" alt="Loading image" />
        <button type="submit" class="btn btn-success btn-flat" name="user_apex_btn" id="user_apex"><i class="fa fa-send"></i> Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- reviewal -->
<div class="modal fade" id="reviewal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><b><span class="requestid"></b> <i class="fullname"></i></h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="frm_review" action="exe_approval_review.php?track=<?php echo $_GET['track']; ?>">
          <input type="hidden" id="req_id_r" name="rqid">
          <input type="hidden" id="wlid_r" name="wflow_id">
          <input type="hidden" id="stpid_r" name="step_id">
          <input type="hidden" id="sel_action_r" name="sel_actiond" value="Confirmed">
          <!-- <div class="form-group">
            <label for="remarks_r" class="col-sm-3 control-label">Remarks</label>

            <div class="col-sm-9">
              <textarea class="form-control" id="remarks_r" name="remarks" rows="5"></textarea>
            </div>
          </div> -->
          <h5 class="modal-title"><b><span class="flowname_r"></b> --> <i class="stepname_r"></i></h5>
      </div>
      <div class="modal-footer">
        <input type="hidden" name="user_apex" value="submit">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <img id="load-imagerev" src="images/preloader.gif" width="31" height="31" alt="Loading image" />
        <button type="submit" class="btn btn-primary btn-flat" name="user_apex_rev" id="user_apex_r"><i class="fa fa-send"></i> Confirm</button>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- View history -->
<div class="modal fade" id="view">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><?php echo $tracker; ?></h4>
      </div>
      <div class="modal-body">
        <?php
        //SELECT `id`, `request_id`, `flow_id`, `step_id`, `user_apex`, `user_approver`, `user_remarks`, `date_approved`, `unix` FROM `fs_request_approval` WHERE 1
        $id = $tracker; //$voter['id'];
        //$sql = "SELECT *, candidates.firstname AS canfirst, candidates.lastname AS canlast FROM votes LEFT JOIN candidates ON candidates.id=votes.candidate_id LEFT JOIN positions ON positions.id=votes.position_id WHERE voters_id = '$id'  ORDER BY positions.priority ASC";
        $sql = "SELECT ra.flow_id, ra.user_apex, ra.date_approved, ra.step_id, ra.user_remarks, fss.work_name, us.firstname, us.lastname
				FROM fs_request_approval ra
				LEFT JOIN fs_users us ON us.user_id=ra.user_approver
				LEFT JOIN fs_workstpes fss ON fss.work_id=ra.step_id
				WHERE ra.request_id = '$id'
				ORDER BY ra.id ASC";
        $query = $conn->query($sql);
        $approvalhistory = '';
        while ($row = $query->fetch_assoc()) {

          $approvalhistory .= '<tr>
						<td>' . ((empty($row['work_name'])) ? $row['step_id'] : $row['work_name']) . '</td>
						<td>' . $row['firstname'] . " " . $row['lastname'] . '</td>
						<td>' . $row['user_apex'] . '</td>
						<td>' . $row['date_approved'] . '</td>
						<td>' . $row['user_remarks'] . '</td>
						</tr>';
        }

        echo ' <table id="history" class="table table-bordered table-hover">
						<thead>
							<th>Task</th>	
							<th>User</th>
							<th>Status</th>
							<th>Date</th>
							<th>Remarks</th>
							</thead>
							<tbody>
							' . $approvalhistory . '
						 </tbody>
						</table>';
        ?>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
      </div>
    </div>
  </div>
</div>


<!-- Preview -->
<div class="modal fade" id="preview_modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Vote Preview</h4>
      </div>
      <div class="modal-body">
        <div id="preview_body"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
      </div>
    </div>
  </div>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
  $(function() {

    $("#sel_actiond").change(function() {
      if ($("#sel_actiond").val() == "Approved")
        $("#remarks").removeAttr("required");
      else
        $("#remarks").attr("required", true);
    });
  })
</script>