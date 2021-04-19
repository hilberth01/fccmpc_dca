<?php

require_once '../vendor/autoload.php';
require_once 'user.php';
require_once 'user_group.php';

use Doctrine\Common\Collections\ArrayCollection;

class RequestMail
{
    private $request;
    private $request_id;
    private $task;
    private $request_tasks;
    private $requestor;
    private $hostname;
    private $url;
    private $message;

    private $subject = "FCCMPC Document Control - ";


    public function __construct($request_id)
    {
        $hostname =  "http://localhost";  // for unit test
        if (isset($_SERVER['HTTP_HOST'])) {
            $hostname = "http://".$_SERVER['HTTP_HOST'];
        }

        $this->url = $hostname."/coop/document_app/?pid=approval_rev&track={$request_id}";

        $this->request_id = $request_id;

        $this->request = new Request($request_id);
        $this->request_tasks = $this->request->getRequestTasksStatus();

        // requestor user object.
        $this->requestor = $this->request->Requestor();

        $this->subject .= $request_id;
    }

    public function getMessage()
    {
        $this->message .= $this->getMailBody("Approved");
        $this->message .= $this->setTaskStatusTable();

        return $this->message;
    }

    private function setTaskStatusTable()
    {
        foreach ($this->request_tasks as $task) {

            $date_approved = $task->getUnixdate();
            $date_approved = $date_approved == 0 ? "" : date("Y-m-d H:i:s", $date_approved);

            $status = "Pending";
            
            if ($this->request->isTaskApprovalComplete($task->getTask_id())){
                $status = "Approved";
            }

            $this->message .= '<tr>
            <td>' . $task->getSequence_no() . '</td>
            <td>' . $task->Task()->getTask_name() . '</td>
            <td>' . $status . '</td>
            <td>' . $task->getApp_user() . '</td>
            <td>' . $date_approved . '</td>
            </tr>';
        }
    }

    private function getMailBody($status)
    {

         // message
        $this->message = '
    <html>
    <head>
    <style>
    #tablecontent {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    
    #tablecontent td, #tablecontent th {
      border: 1px solid #ddd;
      padding: 5px;
    }
    
    #tablecontent tr:nth-child(even){background-color: #f2f2f2;}
    
    #tablecontent tr:hover {background-color: #ddd;}
    
    #tablecontent th {
      padding-top: 5px;
      padding-bottom: 5px;
      text-align: left;
      background-color: #4CAF50;
      color: white;
    }
    </style>
    </head>
    <body>
    <p>Greetings!</p>';
    
        if ($status == 'Completed') {
            $this->message .= '<p>This is now fully approved, 
                    <br>This approved document should be implemented 14 days from this approval.</p>';
        } elseif ($status == 'Resubmit') {
            $this->message .= '<p>This request was updated by the requestor and it needs an approval,
                    <br>kindly review and follow the link below to render your approval.</p>';
        } elseif ($status == 'Disapproved') {
            $this->message .= '<p>Your request has been disapproved, 
                    <br>kindly review this request and update the necessary inputs.</p>';
        } else {
            $this->message .= '<p>This request needs an approval, 
                    <br>kindly review and follow the link below to render your approval.</p>';
        }
    
        $this->message .= '<p>Title: <i>'.$this->request->getName().'</i></p>
                <p>Description: <i>'.$this->request->getDescription().'</p>';
                
        
        $this->message .='		
        <table style="width:700px" id="tablecontent">
            <tr>
            <th>Seq</th>
            <th>Task</th>
            <th>Status</th>
            <th>Approver</th>
            <th>Date</th>
            </tr>
        ';

        $this->message .=  $this->setTaskStatusTable();
        $this->message .= '
    </table>
    
    <br>
    Request link: <a href="'.$this->url.'">'.$this->request_id.'</span></a><br>
    </body>
  </html>
  ';
    }

    public function sendRequestMail($task_id)
    {
        $cc = $this->requestor->getUser_mail();
        $users = $this->request->getRequestTaskApproverUsers($task_id);

        $to ='';
        
        foreach ($users as $user){
            $to .= $user->getUser_mail() . ",";
        }

        $this->getMailBody("Approved");

        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

        $headers .= 'Cc:'.$cc.' ' . "\r\n";
        
        mail($to, $this->subject, $this->message, $headers);  // temporarily disabled
    }
}
