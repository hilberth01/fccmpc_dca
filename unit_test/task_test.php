
<?php

require '../document_app/classes/task.php';
require '../document_app/classes/user_group.php';
require '../document_app/includes/conn.php';

use PHPUnit\Framework\TestCase;
use Doctrine\Common\Collections\ArrayCollection;

class TaskTest extends TestCase
{
    private $task;

    protected function setUp(): void
    {
        $this->task = new task("TSX1UQP25VA0Z9J");
    }

    public function testGetTask() : void
    {
        if (!is_null($this->task)) {
            $this->assertEquals('KBOC Approval', $this->task->getTask_name());
            
            $collection = $this->task->getTaskApproverGroup();

            foreach ($collection as $user_group) {
                echo "\r\nApprover group: " . $user_group->getGroup_name();

                $users = $user_group->getApprovers();

                foreach ($users as $user){
                    echo "\r\n User: " . $user->getFirst_name();
                }
            }
        }
        else
            throw new Exception("Task not found.");
         
    }

    public function testUpdateTask()
    {
        $this->task->setNeeded_approval(5);
        $this->task->update_task();

        $updated_task = new task($this->task->getTask_id());
        $this->assertEquals(5, $updated_task->getNeeded_approval());
    }


    // public function testDeleteTask()
    // {
    //     if (!is_null($this->task)) {
            
    //         $result = $this->task->delete_task();
    //         $this->assertTrue($result);
    //         echo $this->task->task_id . " successfully deleted.\n";

    //     } else {
    //         $this->assertTrue(true);
    //         echo $this->task->task_id . " not exist.\n";
    //     }
    // }

    public function testInsertTask()
    {

        $new_task = new task("TSX1UQP25VA0Z9J");
        if (!is_null($new_task)) {
            // delete the task if exist
            $this->task->delete_task();
            echo "Task successfully deleted\n";
        }

        $result = $this->task->insert_task(
            "TSX1UQP25VA0Z9J",
            "KBOC Approval",
            "FK6XL3P1WM2I",
            "Parallel",
            "Concurrence",
            "3",
            "3",
            "N/A",
            "N/A",
            "No",
            "Yes"
        );

        $this->assertTrue($result);
        echo "Task successfully inserted\n";
    }

    
}
?>