
<?php

require '../document_app/classes/user_group.php';
require '../document_app/includes/conn.php';
require '../document_app/classes/user.php';


use PHPUnit\Framework\TestCase;
use Doctrine\Common\Collections\ArrayCollection;

class UserGroupTest extends TestCase
{
    private $user_group;

    protected function setUp(): void
    {
        $this->user_group = new user_group("C7W1D0URZ9JK");
    }

    public function testGetDepartmentNo() : void
    {
        if (isset($this->user_group)) {

            $collection = $this->user_group->getApprovers();

            foreach ($collection as $value) {
                echo "\r\n" . $value->getFirst_name(); 
            }
            
        }
    }

    // public function testDeleteUserGroup()
    // {
    //     if (isset($this->user_group)) {
            
    //         $result = $this->user_group->delete_group();
    //         $this->assertTrue($result);
    //         echo "\r\n" .$this->user_group->getGroup_name() . " successfully deleted.\n";

    //     } else {
    //         $this->assertTrue(true);
    //         echo "\r\n" . $this->user_group->getGroup_name() . " not exist.\n";
    //     }
    // }

    // public function testInsertUserGroup()
    // {

    //     $new_user_group = new user_group("C7W1D0URZ9JF");
    //     if (isset($user_group)) {
    //         // delete the user if exist
    //         $this->user_group->delete_group();
    //         echo "\r\n User group successfully deleted\n";
    //     }

    //     $result = user_group::insert_user_group(
    //         "C7W1D0URZ9JF",
    //         "Test Group",
    //         "Testing only",
    //         "Dux,Charisse"
    //     );

    //     $this->assertTrue($result);
    //     echo "\r\n User group successfully inserted\n";
    // }

}
?>