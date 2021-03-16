<?php include('config/database_functions.php');


if(isset($_GET['phone']) ){
	      $phone = $_GET['phone'];
   		  $get_loan_condition = get_loan_condition($phone);
   	      echo $get_loan_condition;
      	 
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>