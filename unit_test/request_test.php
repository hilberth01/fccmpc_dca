
<?php

require '../document_app/classes/workflow.php';
require '../document_app/classes/task.php';
require '../document_app/includes/conn.php';
require '../document_app/classes/user_group.php';
require_once '../document_app/classes/user.php';
require '../document_app/includes/functions_mail.php';
require '../document_app/includes/functions.php';
require_once '../document_app/classes/request.php';


use PHPUnit\Framework\TestCase;

class RequestTest extends TestCase
{
    private $request;

    protected function setUp(): void
    {
        $this->request = new Request("FCCMPC-0000050");
    }

    public function testGetWorkflow() : void
    {
        $this->assertTrue($this->request != null);

    }

    public function testTaskComplete(){
        
        $result = $this->request->isTaskApprovalComplete('FOES7XV8I35HYCG');
        $this->assertTrue($result);
    }

    /**
     * Test to get the number of approvers in a certain task
     */
    public function testGetRequestApproverCount(){
        $expected = 6;
        $actual = $this->request->getRequestTaskApproversCount('M9RXFWGI31NOQVC');
        $this->assertEquals($expected, $actual);
    }


    public function testIsRequestCompleted(){

        $expected = true;
        $actual = $this->request->isRequestApprovalComplete();

        $this->assertEquals($expected, $actual);

    }
    
}
?>