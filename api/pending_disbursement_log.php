<?php require_once('config/database_functions.php');


if(isset($_GET['admin_id'])  ){
	     $admin_id = $_GET['admin_id'];
   		 $insert = view_pend_disb_log($admin_id);
   		 echo $insert;
}else{
   		  $variables_not_set = variables_not_set();
         echo $variables_not_set;
}


?>