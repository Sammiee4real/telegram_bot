<?php require_once('config/validations.php');


if(isset($_GET['phone']) && isset($_GET['otp']) ){
	      $phone = $_GET['phone'];
	      $otp = $_GET['otp'];
   		  $validate_otp = verify_otp($otp,$phone);
   		  //echo $validate_phone;
      	  //$val_decode = json_decode($validate_phone,true);
       
           	echo $validate_otp;
           
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>