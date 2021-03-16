<?php require_once('config/database_functions.php');


if(isset($_GET['activity_performed'])   && isset($_GET['who_performed']) && isset($_GET['ip_address']) && isset($_GET['url_accessed']) && isset($_GET['system_name'])
     && isset($_GET['before_details']) && isset($_GET['after_details'])  ){
	      //&& isset($_GET['pinpass'])
	     $activity_performed = $_GET['activity_performed'];
	     $who_performed = $_GET['who_performed'];
	     $ip_address = $_GET['ip_address'];
	     $url_accessed = $_GET['url_accessed'];
	     $system_name = $_GET['system_name'];
	     $before_details = $_GET['before_details'];
	     $after_details = $_GET['after_details'];
 
   		  echo insert_audit_log($activity_performed,$who_performed,$ip_address,$url_accessed,$system_name,$before_details,$after_details);
      	 
}else{
   		  echo  variables_not_set();
}


?>