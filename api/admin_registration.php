<?php require_once('config/database_functions.php');


if(isset($_GET['first_name'])   && isset($_GET['last_name']) && isset($_GET['other_name']) && isset($_GET['mobile_phone_number']) && isset($_GET['email_address']) && isset($_GET['permissions_details']) && isset($_GET['added_by']) && isset($_GET['status'])  && isset($_GET['password'])  && isset($_GET['cpassword']) && isset($_GET['ip_address']) && isset($_GET['url_accessed']) && isset($_GET['system_name']) && isset($_GET['before_details']) && isset($_GET['after_details'])  ){
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
	     
	     $ip_address = $_GET['ip_address'];
	     $url_accessed = $_GET['url_accessed'];
	     $system_name = $_GET['system_name'];
	     $before_details = $_GET['before_details'];
	     $after_details = $_GET['after_details'];
         $activity_performed = "admin creation";


	 
   		  $insert = admin_registration($first_name,$last_name,$other_name,$password,$cpassword,$mobile_phone_number,$email_address,$permissions_details,$added_by,$status);
      	  $insert_decode = json_decode($insert,true);

         

          if( $insert_decode['status'] == 111  ){
          
          	$insert_log = insert_audit_log($activity_performed,$added_by,$ip_address,$url_accessed,$system_name,$before_details,$after_details);
         
          }	
          echo  $insert;
          

}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>