<?php require_once('config/database_functions.php');


if(isset($_GET['email_address'])   && isset($_GET['oldpassword']) && isset($_GET['newpassword']) && isset($_GET['cnewpassword']) ){
	     $email_address = $_GET['email_address'];
	     $oldpassword = $_GET['oldpassword'];
	     $newpassword = $_GET['newpassword'];
	     $cnewpassword = $_GET['cnewpassword'];
		 
   		  $user_change_password = user_change_password($email_address,$oldpassword,$newpassword,$cnewpassword);
     	  echo $user_change_password;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>