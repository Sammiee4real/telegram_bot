<?php 
    ////////////////////sell btc3E18zUD3z1iXG87TpBnM9o97MSBMBSD94f    19XWT79o12PxZkN499om4czzwhiT4tRu2j
    // Payload which is sent to server
    $merc = 'gKmQAAKzQVA';
    $apikey = 'ADIQCHHP2xAtMqyXYDHyWTNrXtXoWn7G';
    $nonce = time();
    $to = '3E18zUD3z1iXG87TpBnM9o97MSBMBSD94f';
    $track_id = '6775893455dd54559';
    $amount = 0.0005;
    $email = 'adebsholey4real@gmail.com';
    $email2 = 'samuel.adebunmi%40cloudware.ng';
    
     $payload = [
        'merchant'  => $merc,
        'nonce' => $nonce,
         'amount'  => $amount,
         'to'  => $to,
         'user_email'=>$email,
         'track_id'  => $track_id,
        'apikey'  => $apikey,
      
     ];
    
    // Generation of apiseal
    // Please note the PHP_QUERY_RFC3986 enc_type
    $apiseal = hash_hmac('sha256', http_build_query($payload, null, '&', PHP_QUERY_RFC3986), 'O8VBYIypDFB9d5vy7GqEsorQUmRXuRTO');
    //echo $apiseal;
    
    
    
    
    
    
    //////////////buy btc
    
     ////////////////////sell btc
    // Payload which is sent to server
    $aff = 'gKmdAGKMWkV';
    $kiosk = 'wKakENqVQpB';
    $crypto_amount_btc = '0.03';
    $online_transfers = 'online-transfers';
    $track_idb = '6778997';
    $fiat_amount = "5000";
    $fiat_currency = "NGN";
    $ext_crypto_address = '';
   
   
    
     $payloadb = [
         'kiosk' => $kiosk,
         'crypto_amount_btc'  => $crypto_amount_btc,
         'fiat_amount' => $fiat_amount,
         'is_exact_amount' => 'yes',
         'track_id'  => $track_idb,
         'email'  => $email,
         'r'  => $aff,
         'payment_method_group'=>$online_transfers,
         'ext_crypto_address'=>'3E18zUD3z1iXG87TpBnM9o97MSBMBSD94f',
     ];
    // https://paxful.com/roots/buy-bitcoin/index?kiosk=&r=
    // Generation of apiseal
    // Please note the PHP_QUERY_RFC3986 enc_type
    $apisealb = hash_hmac('sha256', http_build_query($payloadb, null, '&', PHP_QUERY_RFC3986), 'O8VBYIypDFB9d5vy7GqEsorQUmRXuRTO');
    echo $apisealb;


?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
    <!--85067c6a2d4457eb2e3851aeb40a3fb4315ade2196efcfb10a21d80b1e5cabcf-->
  
 
    
   This will help users SELL their bitcoin to us: <a href="https://paxful.com/wallet/pay?merchant=<?php echo $merc; ?>&nonce=<?php echo $nonce; ?>&amount=<?php echo $amount; ?>&to=<?php echo $to; ?>&user_email=<?php echo $email; ?>&track_id=<?php echo $track_id; ?>&apikey=<?php echo $apikey; ?>&apiseal=<?php echo $apiseal;?>">Pay with Paxful 2</a>
    <br>
   This will help users BUY bitcoin from us: <a href='https://paxful.com/roots/buy-bitcoin?fiat_amount=<?php echo $fiat_amount; ?>&fiat_currency<?php echo $fiat_currency; ?>&is_exact_amount=yes&affiliate=<?php echo $aff; ?>&crypto_amount_btc=<?php echo $crypto_amount_btc; ?>&payment_method_group=<?php echo $online_transfers; ?>&apikey=<?php echo $apikey; ?>&track_id=<?php echo $track_idb; ?>apiseal=<?php echo $apisealb; ?>'>Buy Now</a>
   <br>
   
   <a href='https://paxful.com/roots/buy-bitcoin/index?kiosk=wKakENqVQpB'>Buy Bitcoins 2</a>
   
   <br>
   
   <a href='https://paxful.com/roots/buy-bitcoin/index?kiosk=wKakENqVQpB&crypto_amount_btc=0.03&fiat_amount=5000&is_exact_amount=yes&track_id=6778997&email=adebsholey4real%40gmail.com&r=gKmdAGKMWkV&payment_method_group=online-transfers&ext_crypto_address=3E18zUD3z1iXG87TpBnM9o97MSBMBSD94f&apiseal=<?php echo $apisealb; ?>'>Buy bitcoin 4</a>
    <!--<a href="https://paxful.com/?r=gKmdAGKMWkV">Buy Bitcoin</a>-->
    <!--<iframe style='margin-left: 40%;' src="https://paxful.com/roots/buy-bitcoin/index?kiosk=wKakENqVQpB" frameborder="0" style="overflow:hidden; height:500; width:450" width="450" height="500" rel="nofollow"></iframe>-->

</body>
</html>