<?php require_once('config/database_functions.php');


if(isset($_GET['phone']) && isset($_GET['loan_entered']) ){
	      $phone = $_GET['phone'];
	      $loan_entered = $_GET['loan_entered'];
   		  $validate_loan_amount_request = validate_loan_amount_request($phone,$loan_entered);
   	      echo $validate_loan_amount_request;
      	 
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>