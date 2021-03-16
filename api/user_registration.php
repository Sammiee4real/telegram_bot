<?php require_once('config/database_functions.php');


if(isset($_GET['first_name'])   && isset($_GET['last_name']) && isset($_GET['acctno']) && isset($_GET['mobile_phone_number']) && isset($_GET['mobile_phone_number2']) && isset($_GET['email_address'])
     && isset($_GET['bankcode_option']) && isset($_GET['bvn']) && isset($_GET['employer_name'])  && isset($_GET['staff_no'])){
	      //&& isset($_GET['pinpass'])
	// $other_name = $_GET['other_name'];
	     // $password = $_GET['password'];
	     // $cpassword = $_GET['cpassword'];
	     $first_name = $_GET['first_name'];
	     $last_name = $_GET['last_name'];
	     $mobile_phone_number = $_GET['mobile_phone_number'];
	     $mobile_phone_number2 = $_GET['mobile_phone_number2'];
	     $email_address = $_GET['email_address'];
	     $acctno = $_GET['acctno'];
	     $bankcode_option = $_GET['bankcode_option'];
	     $bvn = $_GET['bvn'];
	     $employer_name = $_GET['employer_name'];
	     $staff_no = $_GET['staff_no'];
	 
	 
   		  $insert = user_registration($acctno,$bankcode_option,$bvn,$employer_name,$staff_no,$first_name,$last_name,$mobile_phone_number,$mobile_phone_number2,$email_address);
      	  $insert_decode = json_decode($insert,true);
          echo $insert;
}else{
   		  $variables_not_set = variables_not_set();
          echo $variables_not_set;
}


?>