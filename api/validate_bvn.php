<?php require_once('config/database_functions.php');


if(isset($_GET['bvn']) ){
	      $bvn = $_GET['bvn'];
   		  $validate_bvn = validate_bvn($bvn);
      	  //$val_decode = json_decode($validate_email,true);
          echo $validate_bvn;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>