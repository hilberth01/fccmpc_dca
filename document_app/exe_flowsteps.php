<?php
    include 'includes/session.php';
    include 'includes/functions.php';
    include 'includes/logger.php';
    include 'classes/task.php';
    
    $paction = '';
    //execute add item=======================================
    if (isset($_POST['add'])) {
        $description = $_POST['description'];
        $approvaltype = $_POST['approvaltype'];
        $confirmtype = $_POST['confirmtype'];
        $timewindow = $_POST['timewindow'];
        $rejectfirst = $_POST['rejectfirst'];
        $rejectchange = $_POST['rejectchange'];
        $rejectanchor = $_POST['rejectanchor'];
        $selectgroup = $_POST['selectgroup'];
        $needed_apprvl = $_POST['needed_approval'];
        $steps_id = gererate_id(15);

        if ($selectgroup == "Yes") {
            $usergroup = implode(',', $_POST['usergroup']);  //insert multi approver group
        } else {
            $usergroup = $_POST['usergroup'][0];  //insert single approver group
        }
        
        $result = task::insert_task($steps_id, $description, $usergroup,
        $approvaltype, $confirmtype, $timewindow, $needed_apprvl,
        $rejectfirst, $rejectchange, $rejectanchor, $selectgroup);

        if ($result) {
            $_SESSION['success'] = 'Work step successfully added';
        } else {
            $_SESSION['error'] = $task->getConn->error;
        }
        $paction = 'INSERT';
    }
    
    //execute edit item=======================================
    elseif (isset($_POST['edit'])) {
        $id = $_POST['id'];
        $description = $_POST['edit_description'];
        //$usergroup = implode(',', $_POST['edit_usergroup']); //$_POST['edit_usergroup'];
        $approvaltype = $_POST['edit_approvaltype'];
        $confirmtype = $_POST['edit_confirmtype'];
        $timewindow = $_POST['edit_timewindow'];
        $rejectfirst = $_POST['edit_rejectfirst'];
        $rejectchange = $_POST['edit_rejectchange'];
        $rejectanchor = $_POST['edit_rejectanchor'];
        $selectgroup = $_POST['edit_selectgroup'];
        $needed_apprvl = $_POST['edit_needed_approval'];
        if ($selectgroup == "Yes") {
            $usergroup = implode(',', $_POST['edit_usergroup']);  //insert multi approver group
        } else {
            $usergroup = $_POST['edit_usergroup'][0];  //insert single approver group
        }
        
        $sql = "UPDATE fs_workstpes SET work_name = '$description', approver='$usergroup', 
		approval_type='$approvaltype', confirm_type='$confirmtype', time_window='$timewindow', reject_first = '$rejectfirst',reject_change='$rejectchange', reject_anchor = '$rejectanchor', select_group='$selectgroup',needed_approval='$needed_apprvl' WHERE id = '$id'";
        if ($conn->query($sql)) {
            $_SESSION['success'] = 'Work Step was successfully updated'.$usergroup;
        } else {
            $_SESSION['error'] = $conn->error;
        }
        $paction = 'UPDATE';
    }
        
    //execute DELETE item ====================================
    elseif (isset($_POST['delete'])) {
        $id = $_POST['id'];
        $task = new task($id);
        $result = $task->delete_task();

        if ($result) {
            $_SESSION['success'] = 'Work Step successfully deleted';
        } else {
            $_SESSION['error'] = $task->getConn()->error;
        }
        $paction = 'DELETE';
    }
    //execute get row item====================================
    elseif (isset($_GET['view']) and isset($_POST['id'])) {
        $id = $_POST['id'];
        $task = new task($id);
        echo json_encode($task->getTask_row());
        exit();
    } else {
        $_SESSION['error'] = 'Fill up add form first';
    }

    $pname = 'fs_workstpes';
    $puser = $user['user_id'];
    $pattrib = json_encode($_POST);
    attrib_logger($pname, $paction, $puser, $pattrib);

    header('location: ./?pid=flowsteps');
