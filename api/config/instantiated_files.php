<?php session_start();
     include('database_functions.php');
     if(!isset($_SESSION['uid'])){
        header('location: index.php');
      }
     $uid = $_SESSION['uid'];
     $admin_details = logged_in_admin_details($uid);
     $first_name = $admin_details['first_name'];
     $last_name = $admin_details['last_name'];
     $fullname = $first_name.' '.$last_name;
?>