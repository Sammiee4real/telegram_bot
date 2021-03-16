<?php require_once('config/database_functions.php');


if(isset($_GET['first_name'])   && isset($_GET['last_name']) && isset($_GET['other_name']) && isset($_GET['mobile_phone_number']) && isset($_GET['email_address']) && isset($_GET['permissions_details']) && isset($_GET['added_by']) && isset($_GET['status'])  && isset($_GET['password'])  && isset($_GET['cpassword'])   ){
	     $first_name = $_GET['first_name'];
	     $last_name = $_GET['last_name'];
	     $other_name = $_GET['other_name'];
	     $password = $_GET['password'];
	     $cpassword = $_GET['cpassword'];
	     $mobile_phone_number = $_GET['mobile_phone_number'];
	     $email_address = $_GET['email_address'];
	     $permissions_details = $_GET['permissions_details'];
	     $added_by = $_GET['added_by'];
	     $status = $_GET['status'];

   		  $insert = admin_registration($first_name,$last_name,$other_name,$password,$cpassword,$mobile_phone_number,$email_address,$permissions_details,$added_by,$status);

   		  echo $insert;

   		}
 // $curdate = date('Y-m-d H:i:s');
 //  $plus_20days = date('Y-m-d H:i:s', strtotime('+20 days',strtotime($curdate)));
 //  echo $curdate.'-------'.$plus_20days;
      	
?>