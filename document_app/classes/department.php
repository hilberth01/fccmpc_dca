<?php

require_once 'user.php';

class department{
    private $department_id;
    private $department_no;
    private $department_name;
    private $department_approver;

    private $conn;
    private $department_row;

    public function __construct($department_id){

        $this->conn = $GLOBALS['conn'];
        
        $sql = "SELECT * FROM fs_department 
        where dept_no = '$department_id'";

        // if int then we have to get query by department id
        if (is_numeric($department_id))
            $sql = "SELECT * FROM fs_department 
            where id = '$department_id'";

        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $this->department_row = $row;

            $this->department_id = $row['id'];
            $this->department_no = $row['dept_no'];
            $this->department_name = $row['dept_name'];
            $this->department_approver = $row['dept_approver'];

            $result->close();
       
        }
    }

    public function update_department()
    {
        $sql = "UPDATE fs_department SET dept_no = '$this->department_no',
        dept_name = '$this->department_name', dept_approver = '$this->department_approver'
        where id = '$this->department_id'";

        if ($this->conn->query($sql))
            return true;

        return false;
    }

    public function delete_department()
    {

        $sql = "DELETE FROM fs_department where id = '$this->department_id'";

        if ($this->conn->query($sql))
            return true;

        echo 'db' . $this->conn_error;
        return false;
    }

    public function get_department_user(){

        $sql = "SELECT user_id FROM fs_users WHERE department = '$this->department_id'
        ORDER BY firstname ASC LIMIT 1";

         $result = $this->conn->query($sql);

         if ($result) {
             $row = $result->fetch_assoc();
             return new user($row['user_id']);
         }

         else return null;

    }

    public static function list_department(){
        $sql = "SELECT * FROM fs_department ORDER BY dept_no ASC";

        $conn = $GLOBALS['conn'];
        return  $conn->query($sql);
    }

    public static function insert_department(
        $department_no,
        $department_name,
        $department_approver
    ) {

        $sql = "INSERT INTO fs_department (dept_no, dept_name, dept_approver)
        VALUES ('$department_no', '$department_name', '$department_approver')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql))
            return true;

        echo 'db error' . $conn->error;
        return false;
    }
 

    /**
     * Get the value of department_id
     */ 
    public function getDepartment_id()
    {
        return $this->department_id;
    }

    /**
     * Set the value of department_id
     *
     * @return  self
     */ 
    public function setDepartment_id($department_id)
    {
        $this->department_id = $department_id;

        return $this;
    }

    /**
     * Get the value of department_no
     */ 
    public function getDepartment_no()
    {
        return $this->department_no;
    }

    /**
     * Set the value of department_no
     *
     * @return  self
     */ 
    public function setDepartment_no($department_no)
    {
        $this->department_no = $department_no;

        return $this;
    }

    /**
     * Set the value of department_name
     *
     * @return  self
     */ 
    public function setDepartment_name($department_name)
    {
        $this->department_name = $department_name;

        return $this;
    }

    /**
     * Get the value of department_approver
     */ 
    public function getDepartment_approver()
    {
        return $this->department_approver;
    }

    /**
     * Set the value of department_approver
     *
     * @return  self
     */ 
    public function setDepartment_approver($department_approver)
    {
        $this->department_approver = $department_approver;

        return $this;
    }

    /**
     * Get the value of department_row
     */ 
    public function getDepartment_row()
    {
        return $this->department_row;
    }

    /**
     * Set the value of department_row
     *
     * @return  self
     */ 
    public function setDepartment_row($department_row)
    {
        $this->department_row = $department_row;

        return $this;
    }
}
?>