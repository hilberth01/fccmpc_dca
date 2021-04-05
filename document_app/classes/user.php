<?php

class user{
    private $id;
    private $user_id;
    private $first_name;
    private $last_name;
    private $middle_name;
    private $password;
    private $user_mail;
    private $photo;
    private $access_level;
    private $department;
    private $last_login;
    private $created_on;

    private $conn;
    private $user_row;

    public function __construct($user_id)
    {
        $this->conn = $GLOBALS['conn'];
        $sql = "SELECT * FROM fs_users WHERE user_id = '$user_id' LIMIT 1";

        try {

            $result = $this->conn->query($sql);

                if ($result->num_rows > 0) {

                $row = $result->fetch_assoc();

                // update the row
                $this->user_row = $row;

                $this->id = $row['id'];
                $this->user_id = $row['user_id'];
                $this->first_name = $row['firstname'];
                $this->middle_name = $row['middlename'];
                $this->last_name = $row['lastname'];
                $this->password = $row['password'];
                $this->user_mail = $row['user_email'];
                $this->photo = $row['photo'];
                $this->access_level = $row['access_level'];
                $this->department = $row['department'];
                $this->last_login = $row['last_login'];
                $this->created_on = $row['created_on'];

            }


        } catch (Exception $ex) {
            throw new Exception($ex);
        }

        finally{
          
        }
    }

    function __destruct(){
       // $this->conn->close();
    }

    public static function get_users_request($users_id) {
        $conn = $GLOBALS['conn'];

        $sql = "SELECT X.rq_id FROM (
            select frm.rq_id, ug.ug_members
            from fs_users us
            LEFT JOIN fs_user_group ug 
            ON find_in_set(us.user_id,ug.ug_members)
            LEFT JOIN fs_request_task_status rts 
            ON  find_in_set(ug.ug_id,rts.user_approvers)
            LEFT JOIN fs_request_main frm 
            ON frm.rq_workflow = rts.rq_work_id and frm.rq_id = rts.rq_no
            WHERE frm.rq_status 
            not in ('Completed','Cancelled') 
            AND us.user_id = '$users_id') X
            WHERE X.ug_members like '%$users_id%'
            GROUP BY X.rq_id";

        $query = $conn->query($sql);
        $emil = '';

        while($row = $query->fetch_assoc()){		
            $emil .= $row['rq_id'].',';
        }
        
