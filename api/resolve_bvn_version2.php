<?php require_once('config/validations.php');
if(  isset($_GET['bvn'])  && isset($_GET['phone'])     ){
			$bvn = $_GET['bvn'];
			$phone = $_GET['phone'];
            
            $result = new_bvn_validate($bvn,$phone);
            
            echo $result;

}else{
   		    // $variables_not_set = variables_not_set();
            //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>