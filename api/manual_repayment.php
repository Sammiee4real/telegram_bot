<?php require_once('config/database_functions.php');


if(isset($_GET['client_phone'])   && isset($_GET['repayment_amount']) && isset($_GET['date_of_repayment']) ){
	     $client_phone = $_GET['client_phone'];
	     $repayment_amount = $_GET['repayment_amount'];
	     $date_of_repayment = $_GET['date_of_repayment'];
    	  $rep = enter_manual_repayment($client_phone,$repayment_amount,$date_of_repayment);
     	  echo $rep;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>