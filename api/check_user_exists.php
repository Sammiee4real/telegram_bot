<?php require_once('config/database_functions.php');


if(isset($_GET['phone'])){
	     $phone = $_GET['phone'];
	     $check_user_exists = check_user_exists($phone);
     	  echo $check_user_exists;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>