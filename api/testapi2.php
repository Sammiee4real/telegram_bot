<?php 

if(  isset($_GET['bvn']) && isset($_GET['acctno']) && isset($_GET['bankcode']) ){

       $bvn = $_GET['bvn'];
       $acctno = $_GET['acctno'];
       $bankcode = $_GET['bankcode'];

         $curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.paystack.co/bvn/match",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => array('bvn' => $bvn,'account_number' => $acctno,'bank_code' => $bankcode),
  CURLOPT_HTTPHEADER => array(
    "Authorization: Bearer sk_test_0191801029d7355fd0ccd53bc7c16c9dbdd325f2"
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


}
  
 


?>