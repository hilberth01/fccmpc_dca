<?php

use Doctrine\Common\Collections\ArrayCollection;

class Workflow
{
    private $id;
    private $wf_id;
    private $wf_name;
    private $task_id;
    private $sequence_no;
    private $approver;
    private $approval_type;
    private $tasks;

    private $data_row;

    public function __construct($wf_id)
    {
        $this->wf_id = $wf_id;
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_workflow
        WHERE form_id = '$this->wf_id'";

        if (is_numeric($wf_id)) {
            $sql = "SELECT * FROM fs_workflow WHERE 
            id = '$wf_id'";
        }

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
         
            $this->data_row = $row;
            $this->id = $row['id'];
            $this->wf_id = $row['form_id'];
            $this->wf_name = $row['form_name'];
            $this->task_id = $row['form_steps_id'];
            $this->sequence_no = $row['form_sequence'];
            $this->approver = $row['form_approver'];
            $this->approval_type = $row['form_approval_type'];
   
            $result->close();
        }
    }

    public function __destruct()
    {
       // $this->conn->close();
    }

    public function delete_workflow()
    {
        $sql = "DELETE FROM fs_workflow where id = '$this->id' ";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    public function update_workflow()
    {
        $sql = "UPDATE fs_workflow SET 
        form_id = '$this->wf_id', 
        form_name = '$this->wf_name',
        form_steps_id = '$this->task_id',
        form_sequence =  '$this->sequence_no',
        form_approver = '$this->approver',
        form_approval_type = '$this->approval_type'
        where id = '$this->id'";

       // echo $sql;
        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    /**
     * Get the number of task in a workflow.
     * 
     * @return number of task in a workflow.
     */
    public function getTaskCount(){

        $sql = "SELECT count(id) as approno 
	    FROM fs_workflow 
	    WHERE form_id = '$this->wf_id'";

        $query = $this->conn->query($sql);
                            
        if ($query) {
            $row = $query->fetch_assoc();
            return $row['approno'];
        }

            return 0;

    }

    public static function insert_workflow(
        $wf_id,
        $wf_name,
        $task_id,
        $sequence_no,
        $approver,
        $needed_approval
    ) {
        $sql = "INSERT INTO fs_workflow (form_id, 
        form_name,
        form_steps_id,
        form_sequence,
        form_approver,
        form_approval_type)
        VALUES ('$wf_id', 
        '$wf_name',
        '$task_id',
        '$sequence_no',
        '$approver',
        '$needed_approval')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;
        return false;
    }

    public static function list_workflow_group()
    {
        $conn = $GLOBALS['conn'];
        
        $sql = "SELECT form_id, form_name 
        FROM fs_workflow 
        GROUP BY form_id, form_name";
      
        return $conn->query($sql);
    }

     /**
     * Get the class tasks
     */ 
    public function getTasks()
    {
        $sql = "SELECT workflow.form_steps_id FROM fs_workflow workflow
                LEFT JOIN fs_workstpes task 
                ON task.work_id = workflow.form_steps_id
                WHERE workflow.form_name = '$this->wf_name'
                ORDER BY workflow.form_sequence ASC";

        $query = $this->conn->query($sql);

        $collection = new ArrayCollection();

        while($row = $query->fetch_assoc()) {
            $task = new task($row['form_steps_id']);
            $collection->add($task);
        }
   
        return $collection;
    }

    /**
     * Get the task that is anchored.
     */
    public function getAnchoredTask(){
        $tasks = $this->getTask();

        foreach ($tasks as $task){
            if ($task->getReject_anchor()){
                return $task;
            }
        }

        return null;
    }

    /**
     * Get sequence of the task on a workflow.
     */
    public function getTaskSequence($task_id)
    {
        $sql = "SELECT workflow.form_sequence FROM fs_workstpes task
        INNER JOIN fs_workflow workflow
        ON task.work_id = workflow.form_steps_id 
        AND workflow.form_id = '$this->wf_id'
        AND task.work_id = '$task_id'";

        $conn = $GLOBALS['conn'];

        if ($result = $conn->query($sql)) {
            $row = $result->fetch_assoc();

            return $row['form_sequence'];
        }
    }

    /**
     * Get sequence task through the workflows attached task.
     */
    public function getSequenceTask($sequence_no){
        
        $tasks = $this->getTasks();
        
        $sequence_loop = 1;
        foreach ($tasks as $task){
            
            if ($sequence_loop == $sequence_no){
                return $task;
            }

            $sequence_loop++;
            
        }
        return null;
    }

    /**
     * Return request anchored task.
     */
    public function getAnchoredTasks(){
        $tasks = $this->getTasks();

        foreach ($tasks as $task){
            if ($task->getReject_anchor() == 'Yes'){
                return $task;
            }
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
     * Get the value of wf_id
     */ 
    public function getWf_id()
    {
        return $this->wf_id;
    }

    /**
     * Set the value of wf_id
     *
     * @return  self
     */ 
    public function setWf_id($wf_id)
    {
        $this->wf_id = $wf_id;

        return $this;
    }

    /**
     * Get the value of wf_name
     */ 
    public function getWf_name()
    {
        return $this->wf_name;
    }

    /**
     * Set the value of wf_name
     *
     * @return  self
     */ 
    public function setWf_name($wf_name)
    {
        $this->wf_name = $wf_name;

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
     * Get the value of approver
     */ 
    public function getApprover()
    {
        return $this->approver;
    }

    /**
     * Set the value of approver
     *
     * @return  self
     */ 
    public function setApprover($approver)
    {
        $this->approver = $approver;

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
     * Get the value of workflow_tasks
     */ 
    public function getWorkflow_tasks()
    {
        return $this->workflow_tasks;
    }

    /**
     * Set the value of workflow_tasks
     *
     * @return  self
     */ 
    public function setWorkflow_tasks($workflow_tasks)
    {
        $this->workflow_tasks = $workflow_tasks;

        return $this;
    }

    /**
     * Get the value of data_row
     */ 
    public function getData_row()
    {
        return $this->data_row;
    }

  
}
