<?php require_once('config/validations.php');


if(  isset($_GET['phone']) &&  isset($_GET['email']) ){
	      $phone = $_GET['phone'];
	      $email = $_GET['email'];
   		  $user_reg = user_registration_version2($phone,$email);
   	      echo $user_reg;
           
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>