<?php

include 'workflow.php';
include 'task.php';
include 'user_group.php';

use Doctrine\Common\Collections\ArrayCollection;

class RequestTaskStatus
{
    private $id;
    private $workflow_id;
    private $task_id;
    private $request_id;
    private $sequence_no;
    private $user_approvers;
    private $request_status;
    private $unixdate;
    private $app_user;

    private $conn;

    public function __construct($id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_request_task_status WHERE id = '$id'";
        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $this->id = $row['id'];
            $this->workflow_id = $row['rq_work_id'];
            $this->task_id = $row['rq_step_id'];
            $this->request_id = $row['rq_no'];
            $this->sequence_no = $row['seq_no'];
            $this->user_approvers = $row['user_approvers'];
            $this->request_status = $row['rq_status'];
            $this->unixdate = $row['unix_date'];
            $this->app_user = $row['app_user'];

            // $result->close();
        }
    }


    public function __destruct()
    {
       // $this->conn->close();
    }

    public function delete_request_task_status()
    {
        $sql = "DELETE FROM fs_request_task_status where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    /**
     * Update request task status.
     *
     * @return true if successful else false.
     */
    public function updateRequestTaskStatus()
    {
        $sql = "UPDATE fs_request_task_status 
        SET rq_work_id = '$this->workflow_id',
        rq_step_id = '$this->task_id',
        rq_no = '$this->request_id',
        rq_status = '$this->request_status',
        unix_date = '$this->unixdate',
        app_user = '$this->app_user'
        where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    public static function InsertNewRequest($request_id, $workflow_id, $approvers)
    {
        $workflow = new Workflow($workflow_id);

        if ($workflow == null) {
            throw new Exception("Workflow not found.");
        }

        // get workflow task
        $workflow_tasks = $workflow->getTasks();

        $sequence_no = 1;
        foreach ($workflow_tasks as $task) {
            $task_id = $task->getTask_id();

            $approver_groups = $task->getTask_approver();

            if ($task->isSelectGroup()) {
                $approver_groups = $approvers;
            }
          
                RequestTaskStatus::InsertRequestToTaskStatus(
                    $workflow->getWf_id(),
                    $task->getTask_id(),
                    $request_id,
                    $sequence_no,
                    $approver_groups);

            $sequence_no += 1;
        }
    }

    public static function insertRequestToTaskStatus(
        $workflow_id,
        $task_id,
        $request_id,
        $sequence_no,
        $approvers) {

        $sql = "INSERT INTO fs_request_task_status (
            rq_work_id,
            rq_step_id,
            rq_no,
            seq_no,
            user_approvers)
            VALUES (
            '$workflow_id',
            '$task_id',
            '$request_id',
             $sequence_no,
            '$approvers')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;
        return false;
    }
   
    // list the request status
    public function list_request_status()
    {
        $this->request_id = 'sd';
    }

    public function get_request_info()
    {
        $sql = "SELECT * FROM fs_request_main
        WHERE rq_id = '$this->request_id' 
        ORDER BY id DESC LIMIT 1";
    }

    public static function get_anchored_tasks()
    {
        $sql = "SELECT rts.*, fss.work_name, fss.reject_anchor
			FROM fs_request_task_status rts
			LEFT JOIN fs_workstpes fss ON fss.work_id=rts.rq_step_id
			WHERE rts.rq_no = '$req_id' and rts.rq_status in ('Approved','Confirmed') 
            and fss.reject_anchor = 'Yes'
			ORDER BY rts.seq_no ASC Limit 1";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);
        $row = $query->fetch_assoc();
        return json_encode($row);
    }

    /**
     * Get request_task_status id through its workflow,
     * task and request id.
     *
     * @return the id of the request task
     */
    public static function getRequestTask(
        $workflow_id,
        $task_id,
        $request_id
    )
    {
        $sql = "SELECT id FROM fs_request_task_status
        WHERE rq_work_id = '$workflow_id' 
        AND rq_step_id = '$task_id' 
        AND rq_no = '$request_id'";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);

        if ($query) {
            $row = $query->fetch_assoc();
            return new RequestTaskStatus($row['id']);
        }
        
        return null;
    }


    /**
     * Get the workflow object of this request task.
     */
    public function Workflow(){
        return new Workflow($this->workflow_id);
    }

    /**
     * Check if the requestor is an approver of this request task.
     */
    public function isRequestorApprover($user_id){
        $groups = explode(',', $this->user_approvers);

        foreach ($groups as $group){
            $user_group = new user_group($group);

            $users = $user_group->getApprovers();
            foreach ($users as $user){
                if ($user->getUser_id() == $user_id){
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * Check if the user already reviewed on the task like
     * approved or confirmation.
     */
    public function isUserAlreadyReviewed($user_id){
        
        $sql = "SELECT user_approver FROM fs_request_approval
        WHERE request_id = '$this->request_id'
        AND flow_id = '$this->workflow_id'
        AND step_id = '$this->task_id'
        AND user_approver = '$user_id' LIMIT 1";

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) return true;

        return false;
    }

    /**
     * Function to check if a requestor needs an automatic approved.
     */
    public function isRequestorNeedToApproved($user_id){
        return $this->isRequestorApprover($user_id) && 
            !$this->isUserAlreadyReviewed($user_id);
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
     * Get the value of workflow_id
     */
    public function getWorkflow_id()
    {
        return $this->workflow_id;
    }

    /**
     * Set the value of workflow_id
     *
     * @return  self
     */
    public function setWorkflow_id($workflow_id)
    {
        $this->workflow_id = $workflow_id;

        return $this;
    }

    /**
     * Get the value of task_id
     */
    public function getTask_id()
    {
        return $this->task_id;
    }

    /**
     * Set the value of task_id
     *
     * @return  self
     */
    public function setTask_id($task_id)
    {
        $this->task_id = $task_id;

        return $this;
    }

    /**
     * Get the value of request_no
     */
    public function getRequest_no()
    {
        return $this->request_id;
    }

    /**
     * Set the value of request_no
     *
     * @return  self
     */
    public function setRequest_no($request_id)
    {
        $this->request_no = $request_id;

        return $this;
    }

    /**
     * Get the value of sequence_no
     */
    public function getSequence_no()
    {
        return $this->sequence_no;
    }

    /**
     * Set the value of sequence_no
     *
     * @return  self
     */
    public function setSequence_no($sequence_no)
    {
        $this->sequence_no = $sequence_no;

        return $this;
    }

    /**
     * Get the value of user_approvers
     */
    public function getUser_approvers()
    {
        return $this->user_approvers;
    }

    /**
     * Set the value of user_approvers
     *
     * @return  self
     */
    public function setUser_approvers($user_approvers)
    {
        $this->user_approvers = $user_approvers;

        return $this;
    }

    /**
     * Get the value of request_status
     */
    public function getRequest_status()
    {
        return $this->request_status;
    }

    /**
     * Set the value of request_status
     *
     * @return  self
     */
    public function setRequest_status($request_status)
    {
        $this->request_status = $request_status;

        return $this;
    }

    /**
     * Get the value of unixdate
     */
    public function getUnixdate()
    {
        return $this->unixdate;
    }

    /**
     * Set the value of unixdate
     *
     * @return  self
     */
    public function setUnixdate($unixdate)
    {
        $this->unixdate = $unixdate;

        return $this;
    }

    /**
     * Get the value of app_user
     */
    public function getApp_user()
    {
        return $this->app_user;
    }

    /**
     * Set the value of app_user
     *
     * @return  self
     */
    public function setApp_user($app_user)
    {
        $this->app_user = $app_user;

        return $this;
    }
}
