<?php

//include 'request_approval.php';

class RequestAttachement
{
    private $id;
    private $request_id;
    private $file_name;
    private $file_uploader;
    private $file_unix;

    private $conn;
    private $row;

    public function __construct($id)
    {

        $sql = "SELECT * FROM fs_request_attachment
            where file_id = '$id'";

        if (is_numeric($id)) {
            $sql = "SELECT * FROM fs_request_attachment
            where id = $id";
        }

        $this->conn = $GLOBALS['conn'];
        $result = $this->conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            
            $this->row = $row;
            $this->id = ($row['id']);
            $this->request_id = ($row['file_id']);
            $this->file_name = $row['file_name'];
            $this->file_uploader = $row['file_uploader'];
            $this->file_unix = $row['file_unix'];
       
            $result->close();
        }
        
    }

    public function __destruct()
    {
      // $this->conn->close();
    }

    /**
     * Delete the attachment
     */
    public function delete_request_attachment()
    {
        $sql = "DELETE FROM fs_request_attachment WHERE id = '$this->id'";

        if ($this->conn->query($sql)) {
            return true;
        }

        echo 'db' . $this->conn_error;
        return false;
    }

    /**
     * Update the attachment
     */
    public function update_request_attachment()
    {
        $sql = "UPDATE fs_request_attachment SET
         file_id = '$this->request_id',
         file_name =  '$this->file_name',
         file_uploader = '$this->file_uploader',
         file_unix =  '$this->file_unix'
         where id = '$this->id'";

        echo $sql;
        if ($this->conn->query($sql)) {
            return true;
        }

        return false;
    }

    /**
     * Get number of rows in the table
     */
    public function get_record_count(){
        
        $sql = "SELECT count(id) as recno 
        FROM fs_request_attachment 
        WHERE file_id = '$this->request_id'";

        $result = $this->conn->query($sql);

        $count = 0;

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $count = $row['recno'];
        }
        return $count;
    }

    /**
     * Insert the file from the request.
     */
    public static function insert_request_attachment(
        $request_id,
        $file_name,
        $file_uploader,
        $file_unix
    ) {
        $sql = "INSERT INTO fs_request_attachment
            (file_id,
            file_name,
            file_uploader,
            file_unix)
            VALUES ('$request_id',
            '$file_name',
            '$file_uploader',
            '$file_unix')";

        $conn = $GLOBALS['conn'];

        if ($conn->query($sql)) {
            return true;
        }
        
        echo 'db error' . $conn->error;
        return false;
        $conn->close();
    }

    /**
     * Check if the attachment is  updated
     * 
     * @return 'YES' if updated else 'No'
     */
    public function is_attachment_updated()
    {
        if (!isset($this->request_id)) return "No";
        
        $file_stamp  =  (!isset($this->file_unix)) ? 0 : $this->file_unix;
        
        $request_stamp = RequestApproval::
            get_request_approval_date($this->request_id);

        if ($request_stamp < $file_stamp) {
            return "Yes";
        } else {
            return "No";
        }
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
     * Get the value of request_id
     */
    public function getRequest_id()
    {
        return $this->request_id;
    }

    /**
     * Set the value of request_id
     *
     * @return  self
     */
    public function setRequest_id($request_id)
    {
        $this->request_id = $request_id;

        return $this;
    }

    /**
     * Get the value of file_name
     */
    public function getFile_name()
    {
        return $this->file_name;
    }

    /**
     * Set the value of file_name
     *
     * @return  self
     */
    public function setFile_name($file_name)
    {
        $this->file_name = $file_name;

        return $this;
    }

    /**
     * Get the value of file_uploader
     */
    public function getFile_uploader()
    {
        return $this->file_uploader;
    }

    /**
     * Set the value of file_uploader
     *
     * @return  self
     */
    public function setFile_uploader($file_uploader)
    {
        $this->file_uploader = $file_uploader;

        return $this;
    }

    /**
     * Get the value of file_unix
     */
    public function getFile_unix()
    {
        return $this->file_unix;
    }

    /**
     * Set the value of file_unix
     *
     * @return  self
     */
    public function setFile_unix($file_unix)
    {
        $this->file_unix = $file_unix;

        return $this;
    }

    /**
     * Get the value of row
     */ 
    public function getRow()
    {
        return $this->row;
    }

    /**
     * Set the value of row
     *
     * @return  self
     */ 
    public function setRow($row)
    {
        $this->row = $row;

        return $this;
    }
}