        return $emil;
        $conn->close();
        
    }

    function getUsersPendingRequest() {

    }

    function getUserApprovals() {

    }

    function getUsersWorkFlows(){

    }

    function getUsersTask(){

    }

    public function isUserAdmin(){
        if ($this->$access_level == 'Administrator' 
        || $this->$access_level == 'DocAdmin') return true;

        return false;
    }

    public function update_user(
        $userId,
        $firstname,
        $middlename,
        $lastname,
        $emailadd,
        $accesslevel,
        $department,
        $password
    ) {

        $sql = "UPDATE fs_users SET user_id = '$userId', 
    firstname = '$firstname', middlename = '$middlename', 
    lastname = '$lastname', user_email = '$emailadd', 
    access_level = '$accesslevel', department = '$department', 
    password = '$password' 
    WHERE user_id = '$this->user_id'";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql))
            return true;

        return false;
    }

    // update the photo of the user
    public function update_photo($filename)
    {
        $sql = "UPDATE fs_users SET photo = '$filename' 
        WHERE user_id = '$this->user_id'";

        if ($this->conn->query($sql) == TRUE)
            return true;

        echo 'db' . $this->conn_error;
        return false;
    }

    // delete user 
    public function delete_user()
    {
        $sql = "DELETE FROM fs_users WHERE user_id = '$this->user_id'";

        if ($this->conn->query($sql) == TRUE)
            return true;

        echo 'db' . $this->conn_error;
        return false;
    }

    public static function list_users()
    {
        $sql = "SELECT * FROM fs_users";

        $conn = $GLOBALS['conn'];
        if ($conn->query($sql)) {
        }
    }

    public static function insert_user(
        $user_id,
        $password,
        $firstname,
        $middlename,
        $lastname,
        $emailadd,
        $accesslevel,
        $department,
        $filename
    ) {

        $sql = "INSERT INTO fs_users (user_id, password, firstname, 
        middlename, lastname, user_email, access_level, department, photo) 
		VALUES ('$user_id', '$password', '$firstname', '$middlename', 
        '$lastname', '$emailadd', '$accesslevel', '$department', '$filename')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql))
            return true;

        echo 'db error' . $conn->error;
        return false;
    }


    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of user_id
     */ 
    public function getUser_id()
    {
        return $this->user_id;
    }

    /**
     * Set the value of user_id
     *
     * @return  self
     */ 
    public function setUser_id($user_id)
    {
        $this->user_id = $user_id;

        return $this;
    }

    /**
     * Get the value of first_name
     */ 
    public function getFirst_name()
    {
        return $this->first_name;
    }

    /**
     * Set the value of first_name
     *
     * @return  self
     */ 
    public function setFirst_name($first_name)
    {
        $this->first_name = $first_name;

        return $this;
    }

    /**
     * Get the value of middle_name
     */ 
    public function getMiddle_name()
    {
        return $this->middle_name;
    }

    /**
     * Set the value of middle_name
     *
     * @return  self
     */ 
    public function setMiddle_name($middle_name)
    {
        $this->middle_name = $middle_name;

        return $this;
    }

    /**
     * Get the value of password
     */ 
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set the value of password
     *
     * @return  self
     */ 
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Get the value of user_mail
     */ 
    public function getUser_mail()
    {
        return $this->user_mail;
    }

    /**
     * Set the value of user_mail
     *
     * @return  self
     */ 
    public function setUser_mail($user_mail)
    {
        $this->user_mail = $user_mail;

        return $this;
    }

    /**
     * Get the value of photo
     */ 
    public function getPhoto()
    {
        return $this->photo;
    }

    /**
     * Set the value of photo
     *
     * @return  self
     */ 
    public function setPhoto($photo)
    {
        $this->photo = $photo;

        return $this;
    }

    /**
     * Get the value of access_level
     */ 
    public function getAccess_level()
    {
        return $this->access_level;
    }

    /**
     * Set the value of access_level
     *
     * @return  self
     */ 
    public function setAccess_level($access_level)
    {
        $this->access_level = $access_level;

        return $this;
    }

    /**
     * Get the value of department
     */ 
    public function getDepartment()
    {
        return $this->department;
    }

    /**
     * Set the value of department
     *
     * @return  self
     */ 
    public function setDepartment($department)
    {
        $this->department = $department;

        return $this;
    }

    /**
     * Get the value of last_login
     */ 
    public function getLast_login()
    {
        return $this->last_login;
    }

    /**
     * Set the value of last_login
     *
     * @return  self
     */ 
    public function setLast_login($last_login)
    {
        $this->last_login = $last_login;

        return $this;
    }

    /**
     * Get the value of created_on
     */ 
    public function getCreated_on()
    {
        return $this->created_on;
    }

    /**
     * Set the value of created_on
     *
     * @return  self
     */ 
    public function setCreated_on($created_on)
    {
        $this->created_on = $created_on;

        return $this;
    }

    /**
     * Get the value of conn
     */ 
    public function getConn()
    {
        return $this->conn;
    }

    /**
     * Set the value of conn
     *
     * @return  self
     */ 
    public function setConn($conn)
    {
        $this->conn = $conn;

        return $this;
    }

    /**
     * Get the value of user_row
     */ 
    public function getUser_row()
    {
        return $this->user_row;
    }

    /**
     * Set the value of user_row
     *
     * @return  self
     */ 
    public function setUser_row($user_row)
    {
        $this->user_row = $user_row;

        return $this;
    }

    /**
     * Get the value of last_name
     */ 
    public function getLast_name()
    {
        return $this->last_name;
    }

    /**
     * Set the value of last_name
     *
     * @return  self
     */ 
    public function setLast_name($last_name)
    {
        $this->last_name = $last_name;

        return $this;
    }
}
?>
