<?php require_once('config/database_functions.php');


if( isset($_GET['who_added']) && isset($_GET['message_image']) && isset($_GET['message_url'])  && isset($_GET['message'])  && isset($_GET['message_type']) && isset($_GET['ip_address']) && isset($_GET['url_accessed']) && isset($_GET['system_name'])  ){
	     $message_type = $_GET['message_type'];
	     $message = $_GET['message'];
	     $message_url = $_GET['message_url'];
	     $message_image = $_GET['message_image'];
	     $who_added = $_GET['who_added'];
	  
	     $ip_address = $_GET['ip_address'];
	     $url_accessed = $_GET['url_accessed'];
	     $system_name = $_GET['system_name'];
	     $before_details = "chat template before creation";
	     $after_details = "chat template after creation";
         $activity_performed = "chat return template creation";

   		 $insert = insert_chat_return_template($message_type,$message,$message_url,$message_image,$who_added);
      	 $insert_decode = json_decode($insert,true);

        if( $insert_decode['status'] == 111  ){
          
          	$insert_log = insert_audit_log($activity_performed,$who_added,$ip_address,$url_accessed,$system_name,$before_details,$after_details);
         
          }	
          echo  $insert;
          

}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>