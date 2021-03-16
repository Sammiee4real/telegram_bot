<?php require_once('config/validations.php');

if(isset($_GET['accountno']) && isset($_GET['phone']) && isset($_GET['bvn']) ){
	      $accountno = $_GET['accountno'];
	      $phone = $_GET['phone'];
	      $bvn = $_GET['bvn'];
  		  $new_accountno_validate = new_accountno_validate($accountno,$phone,$bvn);
      	  //$val_decode = json_decode($new_accountno_validate,true);
          echo $new_accountno_validate;
}

// else{
//   		  $variables_not_set = variables_not_set();
//           echo $variables_not_set;
// }

?>