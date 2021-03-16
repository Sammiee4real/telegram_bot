<?php require_once('config/validations.php');
if(  isset($_GET['bvn']) && isset($_GET['acctno']) && isset($_GET['bankcode'])     ){
			$bvn = $_GET['bvn'];
			$acctno = $_GET['acctno'];
			$bankcode = $_GET['bankcode'];
            
            $result = validate_other_info_with_bvn($bvn,$acctno,$bankcode);
            echo $result;

}else{
   		    // $variables_not_set = variables_not_set();
            //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>