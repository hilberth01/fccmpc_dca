
<?php

require '../document_app/classes/department.php';
require '../document_app/includes/conn.php';

use PHPUnit\Framework\TestCase;

class DepartmentTest extends TestCase
{
    private $department;

    protected function setUp(): void
    {
        $this->department = new department("HR Admin");
    }

    public function testGetDepartmentNo() : void
    {
        if (isset($this->department)) {
            $this->assertEquals('HR Admin', $this->department->department_no);
        }
    }

    public function testDeleteDepartment()
    {
        if (isset($this->department)) {
            
            $result = $this->department->delete_department();
            $this->assertTrue($result);
            echo $this->department->department_no . " successfully deleted.\n";

        } else {
            $this->assertTrue(true);
            echo $this->department->department_no . " not exist.\n";
        }
    }


    public function testInsertDepartment()
    {

        $new_department = new department("HR Admin");
        if (isset($new_department)) {
            // delete the user if exist
            $this->department->delete_department();
            echo "Department successfully deleted\n";
        }

        $result = $this->department->insert_department(
            "HR Admin",
            "HR Department",
            "YES"
        );

        $this->assertTrue($result);
        echo "Department successfully inserted\n";
    }
}
?>