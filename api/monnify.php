<?php
$token = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsibW9ubmlmeS1wYXltZW50LWVuZ2luZSJdLCJzY29wZSI6WyJwcm9maWxlIl0sImV4cCI6MTU5Nzc1MzI2MiwiYXV0aG9yaXRpZXMiOlsiTVBFX01BTkFHRV9MSU1JVF9QUk9GSUxFIiwiTVBFX1VQREFURV9SRVNFUlZFRF9BQ0NPVU5UIiwiTVBFX0lOSVRJQUxJWkVfUEFZTUVOVCIsIk1QRV9SRVNFUlZFX0FDQ09VTlQiLCJNUEVfQ0FOX1JFVFJJRVZFX1RSQU5TQUNUSU9OIiwiTVBFX1JFVFJJRVZFX1JFU0VSVkVEX0FDQ09VTlQiLCJNUEVfREVMRVRFX1JFU0VSVkVEX0FDQ09VTlQiLCJNUEVfUkVUUklFVkVfUkVTRVJWRURfQUNDT1VOVF9UUkFOU0FDVElPTlMiXSwianRpIjoiOGZiN2RlNWYtOTdkYS00ZmFkLWE5NDMtMjc2YTc3YzI1MmIzIiwiY2xpZW50X2lkIjoiTUtfVEVTVF9QQlFQWUw0VFNDIn0.UJ_rSbbYIY0biytZwTW6zqrmpfCA5alU5yZv1EXao_BTAahpyrnlKqAXH-aCVMAlZL0Br-3L0cP2ZBYLNTn_WfQ91VHGhq88FwStgd0THt632cdQB3PJ5Rmm9nM9E5uVf2RrVKcp3vr13Ikcdgj5w6vktBj0WomAjbTBcPOm_FhCyvJ6hm_XOu9fRcasaWiKgg67VgHkp5XF5G6qClBU5A7wTyWKyuORmrTYn815of58FpunuoEeaVApg0wRJvIBGCJrTy7gJ9YG-Xn6qJ8OMfa0fAXPL8k2d1Dz7i_QT4eVU4XG4uDAV5cPjZQEJQy9CV27IDNbBjd5LXwDpJV8gg';
$base64endcoded = base64_encode("MK_TEST_PBQPYL4TSC:ZH8QKFJXLJ7XYZT3E93FT67BM8QERGZB");


//$base64endcoded = base64_encode("MK_TEST_SAF7HR5F3F:4SY6TNL8CK3VPRSBTHTRG2N8XXEGC6NL");
//echo $base64endcoded;

// $curl = curl_init();

//   curl_setopt_array($curl, array(
//                 CURLOPT_URL => "https://sandbox.monnify.com/api/v1/auth/login",
//                 CURLOPT_RETURNTRANSFER => true,
//                 CURLOPT_ENCODING => "",
//                 CURLOPT_MAXREDIRS => 10,
//                 CURLOPT_TIMEOUT => 0,
//                 CURLOPT_FOLLOWLOCATION => true,
//                 CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//                 CURLOPT_CUSTOMREQUEST => "POST",
//                 CURLOPT_HTTPHEADER => array(
//                 "Authorization: Basic ".$base64endcoded
//                 ),
//                 ));

// $response = curl_exec($curl);
// curl_close($curl);

// echo $response;

$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://sandbox.monnify.com/api/v1/bank-transfer/reserved-accounts",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => array("accountReference" => "abc1238498347834","accountName" => "Tolu Test Reserved Account","currencyCode"=>"NGN","contractCode"=>"8553974224","customerEmail"=>"tolu@tester.com","customerName"=>"Tolu Bobs"),
  CURLOPT_HTTPHEADER => array(
    "Authorization: Bearer $token"
  ),
));

$response = curl_exec($curl);

curl_close($curl);

echo $response;

?>