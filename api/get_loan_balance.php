<?php require_once('config/database_functions.php');


if(isset($_GET['phone']) ){
	      $phone = $_GET['phone'];
   		  $get_current_loan_balance = get_current_loan_balance($phone);
      	  //$val_decode = json_decode($validate_email,true);
          echo $get_current_loan_balance;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>