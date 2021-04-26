<?php
class RequestTaskApprover
{
    private $id;
    private $unixdate;
    private $request_no;
    private $workflow_id;
    private $task_id;
    private $sequence_no;
    private $approver_id;
    private $approval_status;
    private $remarks;

    private $conn;

    public function __construct($id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_request_task_approver WHERE
        id = '$id'";

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
    
            $this->id = $row['id'];
            $this->unixdate= $row['unixdate'];
            $this->request_no= $row['rq_no'];
            $this->workflow_id= $row['workflow_id'];
            $this->task_id = $row['steps_id'];
            $this->sequence_no = $row['seq_no'];
            $this->approver_id = $row['approver_id'];
            $this->approval_status = $row['approval_status'];
            $this->remarks = $row['approval_remarks'];

            $result->close();
        }
    }

    public function __destruct()
    {
     //   $this->conn->close();
    }

    public function delete_request_task_approver()
    {
        $sql = "DELETE FROM fs_request_task_approver where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    public function updateRequestTaskApprover()
    {
        $sql = "UPDATE fs_request_task_approver SET
            unixdate = '$this->unixdate',
            rq_no = '$this->request_no',
            workflow_id = '$this->workflow_id',
            steps_id =  '$this->task_id',
            seq_no = '$this->sequence_no',
            approver_id = '$this->approver_id',
            approval_status = '$this->approval_status',
            approval_remarks = '$this->remarks'
            where id = '$this->id'";

        if (!$this->conn->query($sql)) 
            throw new exception($this->conn->error);    

    }

    public static function insertRequestTaskApprover(
        $unixdate,
        $request_no,
        $workflow_id,
        $task_id,
        $sequence_no,
        $approver_id,
        $approval_status,
        $remarks
    )
    {
        $sql = "INSERT INTO fs_request_task_approver (
        unixdate,
        rq_no,
        workflow_id,
        steps_id,
        seq_no,
        approver_id,
        approval_status,
        approval_remarks)
        VALUES ('$unixdate',
        '$request_no',
        '$workflow_id',
        '$task_id',
        '$sequence_no',
        '$approver_id',
        '$approval_status',
        '$remarks')";

        $conn = $GLOBALS['conn'];

        if (!$conn->query($sql)) 
            throw new exception($conn->error);

    }

    public static function getTaskApprover($workflow_id, $task_id, 
        $request_no, $user_id ){

        $sql = "SELECT * FROM fs_request_task_approver 
        WHERE workflow_id='$workflow_id' 
        and steps_id = '$task_id' 
        and rq_no = '$request_no' 
        and approver_id='$user_id'";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);

        if ($query){
            $row = $query->fetch_assoc();
            
            return is_null($row) ? null : 
                new RequestTaskApprover($row['id']);
        }

        return null;
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
     * Get the value of approver_id
     */
    public function getApprover_id()
    {
        return $this->approver_id;
    }

    /**
     * Set the value of approver_id
     *
     * @return  self
     */
    public function setApprover_id($approver_id)
    {
        $this->approver_id = $approver_id;

        return $this;
    }

    /**
     * Get the value of approval_status
     */
    public function getApproval_status()
    {
        return $this->approval_status;
    }

    /**
     * Set the value of approval_status
     *
     * @return  self
     */
    public function setApproval_status($approval_status)
    {
        $this->approval_status = $approval_status;

        return $this;
    }

    /**
     * Get the value of remarks
     */
    public function getRemarks()
    {
        return $this->remarks;
    }

    /**
     * Set the value of remarks
     *
     * @return  self
     */
    public function setRemarks($remarks)
    {
        $this->remarks = $remarks;

        return $this;
    }
}
