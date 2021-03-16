<?php require_once('config/database_functions.php');


if(isset($_GET['phone'])){
	
	     $phone = $_GET['phone'];
	     $insert = view_running_loan($phone);
      	 $insert_decode = json_decode($insert,true);
         echo $insert;

}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>