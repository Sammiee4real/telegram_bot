<?php require_once('config/validations.php');


if( isset($_GET['phone']) &&  isset($_GET['email']) ){
	      $phone = $_GET['phone'];
	      $email = $_GET['email'];
  		  $validate_phone = validate_phone($phone);
  		  //echo $validate_phone;
      	  $val_decode = json_decode($validate_phone,true);
          if($val_decode['status'] == 111){
          		$otp = send_otp($phone,$email);
          		echo $otp;
          }else{
          	echo $validate_phone;
          }
}else{
  		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>