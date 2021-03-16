<?php

// Payload which is sent to server
$payload = [
    'apikey' => '708msRVY1iEmFnR3QsdvsJcKo3HYDXZK',
    'nonce' => time(),
];

// Generation of apiseal
// Please note the PHP_QUERY_RFC3986 enc_type
$apiseal = hash_hmac('sha256', http_build_query($payload, null, '&', PHP_QUERY_RFC3986), 'VCLl1RzNnWVOY2S8WrPSZOkQnOmRRMid');

// Append the generated apiseal to payload
$payload['apiseal'] = $apiseal;

// Set request URL (in this case we check your balance)
//$ch = curl_init('https://paxful.com/api/currency/btc  currency/rates  payment-method/list  user/info wallet/list-addresses affiliate/transactions');

$ch = curl_init('https://paxful.com/api/currency/btc?response=text');
// NOTICE that we send the payload as a string instead of POST parameters
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload, null, '&', PHP_QUERY_RFC3986));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Accept: application/json; version=1',
    'Content-Type: text/plain',
]);

// fetch response
$response = curl_exec($ch);


echo $response;
echo "<br>";
// convert json response into array
$data = json_decode($response,true);
//echo $data['price'];



//var_dump($data);
// $run = $data['data'];
// echo "<br>";
// foreach($run as $d){
//     $ngn_only =  $d['code'];
//     if($ngn_only == 'NGN'){
//             $price = $d['rate_BTC'];
//             echo number_format($price);
//     }
// }


curl_close($ch);




?>