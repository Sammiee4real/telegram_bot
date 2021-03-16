<?php //require_once('config/database_functions.php');
if(  isset($_GET['bvn'])     ){
		
		$bvn = $_GET['bvn'];
		$curl = curl_init();

		curl_setopt_array($curl, array(
		CURLOPT_URL => "https://api.paystack.co/bank/resolve_bvn/".$bvn."",
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => array(
		"Authorization: Bearer sk_live_b1d3e13e2b7f94b389b4875399f4598fe5440bc7"
		),
		));

		$response = curl_exec($curl);

		curl_close($curl);
         echo $response;

		//$decode = json_decode($response);
		//echo $decode['data']['first_name'];


}else{
   		 // $variables_not_set = variables_not_set();
          //echo $variables_not_set;
            echo json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));
          
}


?>