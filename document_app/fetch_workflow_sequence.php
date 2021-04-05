<?php
	include 'includes/session.php';
	include 'includes/slugify.php';
	
	$id = $_POST['id'];
	$sql = "SELECT * FROM fs_workflow WHERE form_id='$id'";
	$pquery = $conn->query($sql);

	$output = '';
	$item_description = '';

	//$sql = "SELECT * FROM fs_workflow WHERE form_id='$id' ORDER BY form_sequence ASC";
	$sql = "SELECT fsw.*, fss.work_name, fss.approval_type, ug.ug_name
	FROM fs_workflow fsw 
	LEFT JOIN fs_workstpes fss ON fss.work_id=fsw.form_steps_id 
	LEFT JOIN fs_user_group ug ON ug.ug_id=fss.approver
	WHERE fsw.form_id = '$id' ORDER BY fsw.form_sequence ASC";
	$query = $conn->query($sql);
	$num = 1;
	while($row = $query->fetch_assoc()){
		//$input = ($row['max_vote'] > 1) ? '<input type="checkbox" class="flat-red '.slugify($row['form_steps_id']).'" name="'.slugify($row['form_steps_id'])."[]".'">' : '<input type="radio" class="flat-red '.slugify($row['description']).'" name="'.slugify($row['description']).'">';
		/* $input ="":
		$sql = "SELECT * FROM candidates WHERE position_id='".$row['id']."'";
		$cquery = $conn->query($sql);
		while($crow = $cquery->fetch_assoc()){
			$image = (!empty($crow['photo'])) ? '../images/'.$crow['photo'] : '../images/profile.jpg';
			$item_description .= '
				<li>
					'.$input.'<button class="btn btn-primary btn-sm btn-flat clist"><i class="fa fa-search"></i> Platform</button><img src="'.$image.'" height="100px" width="100px" class="clist"><span class="cname clist">'.$crow['firstname'].' '.$crow['lastname'].'</span>
				</li>
			';
		} */
		$item_description = '
		<li> 
		<span class="cname clist"><b>'.$row['work_name'].'</b></span>
		</li>
		';
		//$instruct = ($row['max_vote'] > 1) ? 'You may select up to '.$row['max_vote'].' candidates' : 'Select only one candidate';
		$instruct = '<li><b>Approver Group: </b>'.$row['ug_name'].', <b>Approval Type: </b>'.$row['approval_type'].', <b>Need Approval: </b>'.$row['ug_name'].'</li>';
		$updisable = ($row['form_sequence'] == 1) ? 'disabled' : '';
		$downdisable = ($row['form_sequence'] == $pquery->num_rows) ? 'disabled' : '';

		$output .= '
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-solid" id="'.$row['id'].'">
						<div class="box-header with-border">
							<h3 class="box-title"><b>Step#: '.$row['form_sequence'].' of '.$row['form_name'].'</b></h3>
							<div class="pull-right box-tools">
				                <button type="button" class="btn btn-default btn-sm moveup" data-id="'.$row['id'].'" '.$updisable.'><i class="fa fa-arrow-up"></i> </button>
				                <button type="button" class="btn btn-default btn-sm movedown" data-id="'.$row['id'].'" '.$downdisable.'><i class="fa fa-arrow-down"></i></button>
				            </div>
						</div>
						<div class="box-body">
							<p>
								<span class="pull-right">
									<button type="button" class="btn btn-success btn-sm edit btn-flat" data-id="'.$row['id'].'"><i class="fa fa-edit"></i> Edit</button>									
									<button type="button" class="btn btn-danger btn-sm delete btn-flat" data-id="'.$row['id'].'"><i class="fa fa-trash"></i> Delete </button>
								</span>
							</p>
							<div id="candidate_list">
								<ul>
									'.$item_description.'
									'.$instruct.'
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		';

		$sql = "UPDATE fs_workflow SET form_sequence = '$num' WHERE id = '".$row['id']."'";
		$conn->query($sql);

		$num++;
		$candidate = '';
	}

	echo json_encode($output);

?>