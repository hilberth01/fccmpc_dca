<?php

$pgAccess = (isset($_GET['pid'])) ? $_GET['pid'] : "error";

switch ($pgAccess) {
  case "dashboard":
    include 'content_dashboard.php';
    break;
  case "complited_list":
    include 'content_completed_request.php';
    break;
    case "approved_documents":
      include 'content_approved_documents.php';
      break;
  case "votes":
     include 'content_votes.php';
    break;
  case "request":
     include 'content_request.php';
    break;
  case "approval":
     include 'content_approval.php';
    break;
  case "approval_rev":
     include 'content_approval_review.php';
    break;
  case "users":
     include 'content_users.php';
    break;
  case "user_g":
     include 'content_usergroup.php';
    break;
  case "positions":
     include 'content_positions.php';
    break;
  case "department":
     include 'content_department.php';
    break;
  case "candidates":
     include 'content_candidates.php';
    break;
  case "flowsteps":
     include 'content_flowsteps.php';
    break;
  case "workflow":
     include 'content_workflow_group.php';
    break;
  case "workflow_sequence":
     include 'content_workflow_sequence.php';
    break;
  case "ballot":
     include 'content_ballot.php';
    break;
  case "config":
     include 'content_config.php';
    break;
  default:
     include 'content_error.php';
}
?>