<?php require_once('config/validations.php');
//$accountno,$phone,$bvn,$email
if(isset($_GET['accountno']) && isset($_GET['phone']) && isset($_GET['bvn'])  && isset($_GET['email'])  ){
	      $accountno = $_GET['accountno'];
	      $phone = $_GET['phone'];
	      $bvn = $_GET['bvn'];
	      $email = $_GET['email'];
  		  $user_reg_details = user_reg_details($accountno,$phone,$bvn,$email);
      	  //$val_decode = json_decode($user_reg_details,true);
          echo $user_reg_details;
}else{
  		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}

?>