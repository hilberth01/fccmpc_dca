<?php

include_once 'user.php';

class request
{
    private $id;
    private $revision_id;
    private $request_id;
    private $name;
    private $description;
    private $workflow_id;
    private $requestor_id;
    private $status;
    private $request_unix;
    private $date_created;

    private $conn;
    private $row;

    public function __construct($id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_request_main 
        WHERE rq_id = '$id'";

        if (is_numeric($id)) {
            $sql = "SELECT * FROM fs_request_main 
            WHERE id = '$id'";
        }

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $this->row = $row;
            $this->id = $row['id'];
            $this->revision_id = $row['revision_id'];
            $this->request_id = $row['rq_id'];
            $this->name = $row['rq_name'];
            $this->description = $row['rq_description'];
            $this->workflow_id = $row['rq_workflow'];
            $this->requestor_id = $row['rq_requestor'];
            $this->status = $row['rq_status'];
            $this->request_unix = $row['rq_unix'];
            $this->date_created = $row['rq_created'];
            
            // $result->close();
        }
    }

    public function __destruct()
    {
        // $this->conn->close();
    }

    public function delete_request()
    {
        $sql = "DELETE FROM fs_request_main WHERE id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    public function Workflow(){
        return new Workflow($this->workflow_id);
    }

    public function updateRequest()
    {
        $sql = "UPDATE fs_request_main SET
         revision_id = '$this->revision_id',
            rq_id =  '$this->request_id',
            rq_name = '$this->name',
            rq_description =  '$this->description',
            rq_workflow = '$this->workflow_id',
            rq_requestor = '$this->requestor_id',
            rq_status = '$this->status',
            rq_unix =  '$this->request_unix',
            rq_created = '$this->date_created'
            where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    /**
     * Update the disapproved task with empty approval status.
     */
    public function updateDisapprovedTask(){

        $task = $this->getTaskWithDisapproval();

        if ($task == null) {
            throw new Exception("Request does not have disapproved task.");
        }

        $task_id = $task->getTask_id();

        $sql = "UPDATE fs_request_task_approver
        SET approval_status = ''
        WHERE rq_no = '$this->request_id'
        AND workflow_id = '$this->workflow_id'
        AND steps_id = '$task_id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }


    // need to remove, can be done by updateRequest function
    public function update_request_info()
    {
        $sql = "UPDATE fs_request_main 
        SET rq_name = '$this->name',
		rq_description = '$this->description',
		revision_id = '$this->revision_id'
		WHERE id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    public static function generate_control_no()
    {
        $sql = "SELECT MAX(id) as lastno FROM fs_request_main";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);
        $row = $query->fetch_assoc();

        $control_no = $row['lastno'] + 1;
        return "FCCMPC-".sprintf("%07d", $control_no);
        $conn->close();
    }

    public static function list_requests($filter_status)
    {
        $sql = "SELECT request.*, user.firstname, user.lastname 
        FROM fs_request_main request 
        LEFT JOIN fs_users user on user.user_id = request.rq_requestor 
        WHERE $filter_status ORDER BY request.id DESC";

        $conn = $GLOBALS['conn'];
        return $conn->query($sql);
        //$conn->close();
    }

    /**
     * List all users request
     */
    public static function list_users_request()
    {
        $sql = "SELECT rm.*,u.firstname, u.lastname 
        FROM fs_request_main rm 
        LEFT JOIN fs_users u 
        on u.user_id=rm.rq_requestor 
        ORDER BY rm.id DESC";
    }

    public static function list_reqeuestors_request($user)
    {
        $sql = "SELECT rm.*,u.firstname, u.lastname 
        FROM fs_request_main rm 
        LEFT JOIN fs_users u 
        on u.user_id=rm.rq_requestor 
        WHERE rm.rq_requestor = '{$user}' 
        ORDER BY rm.id DESC";
    }

 

    /**
     * Get the users request approved task.
     * 
     * @return the task name else 0 if not found
     */
    public function getAnchoredTask()
    {
        $sql = "SELECT rts.*, fss.work_name, fss.reject_anchor
			FROM fs_request_task_status rts
			LEFT JOIN fs_workstpes fss 
            ON fss.work_id=rts.rq_step_id
			WHERE rts.rq_no = '$this->request_id' 
            and rts.rq_status 
            in ('Approved','Confirmed') 
            and fss.reject_anchor = 'Yes'
			ORDER BY rts.seq_no ASC Limit 1";
        
        $query = $this->conn->query($sql);
            
        if ($query) {
            $row = $query->fetch_assoc();
            return isset($row['work_name']) ? $row['work_name'] : 0;
        }

        return 0;
    }

 

    /**
     * Get the number of task the request contain.
     * 
     * @return the number of task of the request
     */
    public function get_request_task_count($worklow_id, $task_id)
    {
        $sql = "SELECT count(id) as approno 
		FROM fs_request_task_status 
		WHERE rq_work_id='$worklow_id' 
        and rq_step_id = '$task_id' 
        and rq_no = '$this->request_id' ";

        $query = $this->conn->query($sql);
                    
        if ($query) {
            $row = $query->fetch_assoc();
            return $row['approno'];
        }

        return 0;
    }

    //???????????? dupplicate
    public function isTaskHasDisapproval($task_id){
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and steps_id = '$task_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) return true;

        return false;

    }

    /**
     * Check if the request task approver contains empty status.
     */
    public function isTaskHasAnEmptyStatus($task_id){
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and steps_id = '$task_id'
        and approval_status = ''";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) return true;

        return false;
    }


    /**
     * Check if the request task contains disapproval status.
     */
    public function isRequestHasDisapproval(){
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) return true;

        return false;
    }

    /**
     * Get request task that has been disapproved.
     */
    public function getTaskWithDisapproval(){
        
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if (!$query) return false;

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();

            return new task($row['steps_id']);
        }

        return false;
    }

    /**
     * Check if the user disapproved the task.
     */
