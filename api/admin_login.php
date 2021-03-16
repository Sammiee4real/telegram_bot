<?php require_once('config/database_functions.php');


if(isset($_GET['email_address'])   && isset($_GET['password']) && isset($_GET['ip_address']) && isset($_GET['system_name']) ){
	     $email_address = $_GET['email_address'];
	     $password = $_GET['password'];
	     $ip_address = $_GET['ip_address'];
	     $system_name = $_GET['system_name'];
		 
   		  $authenticate = admin_login($email_address,$password,$ip_address,$system_name);
     	  echo $authenticate;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>