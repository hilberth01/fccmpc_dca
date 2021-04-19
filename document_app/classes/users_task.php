<?php


class UsersTask{
    private $user;
    private $task;
    private $request;

    private $conn;

    public function __construct()
    {
    }

    function __destruct(){
       // $this->conn->close();
    }

    public function updateTask(){
    }

    /**
     * Get the value of user
     */ 
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set the value of user
     *
     * @return  self
     */ 
    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get the value of task
     */ 
    public function getTask()
    {
        return $this->task;
    }

    /**
     * Set the value of task
     *
     * @return  self
     */ 
    public function setTask($task)
    {
        $this->task = $task;

        return $this;
    }

    /**
     * Get the value of request
     */ 
    public function getRequest()
    {
        return $this->request;
    }

    /**
     * Set the value of request
     *
     * @return  self
     */ 
    public function setRequest($request)
    {
        $this->request = $request;

        return $this;
    }
}
?>
