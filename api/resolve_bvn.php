<?php require_once('config/validations.php');
if(  isset($_GET['bvn']) && isset($_GET['first_name'])  && isset($_GET['last_name'])  && isset($_GET['phone'])     ){
			$bvn = $_GET['bvn'];
			$acctno = $_GET['acctno'];
			$bankcode = $_GET['bankcode'];
			$first_name = $_GET['first_name'];
			$last_name = $_GET['last_name'];
			$phone = $_GET['phone'];
            
            $result = validate_other_info_with_bvn($bvn,$first_name,$last_name,$phone);
            echo $result;

}else{
   		    // $variables_not_set = variables_not_set();
            //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>