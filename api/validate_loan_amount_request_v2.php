<?php require_once('config/database_functions.php');


if(isset($_GET['phone']) && isset($_GET['loan_option']) ){
	      $phone = $_GET['phone'];
	      $loan_option = $_GET['loan_option'];
   		  $validate_loan_amount_request = validate_loan_amount_request_v2($phone,$loan_option);
   	      echo $validate_loan_amount_request;
      	 
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>