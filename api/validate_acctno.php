<?php require_once('config/validations.php');


if(  isset($_GET['acctno']) && isset($_GET['bankcode'])  ){
	      $acctno = $_GET['acctno'];
	      $bankcode = $_GET['bankcode'];
   		  $validate_acctno = validate_acctno($acctno,$bankcode);
      	  //$val_decode = json_decode($validate_email,true);
          echo $validate_acctno;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>