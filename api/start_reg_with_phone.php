<?php require_once('config/validations.php');
header('Content-Type: application/json');

if(  isset($_GET['phone'])     ){
			$phone = $_GET['phone'];
            $result = start_reg_with_phone($phone);
            echo $result;

}else{
   		    // $variables_not_set = variables_not_set();
            //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>