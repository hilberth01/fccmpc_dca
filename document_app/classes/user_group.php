<?php

require_once '../vendor/autoload.php';
require_once 'user.php';
use Doctrine\Common\Collections\ArrayCollection;

class user_group
{
    private $id;
    private $group_id;
    private $group_name;
    private $group_description;
    private $group_members;

    private $conn;
    private $group_row;

    public function __construct($group_id)
    {
        $this->conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_user_group WHERE ug_id = '$group_id'";

        if (is_numeric($group_id))
            $sql = "SELECT * FROM fs_user_group WHERE id = '$group_id'";

        $result = $this->conn->query($sql);

        if ($result) {
           $row = $result->fetch_assoc();

            $this->id = $row['id'];
            $this->group_id = $row['ug_id'];
            $this->group_name = $row['ug_name'];
            $this->group_description = $row['ug_description'];
            $this->group_members = $row['ug_members'];

            $this->group_row = $row;
            $result->close();
          
        } 
        
    }

    public function __destruct(){
       // $this->conn->close();
    }

    /**
     * Get group approvers or users.
     */
    public function getApprovers(){
        
        $users = explode(',', $this->group_members);

        // create user collection
        $collection = new ArrayCollection();

        foreach($users as $value){
            $collection->add(new user($value));
        }

        return $collection;
    }

    // public function __set($name, $value){
    //     $this->group_row = $value;
    // }

    // public function  __get($name){
    //     return $this->group_row;
    // }

    public function update_group()
    {
        $sql = "UPDATE fs_user_group SET ug_id = '$this->group_id',
        ug_name = '$this->group_name', ug_description = '$this->group_description',
        ug_members = '$this->group_members' where id = '$this->id'";
        
        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    public function delete_group()
    {
        $sql = "DELETE FROM fs_user_group where id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn->error;
        return false;
    }

    public static function insert_user_group(
        $group_id,
        $name,
        $description,
        $members
    ) {
        $sql = "INSERT INTO fs_user_group (ug_id, ug_name, ug_description, ug_members)
        VALUES ('$group_id', '$name', '$description', '$members')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }

        echo 'db error' . $conn->error;

        $conn->close();
        return false;
    }

    public static function list_user_groups(){
        $conn = $GLOBALS['conn'];

        $sql = "SELECT * FROM fs_user_group";
        return $conn->query($sql);
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
     * Get the value of group_id
     */ 
    public function getGroup_id()
    {
        return $this->group_id;
    }

    /**
     * Set the value of group_id
     *
     * @return  self
     */ 
    public function setGroup_id($group_id)
    {
        $this->group_id = $group_id;

        return $this;
    }

    /**
     * Get the value of group_name
     */ 
    public function getGroup_name()
    {
        return $this->group_name;
    }

    /**
     * Set the value of group_name
     *
     * @return  self
     */ 
    public function setGroup_name($group_name)
    {
        $this->group_name = $group_name;

        return $this;
    }

    /**
     * Get the value of group_description
     */ 
    public function getGroup_description()
    {
        return $this->group_description;
    }

    /**
     * Set the value of group_description
     *
     * @return  self
     */ 
    public function setGroup_description($group_description)
    {
        $this->group_description = $group_description;

        return $this;
    }

    /**
     * Get the value of group_members
     */ 
    public function getGroup_members()
    {
        return $this->group_members;
    }

    /**
     * Set the value of group_members
     *
     * @return  self
     */ 
    public function setGroup_members($group_members)
    {
        $this->group_members = $group_members;

        return $this;
    }

    /**
     * Get the value of group_row
     */ 
    public function getGroup_row()
    {
        return $this->group_row;
    }

    /**
     * Set the value of group_row
     *
     * @return  self
     */ 
    public function setGroup_row($group_row)
    {
        $this->group_row = $group_row;

        return $this;
    }
}
