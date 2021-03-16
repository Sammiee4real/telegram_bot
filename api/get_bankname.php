<?php //require_once('config/database_functions.php');
require_once('config/validations.php');

if(isset($_GET['id']) ){
	      $id = $_GET['id'];
   		  $get_bank_name = get_bank_name($id);
      	  //$val_decode = json_decode($validate_email,true);
          echo $get_bank_name;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>