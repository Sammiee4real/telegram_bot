<?php require_once('config/database_functions.php');


if(isset($_GET['phone'])  && isset($_GET['lamount']) && isset($_GET['interest']) && isset($_GET['tenure'])   ){
	
	     $phone = $_GET['phone'];
	     $lamount = $_GET['lamount'];
	     $interest = $_GET['interest'];
	     $tenure = $_GET['tenure'];
	  
   		  $insert = apply_for_loan($phone,$lamount,$interest,$tenure);
      	  $insert_decode = json_decode($insert,true);
          echo $insert;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>