<?php require_once('config/validations.php');


if( isset($_GET['phone'])  ){
	      $phone = $_GET['phone'];
	      
  		  $validate_phone = validate_phone($phone);
  		  //echo $validate_phone;
      	  $val_decode = json_decode($validate_phone,true);
          if($val_decode['status'] == 111){
          		$otp = send_otpv2($phone);
          		echo $otp;
          }else{
          	echo $validate_phone;
          }
}else{
  		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>