<?php require_once('config/validations.php');
header('Content-Type: application/json');

if(  isset($_GET['email']) && isset($_GET['amount'])  && isset($_GET['phone'])     ){
			$email = $_GET['email'];
			$amount = $_GET['amount'];
			$phone = $_GET['phone'];
            $result = card_validation($email,$amount,$phone);
            echo $result;

}else{
   		    // $variables_not_set = variables_not_set();
            //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>