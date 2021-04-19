
<?php

require '../document_app/includes/conn.php';
require_once '../document_app/classes/user.php';
require '../document_app/includes/functions_mail.php';
require '../document_app/includes/functions.php';

require_once '../document_app/classes/request_approval.php';
require_once '../document_app/classes/request_task_status.php';
require_once '../document_app/classes/request_task_approver.php';
require_once '../document_app/classes/request.php';


use PHPUnit\Framework\TestCase;
use Doctrine\Common\Collections\ArrayCollection;

class TransactionTest extends TestCase
{
    private $request;
    private $control_no;

    protected function setUp(): void
    {
        $this->request = new Request("FCCMPC-0000050");
    }

    public function testGetWorkflow() : void
    {
        $this->assertTrue($this->request != null);
    }

    public function testRequest()
    {
        $control_no = request::generateControlNo();

        $rev_no = "5";
        $document_name = "Loan Release Document";
        $document_desc = "Document for Testing";
        $workflow_id = "SYR85G14OIPHA9L";  // FCCMPC main workflow
        $current_user = "Minda";
        $initial_status = "New";
        $unix_time = time();

        // selected group of approver is IT implementer, Businnes dept, implementers
        $selected_group_of_approver = "2G4KRSL1W6YI,E7SZRKNA1VB3";

        $attachment = "C:\xampp\htdocs\fccmpc_dca\01 READ ME FIRST !!!!.txt";

        $actual = request::insertRequest(
            $rev_no,
            $control_no,
            $document_name,
            $document_desc,
            $workflow_id,
            $current_user,
            $initial_status,
            $unix_time
        );

        $expected = true;
        $this->assertEquals($expected, $actual);
        echo "\r\nRequest has been inserted to request main table.";

        if ($actual) {
            // insert to request approval table
            $actual = RequestApproval::insertRequestApproval(
                $control_no,
                $workflow_id,
                'Created',
                'Created',
                $current_user,
                $initial_status,
                $unix_time
            );

            $this->assertEquals($expected, $actual);
            echo "\r\nTransaction successfully inserted to request approval table.";
        }

        // insert the request to request task status
        // this will create rows of the request task
        $actual = RequestTaskStatus::InsertNewRequest(
            $control_no,
            $workflow_id,
            $selected_group_of_approver
        );

        echo "\r\nRequest task successfully inserted to request approver table.";

    }

    public function testRequestApproval()
    {
        // get the newly inserted request;
        $request =request::getLatestRequest();
        $this->assertNotNull($request);

        $remarks = "Unit test approval";
        $unix_time = time();
        $request_id = $request->getRequest_id();

        echo "\r\nRequest id: " . $request_id;

        $workflow = $request->GetWorkflow();
        $this->assertNotNull($workflow);

        $workflow_id = $workflow->getWf_id();

        // get request current pending task just for testing
        $task = $request->getPendingTask();

        if ($task == null) {
            exit("\r\nRequest already completed");
        }

        echo "\r\nFound task: " . $task->getTask_name();
        
        $task_id = $task->getTask_id();
        $sequence_no = $workflow->getTaskSequence($task_id);

        echo 'Current task sequence: ' . $sequence_no;

        //$approvers = $request->getRequestTaskApproverUsers($task_id);
        //$users = explode(",", $approvers);

        $users = $request->getRequestTaskApproverUsers($task_id);

        echo "\r\nRetreiving task approvers.";

        foreach ($users as $user) {
            echo "\r\nUser: " . $user->getUser_id();
        }

        echo "\r\nRetreiving users currently approved the task.";

        $users = $request->getUsersWhoApprovedTheTask($task_id);

        if ($users->count() > 0) {
            foreach ($users as $user) {
                echo "\r\nUser: " . $user->getUser_id();
            }
        } else {
            echo "\r\nNo user already approved the task.";
        }

        echo "\r\nRetreiving users who still did not approved the task.";

        $users = $request->getUsersStillNeedToApprovedTheTask($task_id);

        if ($users->count() > 0) {
            foreach ($users as $user) {
                echo "\r\nUser: " . $user->getUser_id();
            }
        } else {
            exit("\r\nAll user already approved the task.");
        }
        
        $current_approver = $request->getNextTaskApprover($task_id);

        if ($current_approver == null) {
            echo "\r\nNo current approver has been found.";
        } else {
            echo "\r\nCurrent approver: " . $current_approver->getUser_id();
        }

        $status = $task->isConcurrenceOnly() == true ?  "Confirmed" : "Approved";

       //$this->testApproved($request_id, $workflow_id, $task_id, $current_approver->getUser_id(),
       //     "Approved", $sequence_no);

        $result =  $request->processRequestApproval($task_id, $status, 
                        $current_approver->getUser_id(), "System Test");


        $status = $request->getRequestStatus($task_id);

        $request->setStatus($status);
        $result = $request->updateRequest();

        if ($result) {
            echo "\r\nCurrent status: " . $status;
            echo "\r\nApproval success.";
        }
    }


