<?php require_once('config/database_functions.php');
//$otp,$loan_option,$phone,$interest,$tenure

if(isset($_GET['phone'])  && isset($_GET['loan_option'])  && isset($_GET['otp'])  && isset($_GET['interest']) && isset($_GET['tenure'])   ){
	
        $otp = $_GET['otp'];
        $loan_option = $_GET['loan_option'];
        $phone = $_GET['phone'];
        $interest = $_GET['interest'];
        $tenure = $_GET['tenure'];
	  
        $insert = apply_for_loanv2($otp,$loan_option,$phone,$interest,$tenure);
        //$insert_decode = json_decode($insert,true);
        echo $insert;
        
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>