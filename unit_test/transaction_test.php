
<?php

require '../document_app/includes/conn.php';
require_once '../document_app/classes/user.php';
require_once '../document_app/includes/functions_mail.php';
require_once '../document_app/includes/functions.php';

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
        $this->request = new request("FCCMPC-0000050");
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

        $request = new request($control_no);
        $request->initiateNewRequest($selected_group_of_approver);
     
        echo "\r\nRequest task successfully inserted to request approver table.";

    }

    public function processApproval($status)
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

        $result =  $request->processRequestApproval($task, $status, 
                        $current_approver->getUser_id(), "System Test");
       
    }

    public function testApproved(){
        $this->processApproval("Approved");
    }

    public function testDisapproved(){
        $this->processApproval("Disapproved");
    }

    public function testResubmit(){

        $request_id = "FCCMPC-0000224";

        $request = new request($request_id);
        $request->resubmitRequest();
    }

    public function testCancel(){

        $request_id = "FCCMPC-0000205";
        $request = new request($request_id);

        $active_user = new User("Minda");
        $request->cancelRequest($active_user);
    }

    public function testAutoApproved(){

        request::autoApprovedRequest();
     

    }

    
}
?>