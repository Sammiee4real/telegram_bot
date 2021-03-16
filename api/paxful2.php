<?php

// Payload which is sent to server
$payload = [
    'merchant'  => 'gKmQAAKzQVA',
    'apikey'  => 'ADIQCHHP2xAtMqyXYDHyWTNrXtXoWn7G',
    'nonce' => time(),
    'to'  => '19XWT79o12PxZkN499om4czzwhiT4tRu2j',
    'track_id'  =>784736345789345,
    'amount'  =>0.0004,
    'email'  => 'adebsholey4real@gmail.com'
  
];



// Generation of apiseal
// Please note the PHP_QUERY_RFC3986 enc_type
$apiseal = hash_hmac('sha256', http_build_query($payload, null, '&', PHP_QUERY_RFC3986), 'O8VBYIypDFB9d5vy7GqEsorQUmRXuRTO');

// Append the generated apiseal to payload
$payload['apiseal'] = $apiseal;

// Set request URL (in this case we check your balance)
//$ch = curl_init('https://paxful.com/api/currency/btc trade/get  wallet/new-address  wallet/list-addresses  transactions/all trade/list currency/btc?response=text  currency/rates  payment-method/list  user/info wallet/list-addresses affiliate/transactions');

$ch = curl_init('https://paxful.com/api/trade/list');
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


curl_close($ch);




?>