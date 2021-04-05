<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo (!empty($user['photo'])) ? '../images/'.$user['photo'] : '../images/profile.jpg'; ?>"
                    class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><?php echo $user['firstname'].' '.$user['lastname']; ?></p>
                <a><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">REPORTS</li>

            <li class="<?php ($pgAccess == "dashboard") ? "active" : ""; ?>">
                <a href="./?pid=dashboard">
                    <i class="fa fa-dashboard">
                    </i> <span>Dashboard</span></a>
            </li>

            <li class="<?php ($pgAccess == "complited_list") ? "active" : ""; ?>">
                <a href="./?pid=complited_list"><span class="glyphicon glyphicon-lock">
                </span> <span>Completed Docs</span></a>
            </li>

            <li class="header">TRANSACTIONS</li>

            <!-- <a href="./?pid=request&requser=<?php echo $user['user_id']; ?>" -->
            <li class="<?php ($pgAccess == "request") ? "active" : ""; ?>">
              <a href="./?pid=request&requser=<?php echo $user['user_id']; ?>">
              <span class="fa fa-folder"></span> 
              <span>My Request</span></a>
            </li>
            
            <li class="<?php ($pgAccess == "approval") ? "active" : ""; ?>">
              <!-- <a href="./?pid=approval"> -->
              <a href="./?pid=approval&approver=<?php echo $user['user_id']; ?>">
                <span class="fa fa-hourglass "></span> 
                <span>My Approval</span>
              </a>
            </li>
            
            <?php if((strpos($user['access_level'], 'Administrator') !== false)){?>
            
            <li class="header">MANAGE</li>
            <li class="<?php ($pgAccess == "users") ? "active" : ""; ?>"><a href="./?pid=users"><i
                        class="fa fa-user"></i> <span>Users</span></a></li>
            <li class="<?php ($pgAccess == "user_g") ? "active" : ""; ?>"><a href="./?pid=user_g"><i
                        class="fa fa-group"></i> <span>Approvers & <br>Implementers Group</span></a></li>
            <li class="<?php ($pgAccess == "department") ? "active" : ""; ?>"><a href="./?pid=department"><i
                        class="fa fa-university"></i> <span>Department</span></a></li>
            
            <li class="header">SETTINGS</li>
            <li class="<?php ($pgAccess == "flowsteps") ? "active" : ""; ?>"><a href="./?pid=flowsteps"><i
                        class="fa fa-tasks"></i> <span>Task</span></a></li>
            <li class="<?php ($pgAccess == "workflow") ? "active" : ""; ?>"><a href="./?pid=workflow"><i
                        class="fa fa-arrow-down"></i> <span>Workflow</span></a></li>
            <li class="<?php ($pgAccess == "config") ? "active" : ""; ?>"><a href="#config" data-toggle="modal"><i
                        class="fa fa-cog"></i> <span>System Title</span></a></li>
            <?php } ?>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<?php include 'config_modal.php'; ?>