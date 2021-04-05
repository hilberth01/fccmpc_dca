<?php
    include 'includes/session.php';
    include 'includes/functions.php';
    include 'includes/logger.php';
    include 'classes/user_group.php';

    $paction = '';
    //execute add item=======================================
    if (isset($_POST['add'])) {
        $gname = $_POST['gname'];
        $gdescription = $_POST['gdescription'];
        $gmembers =  implode(',', $_POST['gmembers']);
        $group_id = gererate_id(12);
        //generate voters id
        //$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        //$genCode = substr(str_shuffle($set), 0, 15); `id``ug_name``ug_description``ug_description``ug_members`SELECT * FROM `fs_user_group` WHERE 1

		$result = user_group::insert_user_group($group_id, $gname, $gdescription, $gmembers);

		if ($result) {
            $_SESSION['success'] = "User Group successfully added";
        } else {
            $_SESSION['error'] = $conn->error;
        }
        $paction = 'INSERT';
    }
    
    //execute edit item=======================================
    elseif (isset($_POST['edit'])) {
        $id = $_POST['id'];
        $gname = $_POST['edit_gname'];
        $gdescription = $_POST['edit_gdescription'];
        $gmembers =  implode(',', $_POST['edit_gmembers']);

        $user_group = new user_group($id);

        $user_group->setGroup_name($gname);
        $user_group->setGroup_description($gdescription);
        $user_group->setGroup_members($gmembers);

        if ($user_group->update_group()) 
            $_SESSION['success'] = 'User Group successfully updated';
         else 
            $_SESSION['error'] = $user_group->conn;
        

        $paction = 'UPDATE';
    }
    
    //execute DELETE item ====================================
    elseif (isset($_POST['delete'])) {
        $id = $_POST['id'];

        $user_group = new user_group($id);
        $result = $user_group->delete_group();

        if ($result) 
            $_SESSION['success'] = 'User Group successfully deleted';
         else 
            $_SESSION['error'] = $user_group->conn->error;

        $paction = 'DELETE';
    }
    
    //execute get row item====================================
    elseif (isset($_GET['view']) and isset($_POST['id'])) {
        $id = $_POST['id'];
        
		$user_group = new user_group($id);
		$row = $user_group->getGroup_row();

        echo json_encode($row);
        exit();
    } else {
        $_SESSION['error'] = 'Fill up add form first';
    }
    
    $pname = 'fs_user_group';
    $puser = $user['user_id'];
    $pattrib = json_encode($_POST);
    attrib_logger($pname, $paction, $puser, $pattrib);
    
    header('location: ./?pid=user_g');
