<?php

use Doctrine\Common\Collections\ArrayCollection;

class task
{
    private $id;
    private $task_id;  // work id
    private $task_name;  // work name
    private $task_approver;  // approver
    private $approval_type;
    private $confirm_type;
    private $task_duration; // time window
    private $needed_approval; // number of approvers to get this approved
    private $reject_first;
    private $reject_change;
    private $reject_anchor;
    private $select_group;

    private $conn;
    private $task_row;

    public function __construct($task_id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_workstpes  WHERE 
        work_id = '$task_id'";

        if (is_numeric($task_id)) {
            $sql = "SELECT * FROM fs_workstpes WHERE 
            id = '$task_id'";
        }

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {

            $row = $result->fetch_assoc();

            $this->id = $row['id'];
            $this->task_id = $row['work_id'];
            $this->task_name = $row['work_name'];
            $this->task_approver = $row['approver'];
            $this->approval_type = $row['approval_type'];
            $this->confirm_type = $row['confirm_type'];
            $this->task_duration = $row['time_window'];
            $this->needed_approval = $row['needed_approval'];
            $this->reject_first = $row['reject_first'];
            $this->reject_change = $row['reject_change'];
            $this->reject_anchor = $row['reject_anchor'];
            $this->select_group = $row['select_group'];

            $this->task_row = $row;
           
            $result->close();
        }
    }

    public function __destruct()
    {
       // $this->conn->close();
    }

    public static function list_task_with_approvers()
    {
        $sql = "SELECT fsw.*, fsw.id as wid, ug.ug_name
             FROM fs_workstpes fsw 
        LEFT JOIN fs_user_group ug ON ug.ug_id=fsw.approver
        ORDER BY   fsw.work_name ASC";

        $conn = $GLOBALS['conn'];
        return  $conn->query($sql);
    }

    public function delete_task()
    {
        $sql = "DELETE FROM fs_workstpes where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
     
        return false;
    }

    

    public function update_task()
    {
        $sql = "UPDATE fs_workstpes SET work_id = '$this->task_id',
        work_name = '$this->task_name', 
        approver = '$this->task_approver',
        approval_type = '$this->approval_type',
        confirm_type =  '$this->confirm_type',
        time_window = '$this->task_duration',
        needed_approval = '$this->needed_approval',
        reject_first =  '$this->reject_first',
        reject_change =   '$this->reject_change',
        reject_anchor =  '$this->reject_anchor',
        select_group =   '$this->select_group'
        where id = $this->id";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    public static function insert_task(
        $task_id,
        $task_name,
        $task_approver,
        $approval_type,
        $confirm_type,
        $task_duration,
        $needed_approval,
        $reject_first,
        $reject_change,
        $reject_anchor,
        $select_group
    ) {
        $sql = "INSERT INTO fs_workstpes 
        (work_id,
        work_name, 
        approver,
        approval_type,
        confirm_type,
        time_window,
        needed_approval,
        reject_first,
        reject_change,
        reject_anchor,
        select_group)
        VALUES ('$task_id',
        '$task_name',
      '$task_approver',
       '$approval_type',
        '$confirm_type', 
    '$task_duration',
     '$needed_approval',
      '$reject_first',
       '$reject_change',
        '$reject_anchor',
         '$select_group')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;
        return false;
    }

  

    /**
     * Get task approvers group.
     */
    public function getTaskApproverGroup(){
        // return task group of approvers
        $approvers = explode(',', $this->task_approver);

        // crate approver collection
        $collections = new ArrayCollection();

        foreach ($approvers as $value){
            $collections->add(new user_group($value));
        }

        return $collections;
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
     * Get the value of task_name
     */
    public function getTask_name()
    {
        return $this->task_name;
    }

    /**
     * Set the value of task_name
     *
     * @return  self
     */
    public function setTask_name($task_name)
    {
        $this->task_name = $task_name;

        return $this;
    }

    /**
     * Get the value of task_approver
     */
    public function getTask_approver()
    {
        return $this->task_approver;
    }

    /**
     * Set the value of task_approver
     *
     * @return  self
     */
    public function setTask_approver($task_approver)
    {
        $this->task_approver = $task_approver;

        return $this;
    }

    /**
     * Get the value of approval_type
     */
    public function getApproval_type()
    {
        return $this->approval_type;
    }

    /**
     * Set the value of approval_type
     *
     * @return  self
     */
    public function setApproval_type($approval_type)
    {
        $this->approval_type = $approval_type;

        return $this;
    }

    /**
     * Get the value of confirm_type
     */
    public function getConfirm_type()
    {
        return $this->confirm_type;
    }

    /**
     * Set the value of confirm_type
     *
     * @return  self
     */
    public function setConfirm_type($confirm_type)
    {
        $this->confirm_type = $confirm_type;

        return $this;
    }

    /**
     * Get the value of task_duration
     */
    public function getTask_duration()
    {
        return $this->task_duration;
    }

    /**
     * Set the value of task_duration
     *
     * @return  self
     */
    public function setTask_duration($task_duration)
    {
        $this->task_duration = $task_duration;

        return $this;
    }

    /**
     * Get the value of needed_approval
     */
    public function getNeeded_approval()
    {
        return $this->needed_approval;
    }

    /**
     * Set the value of needed_approval
     *
     * @return  self
     */
    public function setNeeded_approval($needed_approval)
    {
        $this->needed_approval = $needed_approval;

        return $this;
    }

    /**
     * Get the value of reject_first
     */
    public function getReject_first()
    {
        return $this->reject_first;
    }

    /**
     * Set the value of reject_first
     *
     * @return  self
     */
    public function setReject_first($reject_first)
    {
        $this->reject_first = $reject_first;

        return $this;
    }

    /**
     * Get the value of reject_change
     */
    public function getReject_change()
    {
        return $this->reject_change;
    }

    /**
     * Set the value of reject_change
     *
     * @return  self
     */
    public function setReject_change($reject_change)
    {
        $this->reject_change = $reject_change;

        return $this;
    }

    /**
     * Get the value of reject_anchor
     */
    public function getReject_anchor()
    {
        return $this->reject_anchor;
    }

    /**
     * Set the value of reject_anchor
     *
     * @return  self
     */
    public function setReject_anchor($reject_anchor)
    {
        $this->reject_anchor = $reject_anchor;

        return $this;
    }

    /**
     * Get the value of select_group
     */
    public function getSelect_group()
    {
        return $this->select_group;
    }

    /**
     * Set the value of select_group
     *
     * @return  self
     */
    public function setSelect_group($select_group)
    {
        $this->select_group = $select_group;

        return $this;
    }

    public function isSelectGroup(){
        return $this->select_group == 'Yes' ? true : false;
    }

    /**
     * Get the value of task_row
     */ 
    public function getTask_row()
    {
        return $this->task_row;
    }

    /**
     * Set the value of task_row
     *
     * @return  self
     */ 
    public function setTask_row($task_row)
    {
        $this->task_row = $task_row;

        return $this;
    }

    /**
     * Get the value of conn
     */ 
    public function getConn()
    {
        return $this->conn;
    }

    /**
     * Set the value of conn
     *
     * @return  self
     */ 
    public function setConn($conn)
    {
        $this->conn = $conn;

        return $this;
    }
}
