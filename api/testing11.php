<?php 
        
function coinbase_api_test(){
    $apikey = 'O0e5ggNgVcpujIzv';
  $secret_key = 'bmdEr3XPlWM0q2y6FpdeemEq5Tb00yt2';
  $timestampp = time();
  $pathh = '/v2/accounts/59fa5031f86559bf9a4b382385ed1da15d25b9f85c87c92497704098e6ad9a14/addresses';
  $url = 'https://api.flutterwave.com/v3/transfers';
            // Collection object
            // $data = [
            // 'name' => 'New Address22'
            // ];
            $data = "";
    
            $siggnn1 =  $timestampp."POST".$pathh.$data;  
            
            //$siggnn = hash("sha256", $secret_key,);
            $key_decode = base64_decode($secret_key);
            $siggnn = hash_hmac('sha256',$siggnn1,$key_decode);
            
            // Initializes a new cURL session 'https://api.coinbase.com/'.
            $curl = curl_init('https://api.coinbase.com'.$pathh);
            
            // Set the CURLOPT_RETURNTRANSFER option to true
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            
            // Set the CURLOPT_POST option to true for POST request
            curl_setopt($curl, CURLOPT_POST, true);
            
            // Set the request data as JSON using json_encode function
            curl_setopt($curl, CURLOPT_POSTFIELDS,  json_encode($data));
            //  'CB-ACCESS-KEY:'.$secret_key,
            // 'CB-ACCESS-SIGN:'.$siggnn,
            // 'CB-ACCESS-TIMESTAMP: '.$timestampp,
            // 'Authorization: Bearer '.$secret_key,
            // Set custom headers for RapidAPI Auth and Content-Type header
            curl_setopt($curl, CURLOPT_HTTPHEADER, [
                'CB-ACCESS-KEY:'.$apikey,
                'CB-ACCESS-SIGN:'.$siggnn,
                'CB-ACCESS-TIMESTAMP: '.$timestampp,
                'Content-Type: application/json'
            ]);
            
            // Execute cURL request with all previous settings
            $response = curl_exec($curl);
            
            // Close cURL session
            curl_close($curl);

            return $response;
}

var_dump(coinbase_api_test());

?>