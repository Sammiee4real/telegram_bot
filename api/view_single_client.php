<?php require_once('config/database_functions.php');


if(isset($_GET['admin_id'])   && isset($_GET['uemail_address']) ){
	     $admin_id = $_GET['admin_id'];
	     $uemail_address = $_GET['uemail_address'];

		 
   		  $view_single_client = view_single_client($admin_id,$uemail_address);
     	  echo $view_single_client;
     
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>