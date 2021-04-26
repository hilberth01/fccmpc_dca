<?php

    require_once '../vendor/autoload.php';

    include 'includes/session.php';
    include 'includes/logger.php';
    include 'includes/functions.php';
    include 'includes/functions_mail.php';
    require_once 'classes/request.php';
    require_once 'classes/request_approval.php';
    require_once 'classes/request_attachment.php';
    require_once 'classes/request_task_status.php';
    require_once 'classes/user_group.php';
    require_once 'classes/request_mail.php';

    require_once 'classes/app_logger.php';

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    
    $paction = '';
    $send_mail = 'NO';
    
    //execute add item=======================================
    if (isset($_POST['add'])) {

        $docname = $_POST['docname'];
        $docdesp = $_POST['docdesp'];
        $workflow = $_POST['workflow'];
        //$platform = $_POST['platform'];
        $filename = $_FILES['docname']['name'];
        $unixtime = time();
        $activeuser = $user['user_id'];
        $initstat = "New";
        $rev_no = $_POST['revno'];//create_revision_no($docname);
            
       // $task_id = (isset($_POST['task_id'])) ? $_POST['task_id'] : '';
        $app_group_sel = (isset($_POST['app_group'])) ? implode(',', $_POST['app_group'])
                        : '';
        
        // genereate control code no.
        $genControlNo = request::generateControlNo();

        /**
         * Insert the request to main request table.
         */
        if ($docdesp == "") {
            $docdesp = '';
        }

        $result = request::insertRequest(
            $rev_no,
            $genControlNo,
            $docname,
            $docdesp,
            $workflow,
            $activeuser,
            $initstat,
            $unixtime);
        
        Applogger::debug("Inserting new request: " . $genControlNo . " by user: " . $active_user);
            
        $request = new request($genControlNo);
        $request->initiateNewRequest($app_group_sel);                                                   
                    
        if ($result){
            $_SESSION['success'] = 'New request has been successfully generated.';
        } else {
            $_SESSION['error'] = $conn->error;
        }

        if (!empty($filename)) {
            move_uploaded_file($_FILES['docname']['tmp_name'],
                './file_dump/'.$filename);
            
            $result = RequestAttachement::insert_request_attachment($genControlNo,
                                $filename, $activeuser, $unixtime);

            if ($result) {
                $_SESSION['success'] .= ' New file has been successfully uploaded';
            } else {
                $_SESSION['error'] .= $conn->error;
            }
        }
    
        $paction = 'INSERT';

    }  //execute edit item=======================================

    elseif (isset($_POST['edit'])) {
        $id = $_POST['id'];
        $docname = $_POST['edit_docname'];
        $docdesp = $_POST['edit_docdesp'];
        $rev_no = $_POST['edit_revno'];
        //$workflow = $_POST['edit_workflow'];

        $request = new Request($id);

        $request->setName($docname);
        $request->setDescription($docdesp);
        $request->setRevision_id($rev_no);

        $result = $request->update_request_info();

        if ($result) {
            $_SESSION['success'] = 'Request has been successfully updated';
        } else {
            $_SESSION['error'] = 'Fail to update request';
        }

        $paction = 'UPDATE';
    }
    

    /**
     * Update file attachment
     */
    elseif (isset($_POST['upload'])) {
        $file_id = $_POST['refile_id'];
        $filename = $_FILES['reupload']['name'];
        $unixtime = time();
        $activeuser = $user['user_id'];
        
        if (!empty($filename)) {
            move_uploaded_file($_FILES['reupload']['tmp_name'], './file_dump/'.$filename);
        }
        
        $attachment = new RequestAttachement($file_id);
        $count = $attachment->get_record_count();
        
        $result = false;

        if ($count == 0) {
            $result = RequestAttachement::insert_request_attachment(
                $file_id,
                $filename,
                $activeuser,
                $unixtime
            );

            $paction = 'INSERT';
        } else {
            $attachment->setFile_name($filename);
            $attachment->setFile_uploader($activeuser);
            $attachment->setFile_unix($unixtime);
            
            $result = $attachment->update_request_attachment();
        }

        if ($result) {
            $_SESSION['success'] = 'File successfully updated.';
        } else {
            $_SESSION['error'] = 'Fail to udpate the attachment';
        }
    }

    /**
     * Re-submit request.
     */
    elseif (isset($_POST['resubmit'])) {
        //$activeuser = $user['user_id'];
        $id = $_POST['rqid'];
        $request_id = $_POST['rqid'];

        $request  = new request($request_id);
        $result = $request->resubmitRequest();

        $_SESSION['success'] = 'Your request has been re-submitted';

        //$_SESSION['error'] = "Error re-submitting request.";

        $paction = 'UPDATE';
  
    }
    
    //execute CANCEL item ====================================
    elseif (isset($_POST['cancel'])) {
        $id = $_POST['id'];
        $request_id = $_POST['rqid'];

        $active_user = new User($user['user_id']);
        $request = new request($request_id);
        $request->cancelRequest($active_user);
       
        $_SESSION['success'] .= 'Status: Cancelled.';
        // $_SESSION['error'] .= 'Error inserting cancelled request';
        
        $paction = 'UPDATE';
    }

    //execute DELETE item ====================================
    elseif (isset($_POST['delete'])) {
        $id = $_POST['id'];

        $request = new Request($id);
        $result = $request->deletRequest();

        if ($result) {
            $_SESSION['success'] = 'Request successfully deleted';
        } else {
            $_SESSION['error'] = "Error deleting request";
        }

        $paction = 'DELETE';
    }

    //execute get row item====================================
    elseif (isset($_GET['attmtbl']) and isset($_POST['id'])) {
        $id = $_POST['id'];
       
        // $sql = "SELECT * FROM fs_request_attachment  WHERE file_id = '$id'";
        // $query = $conn->query($sql);
        // $row = $query->fetch_assoc();

        $attachment = new RequestAttachement($id);
        echo json_encode($attachment->getRow());
        exit();
    }

    //execute get row item====================================
    elseif (isset($_GET['maintbl']) and isset($_POST['id'])) {
        $id = $_POST['id'];
        // $sql = "SELECT * FROM fs_request_main WHERE rq_id = '$id'";
        // $query = $conn->query($sql);
        // $row = $query->fetch_assoc();

        $request = new Request($id);
       echo json_encode($request->getRow());
        exit();
    }

    //execute get row item==================================== taks and approver group
    elseif (isset($_GET['task_usergroup']) and isset($_POST['id'])) {
        $id = $_POST['id'];
     
        $sql = "SELECT wl.form_steps_id, wst.work_name, wst.approver,  group_concat(ug.ug_name) AS ugname 
			FROM  fs_workflow wl
			Left Join fs_workstpes wst ON wst.work_id = wl.form_steps_id
			left Join fs_user_group ug ON find_in_set(ug.ug_id,wst.approver)
			WHERE wl.form_id='$id' and wst.select_group ='Yes'
			ORDER BY wl.id DESC LIMIT 1";

            try {
                $query = $conn->query($sql);

                if ($query->num_rows == 0) {
                    throw new Exception("Select group not found.");
                }
                $row = $query->fetch_assoc();
        
                echo json_encode($row);
                exit();
            }
            
            catch (Exception $e) {
                error_log( 'Message: ' .$e->getMessage());
            }

    } else {
        $_SESSION['error'] = 'Fill up add form first';
    }


    if (isset($POST_['task_id'])) {
        $task_id = $_POST['task_id'];
        $app_group_sel = $_POST['app_group'];
        $sqlxc = "UPDATE fs_request_task_status SET user_approvers = '$app_group_sel' WHERE rq_step_id = '$task_id' and rq_no='$genControlNo'";
        $conn->query($sqlxc);
    }

    $pname = 'fs_request_main';
    $puser = $user['user_id'];
    $pattrib = json_encode($_POST);
    attrib_logger($pname, $paction, $puser, $pattrib);
    
    if ($send_mail == "YES") {
        $_SESSION['request_no'] = $genControlNo;
        $_SESSION['next_page'] = './?pid=request';
        header('location: ./loading_send_mail.php');
    } else {
        header('location: ./?pid=request');
    }
