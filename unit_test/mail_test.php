
<?php

require '../document_app/classes/workflow.php';
require '../document_app/classes/task.php';
require '../document_app/includes/conn.php';
require '../document_app/classes/user_group.php';
require_once '../document_app/classes/user.php';
require '../document_app/includes/functions_mail.php';
require '../document_app/includes/functions.php';


use PHPUnit\Framework\TestCase;

class MailTest extends TestCase
{
    private $workflow;

    protected function setUp(): void
    {
        $this->workflow = new workflow("SYR85G14OIPHA9L");
    }

    public function testGetWorkflow() : void
    {
        if (!is_null($this->workflow)) {
            $this->assertEquals("MAIN OFFICE Workflow", $this->workflow->getWf_name());
        }
        else
         throw new Exception("Workflow not found.");
    }

    public function testSendRequest(){
        send_mail("FCCMPC-0000103");
    }

    // public function testMail(){
    //     mail("hilberth01@yahoo.com", "Test Mail", "This is just a test", 
    //     "From:fccmpc_dca.noreply<fccmpc_dca@fccmpc.com>\r\nContent-Type:h");
    // }


    
}
?>