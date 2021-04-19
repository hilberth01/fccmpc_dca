<?php

require_once '../vendor/autoload.php';
require_once 'user.php';
require_once 'user_group.php';
require_once 'request_task_status.php';

use Doctrine\Common\Collections\ArrayCollection;

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

    public function Workflow()
    {
        return new Workflow($this->workflow_id);
    }

    /**
     * Update the request.
     */
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

    public function revertTask()
    {
        $workflow = $this->GetWorkflow();

        $tasks = $workflow->getTasks();

        foreach ($tasks as $task) {
            $this->cleanupPreviousTask($task->getTask_id());
        }
    }

    /**
     * Clean request task approver row (remarks, approval status).
     * Use when re-submitting task.
     */
    public function cleanUpdatedTask()
    {
        $sql = "UPDATE fs_request_task_approver
        SET approval_status = '', approval_remarks = ''
        WHERE rq_no = '$this->request_id'
        AND workflow_id = '$this->workflow_id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    public function resubmitRequest($user_id)
    {

        $mail = new RequestMail($this->request_id);

        $task = $this->getAnchoredTask();
        $sequence_no = $task->getSequence_no();

        $task_id = $task->getTask_id();

        $result = RequestApproval::insertRequestApproval(
            $this->request_id,
            'Resubmit',
            'Resubmit',
            'Resubmit',
            $user_id,
            'Resubmit',
            time()
        );


        if ($task == null){
            $this->cleanUpdatedTask();
            $task_id = $request->getRequestTasksStatus()->first()->getTask_id();
            
        }
        else {

            $this->resetRequestTaskStateInAnchor($sequence_no);
            $this->resetTaskApproverInAnchor($sequence_no);

        }

        $this->status = "InProgress";
        $this->updateRequest();
        $mail->sendRequestMail($task_id);
      
    }

    public function resetRequestTaskStateInAnchor($sequence_no){
        
        $sql = "UPDATE fs_request_task_status 
        SET rq_status = 'InProgress',unix_date='0',app_user=''  
		WHERE rq_work_id='$this->workflow_id' and rq_no = '$this->request_id' 
        and seq_no >= '$sequence_no' 
		and rq_status in ('Approved','Confirmed')";

        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    /**
     * Clean request approver approval status (use for request resubmit)
     */
    public function resetTaskApproverInAnchor($sequence_no){

        $sql = "UPDATE fs_request_task_approver 
        SET approval_status = '',unixdate='0',approval_remarks=''  
        WHERE workflow_id='$this->workflow_id' and rq_no = '$this->request_id' 
        and seq_no >= '$sequence_no' and approval_status 
        in ('Approved','Confirmed','Disapproved')";

        if ($this->conn->query($sql)) {
        return true;
        }

        return false;

    }

    /**
     * Clean previous approval to enable re-approval.
     */
    public function cleanupPreviousTask($task_id)
    {
        /**
         * TODO: user who disapproved does not need to approved.
         */
        $sql = "UPDATE fs_request_task_approver
        SET approval_status = '', approval_remarks = ''
        WHERE rq_no = '$this->request_id'
        AND workflow_id = '$this->workflow_id'
        AND steps_id = '$task_id'";
        // and approval_status != 'Disapproved'

        if ($this->conn->query($sql)) {
            return true;
        }

        // update the task with Approved for those user who disapproved
        // only if the request is re-submitted
        return false;
    }

    /**
     * Update the disapproved task with empty approval status.
     */
    public function updateDisapprovedTask()
    {
        /**
         * TODO: user who disapproved does not need to approved.
         */
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
        // and approval_status != 'Disapproved'

        if ($this->conn->query($sql)) {
            return true;
        }

        // update the task with Approved for those user who disapproved
        // only if the request is re-submitted

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

    public static function generateControlNo()
    {
        $sql = "SELECT MAX(id) as lastno FROM fs_request_main";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);
        $row = $query->fetch_assoc();

        $control_no = $row['lastno'] + 1;
        return "FCCMPC-".sprintf("%07d", $control_no);
    }

    public static function getLatestRequest()
    {
        $sql = "SELECT MAX(rq_id) as request_id FROM fs_request_main";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);
        
        if (!$query) {
            return null;
        }
        
        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            return new request($row['request_id']);
        }

        return false;
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

    public static function listInProgressRequest()
    {
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
    // public function getAnchoredTask()
    // {
    //     $sql = "SELECT rts.*, fss.work_name, fss.reject_anchor
	// 		FROM fs_request_task_status rts
	// 		LEFT JOIN fs_workstpes fss 
    //         ON fss.work_id=rts.rq_step_id
	// 		WHERE rts.rq_no = '$this->request_id' 
    //         and rts.rq_status 
    //         in ('Approved','Confirmed') 
    //         and fss.reject_anchor = 'Yes'
	// 		ORDER BY rts.seq_no ASC Limit 1";
        
    //     $query = $this->conn->query($sql);
            
    //     if ($query) {
    //         $row = $query->fetch_assoc();
    //         return isset($row['work_name']) ? $row['work_name'] : 0;
    //     }

    //     return 0;
    // }

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
            $task_id = isset($row['rq_step_id']) ? $row['rq_step_id'] : 0;

            if ($task_id == 0) return null;
            else return new Task($task_id);
        }

        return null;
    }

    /**
     * Get the task object through its sequence no.
     */
    public function getSequenceTask($sequence_no)
    {
        $sql = "SELECT rq_step_id FROM fs_request_task_status
        WHERE rq_no = '$this->request_id' AND seq_no = '$sequence_no'";

        $query = $this->conn->query($sql);
                    
        if (!$query) {
            return null;
        }

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();

            return new task($row['rq_step_id']);
        }

        return null;
    }

    /**
     * Get list of the tasks that is still for approval
     */
    public static function listInProgressTask()
    {
        $sql = "SELECT MAX(seq_no) AS seq_no, request.rq_id 
        FROM fs_request_task_status task_status
        INNER JOIN fs_request_main request
        ON request.rq_id = task_status.rq_no
        WHERE task_status.rq_status = 'Approved'
        AND request.rq_status = 'InProgress'  
        GROUP BY task_status.rq_no";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);

        $collection = new ArrayCollection();
        if (!$query || $query->num_rows == 0) {
            return $collection;
        }

        while ($row = $query->fetch_assoc()) {
            // get the task object
            $request = new Request($row['rq_id']);
            if ($request == null) {
                continue;
            }

            $task = $request->getSequenceTask($row['seq_no']);
            $users = $request->getUsersStillNeedToApprovedTheTask($task->getTask_id());

            foreach ($users as $user) {
                echo "\r\nStill to approved: " . $user->getFirst_name();
            }
            
            $collection->add($task);
        }

        return $collection;
    }

    public static function listNextTaskForApproval()
    {
        $sql = "SELECT MAX(seq_no) as seq_no, request.rq_id FROM fs_request_main request
        LEFT JOIN fs_request_task_approver task_status
        ON task_status.rq_no = request.rq_id
        WHERE request.rq_status = 'Approved'
        GROUP BY task_status.steps_id";

        $conn = $GLOBALS['conn'];
        $query = $conn->query($sql);

        $collection = new ArrayCollection();
        if (!$query || $query->num_rows == 0) {
            return $collection;
        }

        while ($row = $query->fetch_assoc()) {
            // get the task object
            $request = new Request($row['rq_id']);
            if ($request == null) {
                continue;
            }

            $task = $request->getSequenceTask($row['seq_no'] + 1);

            $users = $request->getUsersStillNeedToApprovedTheTask($task->getTask_id());

            foreach ($users as $user) {
                echo "\r\nStill to approved: " . $user->getFirst_name();
            }

            $collection->add($task);
        }

        return $collection;
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
    public function isTaskHasDisapproval($task_id)
    {
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and steps_id = '$task_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            return true;
        }

        return false;
    }

    /**
     * Check if the request task approver contains empty status.
     */
    public function isTaskHasAnEmptyStatus($task_id)
    {
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and steps_id = '$task_id'
        and approval_status = ''";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            return true;
        }

        return false;
    }


    /**
     * Check if the request task contains disapproval status.
     */
    public function isRequestHasDisapproval()
    {
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            return true;
        }

        return false;
    }

    /**
     * Get request task that has been disapproved.
     */
    public function getTaskWithDisapproval()
    {
        $sql = "SELECT * FROM fs_request_task_approver
        where rq_no = '$this->request_id' 
        and workflow_id = '$this->workflow_id'
        and approval_status = 'Disapproved'";

        $query = $this->conn->query($sql);

        if (!$query) {
            return false;
        }

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();

            return new task($row['steps_id']);
        }

        return false;
    }

    /**
     * Check if the user disapproved the task.
     */
    public function isUserDisapprovedTheTask($task_id, $user_id)
    {
        $sql = "SELECT approver.approval_status 
    FROM fs_request_task_approver approver
	WHERE approver.steps_id = '$task_id' 
	AND approver.rq_no = '$this->request_id'
	AND approver_id = '$user_id'
	LIMIT 1";

        $query = $this->conn->query($sql);

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            $result = isset($row['approval_status']) ?  $row['approval_status'] : '' ;

            if (is_null($result)) {
                return false;
            }

            return $result == 'Disapproved'? true : false;
        }

        return false;
    }

    /**
         * Function to check if the request approval has  been completed.
         */
    public function isRequestApprovalComplete()
    {
        $workflow = $this->GetWorkflow();
        
        $task_count = $workflow->getTaskCount();
        $approved_count = $this->getApprovedRequestCount();

        return $task_count == $approved_count ? true : false;
    }

    /**
     * Get the count of the request task being approved or confirm task
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
    public function get_user_request_task_count(
        $wokflow_id,
        $task_id,
        $user_id
    ) {
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
    public function getRequestTasksStatus()
    {
        $sql = "SELECT * FROM fs_request_task_status
		WHERE rq_no = '$this->request_id' ORDER BY seq_no";

        $collection = new ArrayCollection();

        $query = $this->conn->query($sql);
        
        if (!$query) {
            return $collection;
        }
        
        if ($query->num_rows > 0) {
            while ($row = $query->fetch_assoc()) {
                $collection->add(new RequestTaskStatus($row['id']));
            }
        }

        return $collection;
    }


    /**
     * Get the request task approvers members.
     *
     * @return approver members.
     */
    public function getRequestTaskApprovers($task_id)
    {
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
     * Get approvers count who is updating one of the request task.
     * This will determine how many approvers currently approving or
     * or disapproving the request task. Note that all event currently
     * set on the table is counted including disapproval.
     */
    public function getRequestTaskApprovalCount($task_id)
    {

        // get request task approver members
        $userTaskapprv= $this->getRequestTaskApprovers($task_id);
        $wrapped='"'.str_replace(',', '","', $userTaskapprv).'"';

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
     * Get approver member who still not approved the task.
     *
     *
     *
    */

    /**
     * Get the number of approvers currently approved or confirmed the request.
     * It is used to check if the task is completely approved.
     * Note that this count is only for the approved or confirmed initiated
     * update.
     */
    public function getRequestTaskApprovedCount($task_id)
    {

        // get request task approver members
        $userTaskapprv= $this->getRequestTaskApprovers($task_id);
        $wrapped='"'.str_replace(',', '","', $userTaskapprv).'"';

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
    public function getRequestTaskApproversCount($task_id)
    {
        return $this->getRequestTaskApproverUsers($task_id)->count();
    }

    /**
     * Get the next request pending task.
     */
    public function getPendingTask()
    {
        // get the task collection
        $tasks =  $this->getRequestTasksStatus();

        foreach ($tasks as $task) {
            if ($this->isTaskApprovalComplete($task->getTask_id())) {
                continue;
            } else {
                return new task($task->getTask_id());
            }
        }

        return null;
    }

    /**
     * Get the next approver on the task.
     */
    public function getNextTaskApprover($task_id)
    {
        $approvers = $this->getUsersStillNeedToApprovedTheTask($task_id);

        if ($approvers->count() > 0) {
            return $approvers[0];
        }

        return null;
    }

    /**
    * Return user group collection.
    */
    public function getRequestTaskApproverGroup($task_id)
    {
        $sql = "SELECT user_approvers 
        FROM fs_request_task_status
        WHERE rq_no = '$this->request_id' and rq_step_id = '$task_id'";

        $conn = $GLOBALS['conn'];

        $query = $conn->query($sql);

        if ($query->num_rows > 0) {
            $row = $query->fetch_assoc();
            
            $groups = explode(',', $row['user_approvers']);

            $collection = new ArrayCollection();
            foreach ($groups as $group) {
                $collection->add(new user_group(trim($group)));
            }

            return $collection;
        }
    }

    public static function listRequestForApprovalByUser($user_id)
    {
    }

    public function getApproverStatusInTask($task_id, $user_id)
    {
    }

    /**
     * Get request task approvers users collection.
     */
    public function getRequestTaskApproverUsers($task_id)
    {
        $groups =$this->getRequestTaskApproverGroup($task_id);

        $collection = new ArrayCollection();

        foreach ($groups as $group) {
            $members = $group->getGroup_members();
            $users = explode(',', $members);
            
            foreach ($users as $user) {
                $collection->add(new User($user));
            }
        }
        return $collection;
    }

    public function isRequestorAnApprover($task_id)
    {
        $task_approvers = $this->getRequestTaskApproverUsers($task_id);
        
        foreach ($task_approvers as $approver) {
            if ($approver->getUser_id() == $this->requestor_id) {
                return true;
            }
        }

        return false;
    }

    /**
     * Check if the user already reviewed on the task like
     * approved or confirmation.
     */
    public function isUserAlreadyReviewed($task_id, $user_id)
    {
        $sql = "SELECT user_approver FROM fs_request_approval
        WHERE request_id = '$this->request_id'
        AND flow_id = '$this->workflow_id'
        AND step_id = '$task_id'
        AND user_approver = '$user_id' LIMIT 1";

        $result = $this->conn->query($sql);

        if (!$result) {
            return false;
        }
        if ($result->num_rows > 0) {
            return true;
        }

        return false;
    }

    /**
     * Function to check if a requestor needs an automatic approved.
     */
    public function isRequestorNeedToApproved($task_id, $user_id)
    {
        return $this->isRequestorApprover($task_id) &&
            !$this->isUserAlreadyReviewed($this->requestor_id);
    }

   

    /**
     * Get the users already approved the task.
     */
    public function getUsersWhoApprovedTheTask($task_id)
    {
        $sql = "SELECT approver_id 
        FROM fs_request_task_approver 
        WHERE rq_no = '$this->request_id'
        AND steps_id = '$task_id' 
        AND approval_status IN ('Approved', 'Confirmed')";

        $collection = new ArrayCollection();
        $query = $this->conn->query($sql);

        if (!$query) {
            return $collection;
        }

        while ($row = $query->fetch_assoc()) {
            $collection->add(new User($row['approver_id']));
        }

        return $collection;
    }

    /**
     * Get users who still need to approved the task.
     */
    public function getUsersStillNeedToApprovedTheTask($task_id)
    {
        $task_approvers = $this->getRequestTaskApproverUsers($task_id);
        $approved_users = $this->getUsersWhoApprovedTheTask($task_id);

        $collection = new ArrayCollection();

        foreach ($task_approvers as $approver) {
            $is_available = false;
            
            foreach ($approved_users as $approved_user) {
                if ($approved_user->getUser_id() == $approver->getUser_id()) {
                    $is_available = true;
                    break;
                } else {
                    $is_available = false;
                }
            }

            if (!$is_available) {
                $collection->add($approver);
            }
        }

        return $collection;
    }

    /**
     * Determine if the request task approval is complete.
     */
    public function isTaskApprovalComplete($task_id)
    {

        // get number of users who supposedly approved this task.
        $need_to_approved = $this->getRequestTaskApproversCount($task_id);
        // get the number of approved transaction on the request.
        $currently_approved = $this->getUsersWhoApprovedTheTask($task_id)->count();

        return ($need_to_approved - $currently_approved) == 0 ? true : false;
    }

    /**
     * This will do the requestor auto approval if he is one of the
     * approver on the task.
     */
    public function autoApprovedRequestor($task_id, $requestor_id, $seq_no)
    {
        $request_id = $this->request_id;
        $workflow_id = $this->workflow_id;
        $unixtime = time();
        $approval_state = "Approved";
        $remarks = "Auto approved for requestor.";

        $requestor_task_approver = RequestTaskApprover::getTaskApprover(
            $workflow_id,
            $task_id,
            $request_id,
            $requestor_id
        );

        if ($requestor_task_approver == null) {
            // insert to task approver table
            RequestTaskApprover::insertRequestTaskApprover(
                $unixtime,
                $request_id,
                $workflow_id,
                $task_id,
                $seq_no,
                $requestor_id,
                $approval_state,
                $remarks
            );

            // insert to request approval table
            RequestApproval::insertRequestApproval(
                $request_id,
                $workflow_id,
                $task_id,
                $approval_state,
                $requestor_id,
                $remarks,
                $unixtime
            );
        } else {
            // this is use during re-submission
            $requestor_task_approver->setUnixdate($unixtime);
            $requestor_task_approver->setApprover_id($requestor_id);
            $requestor_task_approver->setApproval_status($approval_state);
            $requestor_task_approver->setRemarks($remarks);
    
            $requestor_task_approver->updateRequestTaskApprover();
        }
    }

    /**
     * Do the approval process.
     */
    public function processRequestApproval($task_id, $approval_state, $current_user, $remarks){
        
        $workflow = new workflow($this->workflow_id);
        $sequence_no = $workflow->getTaskSequence($task_id);

        $result = false;

        $result = $this->updateRequestTaskStatus($task_id, $sequence_no, 
                    $approval_state, $current_user);

        if (!$result)
            throw new exception("Unable to update the task status.");

        
        $result =  $this->updateRequestTaskApprover($task_id,$sequence_no, 
                    $approval_state, $current_user, $remarks);

        if (!$result)
            throw new exception("Unable to update the approver table.");

            return $result;

   
    }

    /**
     * Function where all request task is inserted and updated during the approval
     * process.
     */
    public function updateRequestTaskStatus($task_id, $sequence_no, $approval_state, $current_user)
    {
        
        $task_status = RequestTaskStatus::getRequestTask(
            $this->workflow_id,
            $task_id,
            $this->request_id
        );

        $result = false;
        /**
         * insert the task if not yet on the table
         *  */ 
        if ($task_status == null) {
            $result = RequestTaskStatus::insertRequestToTaskStatus(
                $this->workflow_id,
                $task_id,
                $request_id,
                $sequence_no,
                $current_user
            );

      
        } else {
            /**
         * Just update the request task status.
         */
            $task_status->setRequest_status($approval_state);
            $task_status->setApp_user($current_user);
            $task_status->setUnixdate(time());

            $result = $task_status->updateRequestTaskStatus();
        }

        return $result;
    }

    /**
     * Update the approver table. Every user approval / disapproval 
     * is inserted here to know during the query already approved or disapproved.
     */
    public function updateRequestTaskApprover(
        $task_id,
        $sequence_no,
        $approval_state,
        $current_user,
        $remarks
    )
    {
        $unixtime = time();
        /**
        * Get request task approver object.
        */
        $task_approver = RequestTaskApprover::getTaskApprover(
            $this->workflow_id,
            $task_id,
            $this->request_id,
            $current_user
        );

        $result = false;
        /**
         * If no transaction yet just insert the transaction.
         */
        if ($task_approver == null) {
            $result = RequestTaskApprover::insertRequestTaskApprover(
                $unixtime,
                $this->request_id,
                $this->workflow_id,
                $task_id,
                $sequence_no,
                $current_user,
                $approval_state,
                $remarks
            );

            /**
             * Else update if already available.
             */
        } else {
            $task_approver->setUnixdate($unixtime);
            $task_approver->setSequence_no($sequence_no);
            $task_approver->setApprover_id($current_user);
            $task_approver->setApproval_status($approval_state);
            $task_approver->setRemarks($remarks);

            $result = $task_approver->updateRequestTaskApprover();
        }

        /**
     * Insert to the approval history table.
     */
        $result = RequestApproval::insertRequestApproval(
            $this->request_id,
            $this->workflow_id,
            $task_id,
            $approval_state,
            $current_user,
            $remarks,
            $unixtime
        );

        return $result;
    }


    /**
     * Check if the request task is complete or still in progress.
     */
    public function getRequestStatus($task_id)
    {
        $workflow = new Workflow($this->workflow_id);

        // no. of task on a request or workflow
        $total_task = $workflow->getTaskCount();

        // check if all task in a request is completed
        $isRequestComplete = $this->isRequestApprovalComplete();

        // check if the task approval is completed or fully approved
        $isTaskComplete = $this->isTaskApprovalComplete($task_id);

        $status = '';

        // completed
        if ($isRequestComplete &&   $isTaskComplete) {
            return 'Completed';
        }

        // In Progress
        elseif (!$isTaskComplete) {
            return 'InProgress';

        // Task is completed but the request task not all yet approved
        // approved or confirmed
        } elseif ($isTaskComplete && !$isRequestComplete) {
            return "Approved";
        } else {
            return "Approved";
        }
    }

    //get last action from history
public function getRequestLastState(){
    
    $sql = "SELECT user_apex
    FROM fs_request_approval 
    WHERE request_id='$this->request_id' 
    ORDER BY id DESC LIMIT 1";

    $query = $this->conn->query($sql);

    if (!$query) {
        throw new Exception("Not able to retreive request last state");
    }

    if ($query->num_rows > 0) {
        $row = $query->fetch_assoc();
        return $row['user_apex'];
    }

    return '';
}

    public function listRequest(){

        $sql = "SELECT rm.rq_id, rm.rq_status, rm.rq_name, rm.rq_description, 
		wf.form_sequence, wf.form_id, wf.form_name, 
		wf.form_steps_id,fss.work_id, fss.work_name, rts.user_approvers
		FROM fs_request_main rm 
		LEFT JOIN fs_workflow wf ON wf.form_id=rm.rq_workflow
		LEFT JOIN fs_workstpes fss ON fss.work_id=wf.form_steps_id
		LEFT JOIN fs_request_task_status rts ON rts.rq_step_id = wf.form_steps_id 
        and rts.rq_no = '$this->request_id' 
		WHERE rm.rq_id = '$this->request_id' ORDER BY wf.form_sequence ASC";


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
    ) {
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
    public function GetWorkflow()
    {
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

    public function Requestor()
    {
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