function isUserDisapprovedTheTask($task_id, $user_id ) {

	$sql = "SELECT approver.approval_status 
    FROM fs_request_task_approver approver
	WHERE approver.steps_id = '$task_id' 
	AND approver.rq_no = '$this->request_id'
	AND approver_id = '$user_id'
	LIMIT 1";

    $query = $this->conn->query($sql);

	if ($query->num_rows > 0) {
        $row = $query->fetch_assoc();
	    $result = isset( $row['approval_status']) ?  $row['approval_status'] : '' ;

	    if (is_null($result)) return false;

	    return $result == 'Disapproved'? true : false;
    }

    return false;
}

/**
     * Function to check if the request approval has  been completed.
     */
    public function isRequestApprovalComplete(){
        $workflow = $this->GetWorkflow();
        
        $task_count = $workflow->getTaskCount();
        $approved_count = $this->getApprovedRequestCount();

        return $task_count == $approved_count ? true : false;
        
    }

    /**
     * Get the count of the request approved or confirm task
     * in the request task status table.
     * 
     * @return count of the approved or confirm task.
     */
    public function getApprovedRequestCount()
    {
        $sql = "SELECT count(id) as approno 
		FROM fs_request_task_status 
		WHERE rq_no='$this->request_id' 
        and rq_status in ('Approved','Confirmed')";

        $query = $this->conn->query($sql);

        if ($query) {
            $row = $query->fetch_assoc();
            return $row['approno'];
        }

        return 0;
    }

    

    /**
     * Get users request task count.
     */
    public function get_user_request_task_count($wokflow_id,
    $task_id, $user_id)
    {
        //count user approved
		$sql = "SELECT count(id) as approno 
		FROM fs_request_task_approver 
		WHERE workflow_id='$workflow_id' 
		and steps_id =  '$task_id' 
		and rq_no = '$this->request_id' 
		and approver_id='$user_id'";

        $query = $this->conn->query($sql);

        if ($query) {
            $row = $query->fetch_assoc();
            return $row['approno'];
        }

        return 0;
    }

    /**
     * Get request task collection.
     */
    public function getRequestTasksStatus(){

        $sql = "SELECT * FROM fs_request_task_status
		WHERE rq_no = '$this->request_id' ORDER BY seq_no";

        $collection = new ArrayCollection();
        
        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            $collection.add(new RequestTaskStatus($row['id']));
        }

        return collection;
    }


    /**
     * Get the request task approvers members.
     * 
     * @return approver members. 
     */
    public function getRequestTaskApprovers($task_id){

        $sql = "SELECT rta.*,ug.ug_members,rta.user_approvers, 
        group_concat(ug.ug_members 
        order by ug.ug_members SEPARATOR ',') AS ugname
        FROM fs_request_task_status  rta
        LEFT JOIN fs_user_group ug 
        ON find_in_set(ug.ug_id,rta.user_approvers) 
        LEFT JOIN fs_users us 
        ON find_in_set(us.user_id,ug.ug_members)  
        WHERE rta.rq_no = '$this->request_id' 
        and rta.rq_work_id = '$this->workflow_id' 
        and rta.rq_step_id = '$task_id'
        ORDER BY rta.id DESC LIMIT 1";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            return $row['ugname'];
        }
 
        return 'xxx';
    }

    /**
     * Return user group collection.
     */
    public function getRequestTaskApproverGroup($task_id){
        
        $sql = "SELECT user_approvers 
        FROM fs_request_task_status request_task";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            
            $groups = explode(',', $row['ug_members']);

            $collection = new ArrayCollection();
            foreach ($groups as $group){
                $collection.add(new user_group($group));
            }

            return $collection;
        }
    }

    /**
     * Get request task approvers users collection.
     */
    public function getRequestTaskApproverUsers($task_id){

        $groups = $this->getRequestTaskApprovers($task_id);

        $collection = new ArrayCollection();
        foreach ($groups as $group){
            $members = $group->getGroup_members();
            
            foreach ($members as $member){
                $collection.add(new User($member));
            }
        }
        return $collection;
    }

      /**
     * Get approvers count who is updating one of the request task.
     * This will determine how many approvers currently approving or
     * or disapproving the request task. Note that all event currently
     * set on the table is counted including disapproval.
     */
    public function getRequestTaskApprovalCount($task_id){

        // get request task approver members
        $userTaskapprv= $this->getRequestTaskApprovers($task_id);
        $wrapped='"'.str_replace(',','","',$userTaskapprv).'"';	

        $sql = "SELECT count(id) as cid 
        FROM fs_request_task_approver 
        WHERE rq_no = '$this->request_id'
        AND steps_id = '$task_id' 
        AND approver_id IN($wrapped)";

        $query = $this->conn->query($sql);

        $row = $query->fetch_assoc();
        return (isset($row['cid'])) ? $row['cid'] : 0;

    }

    /**
     * Get the number of approvers currently approved or confirmed the request.
     * It is used to check if the task is completely approved.
     * Note that this count is only for the approved or confirmed initiated
     * update.
     */
    public function getRequestTaskApprovedCount($task_id){

        // get request task approver members
        $userTaskapprv= $this->getRequestTaskApprovers($task_id);
        $wrapped='"'.str_replace(',','","',$userTaskapprv).'"';	

        $sql = "SELECT count(id) as cid 
        FROM fs_request_task_approver 
        WHERE rq_no = '$this->request_id'
        AND steps_id = '$task_id' 
        AND approver_id IN($wrapped)
        AND approval_status IN ('Approved', 'Confirmed')";

        $query = $this->conn->query($sql);

        $row = $query->fetch_assoc();
        return (isset($row['cid'])) ? $row['cid'] : 0;

    }

    /**
     * Get the count of users who need to approved this request task.
     */
    public function getRequestTaskApproversCount($task_id){
        
        $approvers = $this->getRequestTaskApprovers($task_id);
        $member_array = explode(",", $approvers);
        
		// total approver in a task of a request
		return count($member_array);
    }

    /**
     * Determine if the request task approval is complete.
     */
    public function isTaskApprovalComplete($task_id){

        // get number of users who supposedly approved this task.
        $need_to_approved = $this->getRequestTaskApproversCount($task_id);
        // get the number of approved transaction on the request.
        $currently_approved = $this->getRequestTaskApprovedCount($task_id);

        return ($need_to_approved - $currently_approved) == 0 ? true : false; 

    }

    public static function insertRequest(
        $revision_id,
        $request_id,
        $name,
        $description,
        $workflow_id,
        $requestor_id,
        $status,
        $request_unix
    )
    {
        $sql = "INSERT INTO fs_request_main (
        revision_id,
        rq_id, 
        rq_name, 
        rq_description, 
        rq_workflow, 
        rq_status, 
        rq_requestor, 
        rq_unix)
        VALUES (
        '$revision_id',
        '$request_id',
        '$name',
        '$description',
        '$workflow_id',
        '$status',
        '$requestor_id',
        '$request_unix')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;
        return false;
        $conn->close();
    }

    /**
     * Class objects
     */
    public function GetWorkflow(){
        return new Workflow($this->workflow_id);
    }



    /**
     * Get the value of id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of revision_id
     */
    public function getRevision_id()
    {
        return $this->revision_id;
    }

    /**
     * Set the value of revision_id
     *
     * @return  self
     */
    public function setRevision_id($revision_id)
    {
        $this->revision_id = $revision_id;

        return $this;
    }

    /**
     * Get the value of request_id
     */
    public function getRequest_id()
    {
        return $this->request_id;
    }

    /**
     * Set the value of request_id
     *
     * @return  self
     */
    public function setRequest_id($request_id)
    {
        $this->request_id = $request_id;

        return $this;
    }

    /**
     * Get the value of name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name
     *
     * @return  self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get the value of description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @return  self
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get the value of wokflow_id
     */
    public function getWokflow_id()
    {
        return $this->workflow_id;
    }

    /**
     * Set the value of wokflow_id
     *
     * @return  self
     */
    public function setWokflow_id($wokflow_id)
    {
        $this->wokflow_id = $wokflow_id;

        return $this;
    }

    /**
     * Get the value of requestor_id
     */
    public function getRequestor_id()
    {
        return $this->requestor_id;
    }

    public function Requestor(){
        return new user($this->requestor_id);
    }

    /**
     * Set the value of requestor_id
     *
     * @return  self
     */
    public function setRequestor_id($requestor_id)
    {
        $this->requestor_id = $requestor_id;

        return $this;
    }

    /**
     * Get the value of status
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set the value of status
     *
     * @return  self
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get the value of request_unix
     */
    public function getRequest_unix()
    {
        return $this->request_unix;
    }

    /**
     * Set the value of request_unix
     *
     * @return  self
     */
    public function setRequest_unix($request_unix)
    {
        $this->request_unix = $request_unix;

        return $this;
    }

    /**
     * Get the value of date_created
     */
    public function getDate_created()
    {
        return $this->date_created;
    }

    /**
     * Set the value of date_created
     *
     * @return  self
     */
    public function setDate_created($date_created)
    {
        $this->date_created = $date_created;

        return $this;
    }

    /**
     * Get the value of row
     */
    public function getRow()
    {
        return $this->row;
    }

    /**
     * Set the value of row
     *
     * @return  self
     */
    public function setRow($row)
    {
        $this->row = $row;

        return $this;
    }
}
