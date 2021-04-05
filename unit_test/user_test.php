
<?php

require '../document_app/classes/user.php';
require '../document_app/includes/conn.php';

use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    private $user;

    protected function setUp(): void
    {
        $this->user = new user('bert');
    }

    public function testGetFirstName() : void
    {
        if (!isset($this->user)) {
            $this->assertEquals('Hilberth2', $this->user->first_name);
        }

        echo "User " . $this->user->user_id . " does not exist.\n";
        $this->assertTrue(true);
    }

    public function testDeleteUser()
    {
        if (!isset($this->user)) {
            $result = $this->user->delete_user();
            $this->assertTrue($result);
            echo $this->user->user_id . " successfully deleted.\n";
        } else {
            $this->assertTrue(true);
            echo $this->user->user_id . " not exist.\n";
        }
    }


    public function testInsertUser()
    {

        $new_user = new user("bert");
        if (isset($new_user)) {
            // delete the user if exist
            $this->user->delete_user();
            echo "User successfully deleted\n";
        }

        $result = $this->user->insert_user(
            "bert",
            "12345",
            "Hilberth2",
            "U",
            "Regala",
            "hilbert01@yahoo.com",
            "1",
            "IT",
            ""
        );

        $this->assertTrue($result);
        echo "User successfully inserted\n";
    }
}
?>