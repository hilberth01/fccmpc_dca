
<?php

require '../document_app/classes/workflow.php';
require '../document_app/classes/task.php';
require '../document_app/includes/conn.php';
require '../document_app/classes/user_group.php';
require_once '../document_app/classes/user.php';

use PHPUnit\Framework\TestCase;

class WorkflowTest extends TestCase
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

    // public function testUpdateWorkflow()
    // {
    //     $this->workflow->setApproval_type("parallel");
    //     $this->workflow->update_workflow();

    //     $updated_workflow = new workflow($this->workflow->getId());
    //     $this->assertEquals("parallel", $updated_workflow->getApproval_type());
    // }

    public function testGetWorkflowTask()
    {
        $tasks = $this->workflow->getTasks();

       foreach ($tasks as $task) {
           echo "\r\nTask: " . $task->getTask_name();
           
           // get task approvers
           $approvers = $task->getTaskApproverGroup();
           
           foreach ($approvers as $approver){
               echo "\r\nApprover group: " . $approver->getGroup_name();

               // get the group members
               $users = $approver->getApprovers();

               echo "\r\nMembers:";
               foreach ($users as $user){
                   echo "\r\n" . $user->getFirst_name();
               }
           }

       }
    }

    // public function testDeleteWorkflow()
    // {
    //     if (!is_null($this->workflow)) {
            
    //         $result = $this->workflow->delete_workflow();
    //         $this->assertTrue($result);
    //         echo $this->workflow->wf_name . " successfully deleted.\n";

    //     } else {
    //         $this->assertTrue(true);
    //         echo $this->workflow->wf_name . " not exist.\n";
    //     }
    // }

    // public function testInsertWorkflow()
    // {

    //     $new_workflow = new workflow("ZJVUOB63FMWCS9T");
    //     if (!is_null($new_workflow)) {
    //         // delete the user if exist
    //         $this->workflow->delete_workflow();
    //         echo "Workflow successfully deleted\n";
    //     }

    //     $result = $this->workflow->insert_workflow(
    //         "ZJVUOB63FMWCS9T",
    //         "KNOWLES BRANCH Workflow",
    //         "LWU2GAZ6HR51O0X",
    //         "1",
    //         "NA",
    //         "series"
    //     );

    //     $this->assertTrue($result);
    //     echo "Workflow successfully inserted\n";
    // }

    
}
?>