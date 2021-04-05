<?php

class approver
{
	public $user_id;
	public $request_no;
	public $workflow_id;
	public $step_id;
	public $date_now; 
	public $action;
	public $remarks;

	public $total_approver;
	public $total_affix;
	public $no_approval_need;
	public $approvers_list;

	public $steps_count;
	public $steps_approved;
	public $step_seq_num;

	public $request_userID;

	//  $conn = $GLOBALS['conn'];
	protected $conn;
	private $CountNo; 		//number of approvers step
	private $userCountNo; 	//number of approvers user
	private $anchor_step;

	public function __construct(){

	}

	function set_local_param($comm){
		$this->conn = $comm;
		$this->date_now = time();

	}

	function setSequenceNo($seq_no){
		$this->step_seq_num = $seq_no;
	}

	function set_request_info($requestor_id){
		$this->request_userID;
	}

	function set_checkers($num_approver, $apprdCount, $required_number_approval,$step_cnt,$step_apprer,$app_list){
		$this->total_approver = $num_approver;
		$this->total_affix = $apprdCount;
		$this->no_approval_need =  0; //$num_approrequired_number_approvalver;
		$this->steps_count=$step_cnt;
		$this->steps_approved=$step_apprer;
		$this->approvers_list=$app_list;
	}

	function set_request_data($requestno, $workflowid, $stepid){		
		$this->request_no = $requestno;
		$this->workflow_id = $workflowid;
		$this->step_id = $stepid;		
	}
	
	function set_user_affix($userid,$action,$remarks){
		$this->user_id = $userid;
		$this->action = $action;
		$this->remarks = $remarks;

	}

	function set_anchor($anchor){
		$this->anchor_step = $anchor;
	}

	function count_approval(){		
		//count coompleted step
		$sql = "SELECT count(id) as approno 
		FROM fs_request_task_status 
		WHERE rq_work_id='$this->workflow_id' 
		and rq_step_id = '$this->step_id' 
		and rq_no = '$this->request_no' ";
		
		echo $sql;
		$query = $this->conn->query($sql);
		$row = $query->fetch_assoc();			
		//$CountNo = $row['approno'];
		$this->CountNo = $row['approno'];

		//count user approved
		$usql = "SELECT count(id) as approno 
		FROM fs_request_task_approver 
		WHERE workflow_id='$this->workflow_id' 
		and steps_id =  '$this->step_id' 
		and rq_no = '$this->request_no' 
		and approver_id='$this->user_id'";

		$uquery = $this->conn->query($usql);
		$urow = $uquery->fetch_assoc();			
		$this->userCountNo = $urow['approno'];

	}

	function exec_step_record(){
			//exec for status per task
			if($this->CountNo == 0){
				$sql = "INSERT INTO fs_request_task_status (
				rq_work_id, 
				rq_step_id, 
				rq_no, 
				rq_status, 
				unix_date, 
				app_user) 
				VALUES (
				'$this->workflow_id',
				'$this->step_id',
				'$this->request_no',
				'$this->action',
				'$this->date_now',
				'$this->user_id')";									
											
			}else{
				$sql = "UPDATE fs_request_task_status 
				SET rq_status = '$this->action',
				unix_date='$this->date_now',
				app_user='$this->user_id'  
				WHERE rq_work_id='$this->workflow_id' 
				and rq_step_id = '$this->step_id' 
				and rq_no = '$this->request_no'";
				
			}
			
			if($this->conn->query($sql)){
				$ret_msg = 'Record was successfully added';
			}
			else{
				$ret_msg = $this->conn->error;
			}
			return $ret_msg;
	}

	function exec_approver_rec()
	{
		//exec for status per user approver
		if ($this->userCountNo == 0) {
			$sql_user = "INSERT INTO fs_request_task_approver (
			workflow_id, 
			steps_id, 
			rq_no, 
			approval_status, 
			unixdate, 
			approver_id, 
			seq_no, 
			approval_remarks) 
			VALUES ('$this->workflow_id', 
			'$this->step_id',
			'$this->request_no',
			'$this->action',
			'$this->date_now',
			'$this->user_id', 
			'$this->step_seq_num',
			'$this->remarks');";
		} else {
			$sql_user = "UPDATE fs_request_task_approver SET approval_status = '$this->action',unixdate='$this->date_now',approval_remarks='$this->remarks'  
				WHERE workflow_id='$this->workflow_id' 
				and steps_id = '$this->step_id' 
				and rq_no = '$this->request_no' and approver_id='$this->user_id'";
		}


		if ($this->conn->query($sql_user)) {
			$ret_msg = 'Record was successfully added';
		} else {
			$ret_msg = $this->conn->error;
		}
		return $ret_msg;
	}

	function check_status_request()
	{
		// Completed
		if (($this->steps_count == $this->steps_approved) &&
			($this->total_approver == $this->total_affix)
		) {
			$actionapexmain = 'Completed';

			// In progress
		} else if (($this->action == 'Approved' || $this->action == 'Confirmed')
			and 	($this->total_approver != $this->total_affix)
		) {
			$actionapexmain = 'InProgress';

			// Approved
		} else if (($this->action == 'Approved' || $this->action == 'Confirmed')
			and ($this->total_approver == $this->total_affix)
		) {
			$actionapexmain = $this->action;
		}/* else if(($this->action == 'Approved' || $this->action == 'Confirmed') and ($required_number_approval <= $this->total_affix)){
			$actionapexmain = $this->action;

		} */ else {
			$actionapexmain = $this->action;
		}

		return $actionapexmain;
	}

}
?>