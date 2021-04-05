<?php
class RequestApproval
{
    private $id;
    private $request_no;
    private $workflow_id;
    private $task_id;
    private $user_apex;
    private $user_approver;
    private $user_remarks;
    private $date_approved;
    private $unix;

    private $conn;

    public function __construct($id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_request_approval where id = $id";

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $this->id = $row['id'];
            $this->request_no = $row['request_id'];
            $this->workflow_id = $row['flow_id'];
            $this->task_id = $row['step_id'];
            $this->user_apex = $row['user_apex'];
            $this->user_approver = $row['user_approver'];
            $this->user_remarks = $row['user_remarks'];
            $this->date_approved = $row['date_approved'];
            $this->unix = $row['unix'];
           
            $result->close();
        }
    }

 
    public function __destruct() {
        // $this->conn->close();
    }

    public function delete_request_approval()
    {
        $sql = "DELETE from fs_request_approval where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    public function update_request_approval()
    {
        $sql = "UPDATE fs_request_approval SET
        request_id =  '$this->request_no',
        flow_id = '$this->workflow_id',
        step_id = '$this->task_id',
        user_apex = '$this->user_apex',
        user_approver = '$this->user_approver',
        user_remarks =  '$this->user_remarks',
        date_approved = '$this->date_approved',
        unix = '$this->unix'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    /**
     * Insert request approval
     */
    public static function insertRequestApproval(
        $request_no,
        $workflow_id,
        $task_id,
        $user_apex,
        $user_approver,
        $user_remarks,
        $unix
    ) {
        $sql = "INSERT INTO fs_request_approval(
			request_id, 
            flow_id, 
            step_id, 
			user_apex, 
            user_approver, 
            user_remarks, 
            unix) 
			VALUES (
            '$request_no', 
            '$workflow_id', 
            '$task_id', 
            '$user_apex', 
			'$user_approver', 
            '$user_remarks', 
            '$unix')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;
        return false;
    }

    /**
     * Return the approval last state
     */
    public static function get_last_state($request_no)
    {
       
        
        $sql = "SELECT user_apex
		FROM fs_request_approval 
		WHERE request_id='$request_no' 
		ORDER BY id DESC LIMIT 1";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);
        $row = $query->fetch_assoc();
       
        return $row['user_apex'];
        $conn->close();
    }

    public static function get_request_approval_date($request_no)
    {
        $conn = $GLOBALS['conn'];

        $sql = "SELECT request_approval.unix
		FROM fs_request_approval request_approval
		LEFT JOIN fs_workstpes task ON task.work_id = request_approval.step_id
		WHERE request_approval.request_id='$request_no' 
		ORDER BY request_approval.id DESC LIMIT 1";

        $query = $conn->query($sql);
        $row = $query->fetch_assoc();
        
        return (empty($row['unix'])) ? 0 : $row['unix'];
       // $conn->close();
    }

    public static function get_last_task($request_no)
    {
        $conn = $GLOBALS['conn'];

        $sql = "SELECT request_approval.step_id, task.work_name, 
        IFNULL(request_approval.step_id, 'NA') checker
		FROM fs_request_approval request_approval
		LEFT JOIN fs_workstpes task ON task.work_id = request_approval.step_id
		WHERE request_approval.request_id='$request_no' 
		ORDER BY request_approval.id DESC LIMIT 1";

        $query = $conn->query($sql);
        
        $row = $query->fetch_assoc();
        
        return (empty($row['work_name'])) ? $row['step_id'] : $row['work_name'];
        $conn->close();
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
     * Get the value of request_no
     */
    public function getRequest_no()
    {
        return $this->request_no;
    }

    /**
     * Set the value of request_no
     *
     * @return  self
     */
    public function setRequest_no($request_no)
    {
        $this->request_no = $request_no;

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
     * Get the value of user_apex
     */
    public function getUser_apex()
    {
        return $this->user_apex;
    }

    /**
     * Set the value of user_apex
     *
     * @return  self
     */
    public function setUser_apex($user_apex)
    {
        $this->user_apex = $user_apex;

        return $this;
    }

    /**
     * Get the value of user_approver
     */
    public function getUser_approver()
    {
        return $this->user_approver;
    }

    /**
     * Set the value of user_approver
     *
     * @return  self
     */
    public function setUser_approver($user_approver)
    {
        $this->user_approver = $user_approver;

        return $this;
    }

    /**
     * Get the value of user_remarks
     */
    public function getUser_remarks()
    {
        return $this->user_remarks;
    }

    /**
     * Set the value of user_remarks
     *
     * @return  self
     */
    public function setUser_remarks($user_remarks)
    {
        $this->user_remarks = $user_remarks;

        return $this;
    }

    /**
     * Get the value of date_approved
     */
    public function getDate_approved()
    {
        return $this->date_approved;
    }

    /**
     * Set the value of date_approved
     *
     * @return  self
     */
    public function setDate_approved($date_approved)
    {
        $this->date_approved = $date_approved;

        return $this;
    }

    /**
     * Get the value of unix
     */
    public function getUnix()
    {
        return $this->unix;
    }

    /**
     * Set the value of unix
     *
     * @return  self
     */
    public function setUnix($unix)
    {
        $this->unix = $unix;

        return $this;
    }
}
