<?php require_once('config/validations.php');

if(isset($_GET['email']) ){
	      $email = $_GET['email'];
  		  $validate_email = validate_email($email);
      	  //$val_decode = json_decode($validate_email,true);
          echo $validate_email;
}else{
  		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}

// if(isset($_GET['email']) ){
// 	      $email = $_GET['email'];
//   		  $validate_email = validate_email($email);
//       	  $val_decode = json_decode($validate_email,true);
//           if($val_decode['status'] == 111){
//           		$otp = send_email_otp($email);
//           		echo $otp;
//           }else{
//           	echo $validate_email;
//           }
// }else{
//   		  $variables_not_set = variables_not_set();
//           echo $variables_not_set;
// }

?>