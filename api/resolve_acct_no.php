<?php //require_once('config/database_functions.php');
if(  isset($_GET['acctno']) && isset($_GET['bankcode'])     ){
		
		$acctno = $_GET['acctno'];
		$bankcode = $_GET['bankcode'];
		$curl = curl_init();

		curl_setopt_array($curl, array(
		CURLOPT_URL => "https://api.paystack.co/bank/resolve?account_number=".$acctno."&bank_code=".$bankcode."",
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => array(
		"Authorization: Bearer sk_test_f435de0fa7b048e33f2ecf1d78cebbe984b4a042"
		),
		));

		$response = curl_exec($curl);

		curl_close($curl);
		echo $response;

}else{
   		 // $variables_not_set = variables_not_set();
          //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
}


?>