    /**
     * Approval Testing
     */
    private function testApproved($request_id, $workflow_id, $task_id, 
    $current_user, $approval_state, $seq_no)
    {

        $unixtime = time();
        $remarks = "System unit test";

        $request = new request($request_id);

        /**
         * Get the request task status object.
         */
        $task_status = RequestTaskStatus::getRequestTask(
            $workflow_id,
            $task_id,
            $request_id
        );

        $result = false;
     
        /**
     * Insert the request transaction in the request task status.
     */
        if ($task_status == null) {

            echo "\r\nInserting the request " . $request_id . " to request task status.";
            $result = RequestTaskStatus::insertRequestToTaskStatus(
                $workflow_id,
                $task_id,
                $request_id,
                $seq_no,
                $current_user
            );

            // again get the object
            $task_status = RequestTaskStatus::getRequestTask(
                $workflow_id,
                $task_id,
                $request_id
            );
        } else {
            /**
             * Just update the request task status.
             */
            echo "\r\nUpdating the request task status into " . $approval_state;
            $task_status->setRequest_status($approval_state);
            $task_status->setApp_user($current_user);
            $task_status->setUnixdate($unixtime);

            $result = $task_status->updateRequestTaskStatus();
        }

        /**
        * Get request task approver object.
        */
        $task_approver = RequestTaskApprover::getTaskApprover(
            $workflow_id,
            $task_id,
            $request_id,
            $current_user
        );

        if ($task_approver == null) {

            echo "\r\nInserting the user approval to task approver.";
            $result = RequestTaskApprover::insertRequestTaskApprover(
                $unixtime,
                $request_id,
                $workflow_id,
                $task_id,
                $seq_no,
                $current_user,
                $approval_state,
                $remarks
            );

            // again get the object
            $task_approver = RequestTaskApprover::getTaskApprover(
                $workflow_id,
                $task_id,
                $request_id,
                $current_user
            );
        } else {

            echo "\r\nUpdating the task approver status to " . $approval_state;
            $task_approver->setUnixdate($unixtime);
            $task_approver->setSequence_no($seq_no);
            $task_approver->setApprover_id($current_user);
            $task_approver->setApproval_status($approval_state);
            $task_approver->setRemarks($remarks);

            $task_approver->updateRequestTaskApprover();
        }

        // requestor auto approved
        $requestor_id = $request->getRequestor_id();
        if (($approval_state == 'Approved' || $approval_state == 'Confirmed')  
            && $current_user != $requestor_id) {
            if ($task_status->isRequestorNeedToApproved($requestor_id)) {
                echo "\r\nAutomatically approved the requestor's task";
                $request->autoApprovedRequestor($task_id, $requestor_id, $seq_no);
            }
        }

        /**
	    * Insert to the approval history table.
	    */
	    $result = RequestApproval::insertRequestApproval($request_id, $workflow_id,
        $task_id, $approval_state, $current_user,	$remarks, $unixtime);

        $task = new Task($task_id);
        $required_number_approval = $task->getNeeded_approval();

        $workflow = $request->GetWorkflow();
        $total_task = $workflow->getTaskCount();

        // no. of task approved in a request
        $countstat = $request->getApprovedRequestCount(); // + 1;

        echo "\r\nApproved tasks: " . $countstat;

		// check if current task approval is completed
		$isTaskComplete = $request->isTaskApprovalComplete($task_id);

        if ($isTaskComplete) echo "\r\nTask Completed.";
        else echo "\r\nTask not yet fully approved.";
        
		// check if the request all task has completed.
		$isRequestComplete = $request->isRequestApprovalComplete();
        if ($isRequestComplete) echo "\r\nRequest task approval completed";
        
		// completed
        if ($isRequestComplete &&   $isTaskComplete) {
            $status = 'Completed';
			// In Progress
        } elseif (($approval_state == 'Approved' || $approval_state == 'Confirmed')
            and (!$isTaskComplete)) {
            $status = 'InProgress';

			// Approved or Confirm
        } elseif (($approval_state == 'Approved' || $approval_state == 'Confirmed')
        and ($isTaskComplete && !$isTaskComplete )) {

            $status = $approval_state;
        }

		else {
            $status = $approval_state;
        }
        
        $request->setStatus($status);
        $result = $request->updateRequest();

        echo "\r\nApprover: " . $current_user;
        echo "\r\nCurrent approval state: " . $status;
    }

    public function testResubmit(){

        $unix_time = time();

        // echo "\r\nInserting to request approval table";
        // $result = RequestApproval::insertRequestApproval($request_id,
        // "Resubmit",
        // "Resubmit",
        // "Resubmit",
        // $current_user,
        // "Resubmit",
        // $unix_time);

        // if ($result) echo "Success inserting to approval table";

        $request_id = "FCCMPC-0000158";

        $request = new request($request_id);
        $request->cleanUpdatedTask();
    }

    
}
?>