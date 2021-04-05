
<?php

require '../document_app/includes/conn.php';
require '../document_app/classes/request_task_status.php';

use PHPUnit\Framework\TestCase;
use Doctrine\Common\Collections\ArrayCollection;

class TaskTest extends TestCase
{
    private $request_task_status;

    protected function setUp(): void
    {
        $this->request_task_status = new RequestTaskStatus(364);
    }

    public function testGetRequestTaskStatus() : void
    {
        if (!is_null($this->request_task_status)) {
            $this->assertEquals('1', 
            $this->request_task_status->getSequence_no());
        }
        else
            throw new Exception("Request status task not found");
         
    }

    // public function testInsertNewRequestTaskStatus(){
    //     RequestTaskStatus::InsertNewRequest('FCCMPTEST', 'SYR85G14OIPHA9L',
    //     'E5KGHJ47DU1A,SAMWXPZ5N6OY');
    // }

    public function testIsRequestorApprover() {
        $this->assertTrue($this->request_task_status->isRequestorApprover('Sheila'));
        $this->assertFalse($this->request_task_status->isRequestorApprover('Teo'));
    }

    public function testIsUserAlreadyApproved(){
        $this->assertTrue($this->request_task_status->isUserAlreadyReviewed('Sheila'));
        $this->assertFalse($this->request_task_status->isUserAlreadyReviewed('Teo'));
    }

}
?>