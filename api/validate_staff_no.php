<?php require_once('config/validations.php');


if(isset($_GET['staff']) && isset($_GET['phone']) ){
	      $phone = $_GET['phone'];
	      $staff = $_GET['staff'];
   		  $validate_sno = validate_staff_no($staff,$phone);
   	     echo $validate_sno;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>