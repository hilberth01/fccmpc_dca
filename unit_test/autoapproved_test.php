
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

class AutoApprovedTest extends TestCase
{
    private $request;
    private $control_no;

    protected function setUp(): void
    {
        $this->request = new Request("FCCMPC-0000001");
    }

    public function testListIncompleteTask(){

        $tasks = request:: listInProgressTask();

        foreach ($tasks as $task){
            echo "\r\nTask still to approved: " . $task->getTask_name();
          
        }
    }

    public function testNextIncompleteTask(){
        $tasks = new ArrayCollection();

        $tasks = request:: listNextTaskForApproval();

        foreach ($tasks as $task){
            echo "\r\nNext task to approve: " . $task->getTask_name();
        }
    }
    
}
?>