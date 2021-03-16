<?php
$table = "";
$app_name = 'Whatsapp Lending Platform';
require_once("config.php");
require_once('database_functions.php');


function send_otpv2($phone){
       global $dbc;
       global $developerid;
       global $senderid;
       global $cloud_sms_password;
       $phone2 =  (string) $phone;
       $phone3 = preg_replace('/^./', '', $phone);
       $phone4 = '234'.$phone3;
       $pho = "2348168509044";
       
       $code = rand(11111,99999);
       $message = urlencode("Please enter this code: $code to proceed with your registration with 156 Credits. The code expires in 30 minutes");
       
       $get_email  = "SELECT `email_address`,`mobile_phone_number` FROM `user` WHERE `mobile_phone_number`='$phone'";
       $qry22 = mysqli_query($dbc,$get_email);
       $row22 = mysqli_fetch_array($qry22);
       $email = $row22['email_address'];

        
        $sms = "https://developers.cloudsms.com.ng/api.php?userid=".$developerid."&password=".$cloud_sms_password."&type=0&destination=".$phone4."&sender=".$senderid."&message=".$message."";
        $response = file_get_contents($sms);
        
        ////send to email too
        $subject = "156 Credit OTP Confirmation";
        $content = 'Hello,
        Please enter this code: '.$code.' to complete your loan application with 156 Credits.
        The code expires in 30 minutes.
        ';
        email_function($email, $subject, $content);
        ////send to email stops here

         
        if($response == 101){
                 
                 
                  
                  //check
                  $sql_check = "SELECT id FROM `otp` WHERE `phone`='$phone'";
                  $query_check = mysqli_query($dbc, $sql_check);
                  $num_check = mysqli_num_rows($query_check);

                  //delete first
                  if($num_check >= 1){
                    $sql_del1 = "DELETE FROM `otp` WHERE `phone`='$phone'";
                    $query_del1 = mysqli_query($dbc, $sql_del1);
                    
                   

                  }

                  $current_date = date('Y-m-d H:i:s');
                  $expiry_date =  date('Y-m-d H:i:s', strtotime($current_date. ' + 30 minute'));
                  $unique_id =  md5(md5($current_date.$expiry_date.$phone));

                  $sql = "INSERT INTO `otp` SET
                  `unique_id` = '$unique_id',
                  `phone` = '$phone',
                  `code` = '$code',
                  `date_sent` = '$current_date',
                  `expiry_date` = '$expiry_date'
                  ";
                  $query = mysqli_query($dbc, $sql) ;
                  

                return json_encode(array( "status"=>111, "msg"=>"success"));

        }
        else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry, please try again1" ));

        }
    }



function start_reg_with_phone($phone){
    global $dbc;
    $sqlcheck = "SELECT * FROM `user` WHERE `mobile_phone_number`='$phone'";
    $qrycheck = mysqli_query($dbc,$sqlcheck);
    $cc = mysqli_num_rows($qrycheck);
    
    $validate_phone = validate_phone($phone);
    $validate_phone_dec = json_decode($validate_phone,true);
    
    if($validate_phone_dec['status'] != 111 ){
            return json_encode(array( "status"=>100, "msg"=>$validate_phone_dec['msg'] ));
     }
    else if($cc >= 1){
            return json_encode(array( "status"=>108, "msg"=>"You have been onboarded already. Thank you." ));
    }
    else{
            // $sql = "SELECT * FROM `existing_users` WHERE `phone_1`='$phone'";
            $sql = "SELECT * FROM `existing_users` WHERE (`phone_1`='$phone' OR `phone_2`='$phone')";
            $qry = mysqli_query($dbc,$sql);
            $count = mysqli_num_rows($qry);
            if($count <= 0){
            return json_encode(array( "status"=>101, "msg"=>"Oops...Your record does not exist"));
            }else{
            $row = mysqli_fetch_array($qry);
            $staffname = $row['staff_name'];
            return json_encode(array( "status"=>111, 
            "msg"=>"success",
            "staffname"=>$staffname
            ));
            }
    }
    
}


function new_bvn_validate($bvn,$phone){
    global $dbc;
    $vonlybvn = validate_only_bvn($bvn);
    $vonlybvn_dec = json_decode($vonlybvn,true);
    if($vonlybvn_dec['status']  != 111){
        return json_encode(array( "status"=>108, "msg"=>$vonlybvn_dec['msg'] ));
    }else{
       $sql = "SELECT * FROM `existing_users` WHERE (`phone_1`='$phone' OR `phone_2`='$phone') AND `bvn`='$bvn'";
            $qry = mysqli_query($dbc,$sql);
            $count = mysqli_num_rows($qry);
            if($count <= 0){
               return json_encode(array( "status"=>101, "msg"=>"Sorry BVN not found, please enter correct BVN"));
            }else{
            $row = mysqli_fetch_array($qry);
            $staffname = $row['staff_name'];
            return json_encode(array( "status"=>111, "msg"=>"success", "staffname"=>$staffname
            ));
            }    
    }
    
    
    
}


function new_accountno_validate($accountno,$phone,$bvn){
     global $dbc;
    
     $count = strlen((string) $accountno);
     
     if(is_numeric($accountno)){
             if($count == 10){
                 
                    $sql = "SELECT * FROM `existing_users` WHERE `bank_acct_no`='$accountno' AND (`phone_1`='$phone' OR `phone_2`='$phone' ) AND `bvn`='$bvn'";
                    $qry = mysqli_query($dbc,$sql);
                    $count = mysqli_num_rows($qry);
                    if($count <= 0){
                    return json_encode(array( "status"=>101, "msg"=>"Sorry account no not found, please enter salary account number"));
                    }else{
                    return json_encode(array( "status"=>111, "msg"=>"success"));
                    }  
                 
             }else{
                 return json_encode(array( "status"=>102, "msg"=>"Sorry please enter with 10 digit salary account number" ));          
             }
       }else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry please enter with 10 digit salary account number" ));
       }
}


function user_reg_details($accountno,$phone,$bvn,$email){
      global $dbc;
        $sql = "SELECT * FROM `existing_users` WHERE `bank_acct_no`='$accountno' AND `phone_1`='$phone' AND `bvn`='$bvn'";
        $qry = mysqli_query($dbc,$sql);
        $count = mysqli_num_rows($qry);
        if($count <= 0){
        return json_encode(array( "status"=>101, "msg"=>"Sorry, your record was not found. Try again"));
        }else{
            $row = mysqli_fetch_array($qry);
            $fullname = $row['staff_name'];
            $bvn1 = $row['bvn'];
            $phone1 = $row['phone_1'];
            $dob = $row['dob'];
            $dob2 = date('F-d-Y', strtotime($dob));
            $bankname = $row['bank_name'];
            $accountno1 = $row['bank_acct_no'];
            return json_encode(array( "status"=>111,
                                      "msg"=>"success",
                                      "fullname"=>$fullname,
                                      "bvn"=>$bvn1,
                                      "phone"=>$phone1,
                                      "dob"=>$dob2,
                                      "email"=>$email,
                                      "bankname"=>$bankname,
                                      "acctno"=>$accountno1
                    ));
        }  
}




function user_registration_version2($phone,$email){
    global $dbc;
    $sql = "SELECT mobile_phone_number FROM `user` WHERE `mobile_phone_number`='$phone'";
    $qry = mysqli_query($dbc,$sql);
    $cc = mysqli_num_rows($qry);
    if($cc >= 1){
        return json_encode(array( "status"=>101, "msg"=>"Sorry, you have been onboarded already" ));
    }else{
        $sql2 = "SELECT * FROM `existing_users` WHERE `phone_1`='$phone'";
        $qry2 = mysqli_query($dbc,$sql2);
        $row2 = mysqli_fetch_array($qry2);
        $sname = $row2['staff_name'];
        $name_ex = explode(' ',$sname);
        $fname = $name_ex[1];
        $lname = $name_ex[0];
        $phone_1 = $row2['phone_1'];
        $phone_2 = $row2['phone_2'];
        
        if($phone_2 == '-' || $phone_2 == ""){
            $phone_2 = $phone_1;
        }
        
        $bank_name = $row2['bank_name'];
        $bank_acct_no = $row2['bank_acct_no'];
        $bc = $row2['bank_code'];
        $bvn = $row2['bvn'];
        $unique_id = md5(time().$phone);
        
        $sqlins = "INSERT INTO `user` SET
            `user_id`='$unique_id',
            `first_name`='$fname',
            `last_name`='$lname',
            `mobile_phone_number`='$phone',
            `phone_input1`='$phone_1',
            `phone_input2`='$phone_2',
            `email_address`='$email',
            `channel`=1,
            `status`=1,
            `acctno`='$bank_acct_no',
            `bankname`='$bank_name',
            `bankcode`='$bc',
            `bvn`='$bvn',
            `when_added`=now(),
             `created_at`=now(),
            `updated_at`= now()
        ";
        $qryins = mysqli_query($dbc,$sqlins);
        if($qryins){
            return json_encode(array( "status"=>111, "msg"=>"success" ));
        }else{
            return json_encode(array( "status"=>106, "msg"=>"Sorry, registration failed" ));
            
        }
    }
    
}


//////////////////NEW UPDATES ABOVE 19 JULY 2020

function validate_user_action($phone){
    global $dbc;
    $sql = "SELECT * FROM `account_repayment_records` WHERE `client_phone`='$phone' AND `status`='success'";
    $qry = mysqli_query($dbc,$sql);
    $num = mysqli_num_rows($qry);
    if($num > 0){
        return json_encode(array( "status"=>111, "msg"=>"You have been authenticated" ));   
    }else{
        return json_encode(array( "status"=>100, "msg"=>"Oops! We cannot confirm that you made a payment. Please try again later" ));   
        
    }
    
}


function card_validation($email,$amount,$phone){
    global $dbc;
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => array('email' => $email,'amount' => $amount),
  CURLOPT_HTTPHEADER => array(
    "Authorization: Bearer sk_live_3811f301276c2252058b122991a6d3a92fb2c6bc"
  ),
));

$response = curl_exec($curl);
curl_close($curl);
$decode_response = json_decode($response,true);

if($decode_response['status']){
    $authorization_url =  $decode_response['data']['authorization_url'];
    $reference =  $decode_response['data']['reference'];
    $access_code =  $decode_response['data']['access_code'];
    //$unique_id = $phone.$amount.$email;
     $sql = "INSERT INTO `account_repayment_records` SET
                
                  `client_phone` = '$phone',
                  `customer_reference` = '$reference',
                  `access_code` = '$access_code'
                 
                  ";
                  $query = mysqli_query($dbc, $sql) ;
                  
           return json_encode(array( "status"=>111, "msg"=>$authorization_url ));    


}else{
    return json_encode(array( "status"=>100, "msg"=>"error occured" ));  
}


//return $response;

//   $curl = curl_init();

// curl_setopt_array($curl, array(
//   CURLOPT_URL => "https://api.paystack.co/transaction/initialize",
//   CURLOPT_RETURNTRANSFER => true,
//   CURLOPT_ENCODING => "",
//   CURLOPT_MAXREDIRS => 10,
//   CURLOPT_TIMEOUT => 0,
//   CURLOPT_FOLLOWLOCATION => true,
//   CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//   CURLOPT_CUSTOMREQUEST => "POST",
//   CURLOPT_POSTFIELDS =>"{\n\t\"email\": ".$email.",\n\t\"amount\": \"5000\"}",
//   CURLOPT_HTTPHEADER => array(
//     "Authorization: Bearer ".$secret_key,
//     "Content-Type: application/json"
//   ),
// ));

// $response = curl_exec($curl);

// curl_close($curl);
// return $response;

}

function validate_email($email){
          return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $email)) ?  json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid email address" )) :  json_encode(array( "status"=>111, "msg"=>"valid" )) ;
}

function email_function($email, $subject, $content){
  //$headers = "From: 156 Credit\r\n";
  $headers = 'From: 156 Credit<sms@156credit.com>' . "\r\n" .'Reply-To: <sms@156credit.com>';
  $mail = mail($email, $subject, $content, $headers);
  //return $mail;
}

// function send_email_otpNOTENEEDED($email){
//       global $dbc;
//       $code = rand(11111,99999);
//       $subject = "156 Credit OTP Confirmation";
//       $content = 'Hello,
//                           Please enter this code: '.$code.' to proceed with your registration on whatsapp with 156 Credits.
//                           The code expires in 30 minutes.
//                   ';
        
       
       
//                   //check
//                   $sql_check = "SELECT id FROM `email_otp` WHERE `email`='$email'";
//                   $query_check = mysqli_query($dbc, $sql_check);
//                   $num_check = mysqli_num_rows($query_check);

//                   //delete first
//                   if($num_check >= 1){
//                     $sql_del1 = "DELETE FROM `email_otp` WHERE `email`='$email'";
//                     $query_del1 = mysqli_query($dbc, $sql_del1);
                    
                   

//                   }

//                   $current_date = date('Y-m-d H:i:s');
//                   $expiry_date =  date('Y-m-d H:i:s', strtotime($current_date. ' + 30 minute'));
//                   $unique_id =  md5(md5($current_date.$expiry_date.$email));

//                   $sql = "INSERT INTO `email_otp` SET
//                   `unique_id` = '$unique_id',
//                   `email` = '$email',
//                   `code` = '$code',
//                   `date_sent` = '$current_date',
//                   `expiry_date` = '$expiry_date'
//                   ";
//                   $query = mysqli_query($dbc, $sql) ;
//                   ///send the email
//                  email_function($email, $subject, $content);

//                 return json_encode(array( "status"=>111, "msg"=>"success" ));

        
       
// }


function send_otp($phone,$email){
       global $dbc;
       global $developerid;
       global $senderid;
       global $cloud_sms_password;
       $phone2 =  (string) $phone;
       $phone3 = preg_replace('/^./', '', $phone);
       $phone4 = '234'.$phone3;
       $pho = "2348168509044";
       
       $code = rand(11111,99999);
       $message = urlencode("Please enter this code: $code to proceed with your registration with 156 Credits. The code expires in 30 minutes");

        
        $sms = "https://developers.cloudsms.com.ng/api.php?userid=".$developerid."&password=".$cloud_sms_password."&type=0&destination=".$phone4."&sender=".$senderid."&message=".$message."";
        $response = file_get_contents($sms);
        
         ////send to email too
                    $subject = "156 Credit OTP Confirmation";
                    $content = 'Hello,
                    Please enter this code: '.$code.' to proceed with your registration with 156 Credits.
                    The code expires in 30 minutes.
                    ';
                    email_function($email, $subject, $content);
        ////send to email stops here
         
        if($response == 101){
                 
                 ////send to email too
                    $subject = "156 Credit OTP Confirmation";
                    $content = 'Hello,
                    Please enter this code: '.$code.' to proceed with your registration with 156 Credits.
                    The code expires in 30 minutes.
                    ';
                    email_function($email, $subject, $content);
                  ////send to email stops here
                  
                  
                  //check
                  $sql_check = "SELECT id FROM `otp` WHERE `phone`='$phone'";
                  $query_check = mysqli_query($dbc, $sql_check);
                  $num_check = mysqli_num_rows($query_check);

                  //delete first
                  if($num_check >= 1){
                    $sql_del1 = "DELETE FROM `otp` WHERE `phone`='$phone'";
                    $query_del1 = mysqli_query($dbc, $sql_del1);
                    
                   

                  }

                  $current_date = date('Y-m-d H:i:s');
                  $expiry_date =  date('Y-m-d H:i:s', strtotime($current_date. ' + 30 minute'));
                  $unique_id =  md5(md5($current_date.$expiry_date.$phone));

                  $sql = "INSERT INTO `otp` SET
                  `unique_id` = '$unique_id',
                  `phone` = '$phone',
                  `code` = '$code',
                  `date_sent` = '$current_date',
                  `expiry_date` = '$expiry_date'
                  ";
                  $query = mysqli_query($dbc, $sql) ;
                  

                return json_encode(array( "status"=>111, "msg"=>"success"));

        }
        else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry, please try again1" ));

        }
    }


function verify_otp($otp,$phone){
    global $dbc;
     $otp = (int)$otp;
     $sql = "SELECT `id` FROM `otp` WHERE `phone`='$phone' AND `code`='$otp'";
     $query = mysqli_query($dbc,$sql);
     $count = mysqli_num_rows($query);
     
     if($count >= 1){
         return json_encode(array( "status"=>111, "msg"=>"success" ));
     }else{
         return json_encode(array( "status"=>100, "msg"=>"Sorry, wrong otp entered...Please try again" ));
     }
}


function validate_both_phone($phone,$phone2) {
    $count = strlen((string) $phone);
    //$pattern = '/^234[0-9]{10}/';
    $pattern2 = '/^[0-9]{11}/';
    
    ///check phone number if exists in db
    //$sql_check = "SELECT id FROM existing_users WHERE `phone_1`='$phone' OR `phone_1`='$phone2' OR  `phone_2`='$phone' OR `phone_2`='$phone2'";
    

    if(is_numeric($phone)){
            //  if($count == 11){
           
            //   return !preg_match($pattern2,$phone) ?  json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid phone number22" )) :  json_encode(array( "status"=>111, "msg"=>"valid" )) ;
            //  }

              if($count == 11){
              return !preg_match($pattern2,$phone) ?  json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid phone number" )) :  json_encode(array( "status"=>111, "msg"=>"valid" )) ;

             }


            else{

              return json_encode(array( "status"=>100, "msg"=>"incorrect phone digits, kindly check and try again." )) ;

            }
      }else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid phone number" ));

      }


   

}



function validate_phone($phone) {
    global $dbc;
    $count = strlen((string) $phone);
    $phone = (string) $phone;
    //$pattern = '/^234[0-9]{10}/';
    $pattern2 = '/^[0-9]{11}/';
    
    ///check phone number if exists in db
        ///check phone number if exists in db
    $sql_check = "SELECT * FROM `existing_users` WHERE `phone_1`='$phone' OR `phone_2`='$phone'";
    $query_check = mysqli_query($dbc,$sql_check);
    $num_check = mysqli_num_rows($query_check);
    
    if($num_check >= 1){
           
              if(is_numeric($phone)){
            //  if($count == 11){
            
            //   return !preg_match($pattern2,$phone) ?  json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid phone number22" )) :  json_encode(array( "status"=>111, "msg"=>"valid" )) ;
            //  }
            
            if($count == 11){
            return !preg_match($pattern2,$phone) ?  json_encode(array( "status"=>100, "msg"=>"Sorry, please enter 11 digit phone number" )) :  json_encode(array( "status"=>111, "msg"=>"valid" )) ;
            
            }
            
            
            else{
            
            return json_encode(array( "status"=>100, "msg"=>"Sorry, please enter 11 digit phone number." )) ;
            
            }
            }
            
            else{
            
               return json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid phone number" ));
            
            }  
        
        
             return json_encode(array( "status"=>100, "msg"=>"Sorry mobile not found, please enter mobile number provided to employer!" ));
    }else{
            return json_encode(array( "status"=>100, "msg"=>"Sorry mobile not found, please enter mobile number provided to employer!" ));
    }
    
}


function validate_staff_no($staff,$phone) {
    global $dbc;
    ///check staff number if exists in db
    $sql_check = "SELECT * FROM `existing_users` WHERE  `staff_number`='$staff'  AND (`phone_1`='$phone' OR `phone_2`='$phone')";
    $query_check = mysqli_query($dbc,$sql_check);
    $num_check = mysqli_num_rows($query_check);
    
    if($num_check <= 0){
             //return json_encode(array( "status"=>100, "msg"=>"this staff number does not match your phone number!" ));
              return json_encode(array( "status"=>111, "msg"=>"success" ));
        
    }else{
                 return json_encode(array( "status"=>111, "msg"=>"success" ));
    }
    
}




///enter bank to get code before account number
function validate_acctno($acctno,$bankcode){
   global $secret_key;

    //$bankcode parameter is the selection on the chat builder

   ///check bankcode selection to get real bankcode
   $get_real_bank_code = get_bank_name($bankcode);
   $bankcode_dec = json_decode($get_real_bank_code,true);
   if($bankcode_dec['status'] != 111){
          
        return json_encode(array( "status"=>100, "msg"=>"wrong bank code option entered" ));          

   }else{
         
         $real_bank_code = $bankcode_dec['bankcode'];
   }
   ///check bankcode selection to get real bankcode




   $count = strlen((string) $acctno);

       if(is_numeric($acctno)){
             if($count == 10){
                 //return json_encode(array( "status"=>111, "msg"=>"valid" ));   
                 ///now check if this account number actually exists
                $curl = curl_init();

                curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.paystack.co/bank/resolve?account_number=".$acctno."&bank_code=".$real_bank_code."",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer ".$secret_key
                ),
                ));

                $response = curl_exec($curl);

                curl_close($curl); 

                //return $response;
                $decode_response = json_decode($response,true);
          
               if($decode_response['status']){
                    return json_encode(array( "status"=>111, "msg"=>"success" ));

                }else{
                    return json_encode(array( "status"=>100, "msg"=>$decode_response['message'] ));

               }

             }else{
                 
                 return json_encode(array( "status"=>102, "msg"=>"account number should have 10 digits, kindly check and try again" ));          

             }

       

       }else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry, kindly enter a valid account number" ));
       }

}


function get_bank_name($id){
    if($id == 1){
                 return json_encode(array( "status"=>111, "bankcode"=>"044", "bankname"=>"Access Bank Plc"  ));         
    }
    else if($id == 2){
                 return json_encode(array( "status"=>111, "bankcode"=>"070",  "bankname"=>"Fidelity Bank Plc" ));         
    }
    else if($id == 3){
                 return json_encode(array( "status"=>111, "bankcode"=>"214", "bankname"=>"First City Monument Bank Limited" ));         
    }
   else if($id == 4){
                 return json_encode(array( "status"=>111, "bankcode"=>"011", "bankname"=>"First Bank of Nigeria Limited" ));         
    }
   else if($id == 5){
                 return json_encode(array( "status"=>111, "bankcode"=>"058", "bankname"=>"Guaranty Trust Bank Plc" ));         
    }
   else if($id == 6){
                 return json_encode(array( "status"=>111, "bankcode"=>"032", "bankname"=>"Union Bank of Nigeria Plc" ));         
    }
   else if($id == 7){
                 return json_encode(array( "status"=>111, "bankcode"=>"032", "bankname"=>"United Bank for Africa Plc" ));         
    }
  else  if($id == 8){
                 return json_encode(array( "status"=>111,"bankcode"=>"057", "bankname"=>"Zenith Bank Plc" ));         
    }
   else if($id == 9){
                 return json_encode(array( "status"=>111, "bankcode"=>"023", "bankname"=>"Citibank Nigeria Limited" ));         
    }
 
  else if($id == 10){
                 return json_encode(array( "status"=>111, "bankcode"=>"050", "bankname"=>"Ecobank Nigeria Plc" ));         
    }
  else if($id == 11){
                 return json_encode(array( "status"=>111, "bankcode"=>"030", "bankname"=>"Heritage Banking Company Limited" ));         
    }
  else if($id == 12){
                 return json_encode(array( "status"=>111,"bankcode"=>"082", "bankname"=>"Keystone Bank Limited" ));         
    }
   else if($id == 13){
                  return json_encode(array( "status"=>111, "bankcode"=>"068", "bankname"=>"Standard Chartered Bank" ));         
     }
  else if($id == 14){
                 return json_encode(array( "status"=>111, "bankcode"=>"221", "bankname"=>"Stanbic IBTC Bank Plc" ));         
    }
 else if($id == 15){
                 return json_encode(array( "status"=>111, "bankcode"=>"232", "bankname"=>"Sterling Bank Plc" ));         
    }

  // else if($id == 16){
  //                return json_encode(array( "status"=>111, "bankcode"=>"022", "bank"=>"Titan Trust Bank Limited" ));         
  //   }
   else if($id == 16){
                 return json_encode(array( "status"=>111, "bankcode"=>"215", "bankname"=>"Unity Bank Plc" ));         
    }
   else if($id == 17){
                 return json_encode(array( "status"=>111, "bankcode"=>"035","bankname"=>"Wema Bank Plc" ));         
    } 


    else{
                 return json_encode(array( "status"=>100,"bankcode"=>"000000", "bankname"=>"Oops, kindly select a correct option" ));    

    }
 
}


function validate_other_info_with_bvn($bvn,$first_name,$last_name,$phone){
   global $dbc;
   global $secret_key;
   $validate_only_bvn = validate_only_bvn($bvn);
   $decode_only_bvn = json_decode($validate_only_bvn,true);
  
  ///check if bvn has been saved
  //check
  $sql_check = "SELECT * FROM `bvn_json` WHERE `phone`='$phone' AND `bvn`='$bvn'";
  $query_check = mysqli_query($dbc, $sql_check);
  $num_check = mysqli_num_rows($query_check);
                  
                  
   
   if($num_check >= 1){
        return json_encode(array( "status"=>111, "msg"=>"success" ));
   }else{
        
        
        if($decode_only_bvn['status'] != 111 ){
        //carry out first time bvn test and display error
        return $validate_only_bvn;

    }else{

          if($bvn == '' ||  $first_name == '' ||  $last_name == '' ||  $phone == ''  ){
          return json_encode(array( "status"=>100, "msg"=>"empty field(s) found" ));          
          } 
          else{

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
                "Authorization: Bearer ".$secret_key
                ),
                ));

               $response = curl_exec($curl);

               curl_close($curl);

               //return $response;
        

               $decode_response = json_decode($response,true);
          
              if($decode_response['status']){

               
        
                  $first_name_ps =  strtolower($decode_response['data']['first_name']);         
                  $last_name_ps=  strtolower($decode_response['data']['last_name']);
                  $first_name =  strtolower($first_name);
                  $last_name =  strtolower($last_name);
                  $phone_ps =  $decode_response['data']['mobile'];
                  $bvn_ps =  $decode_response['data']['bvn'];

                  if(  $phone_ps != $phone ||  $bvn_ps != $bvn || $last_name_ps != $last_name ) {
                        return json_encode(array( "status"=>100, "msg"=>"Sorry ".$first_name.", we will not be able to continue with your registration because the BVN entered does not match your credentials." ));///this should log into the db to note that this person made a wrong attempt before          

                  }else{
                        
                        //save json response
                        $sql_insert = "INSERT INTO `bvn_json` SET `json`='$response',`phone`='$phone',`first_name`='$first_name',`last_name`='$last_name',`bvn`='$bvn',`date`=now()";
                        $sql_query = mysqli_query($dbc,$sql_insert);


                      return json_encode(array( "status"=>111, "msg"=>"success" ));

                  }
                

     
                }else{
                
                    return json_encode(array( "status"=>100, "msg"=>$decode_response['message'] ));
                
                }

          

          
          }


    }
       
              
   }


}




function validate_only_bvn($bvn){
       $count = strlen((string) $bvn);

       if(is_numeric($bvn)){
             if($count == 11){
                 return json_encode(array( "status"=>111, "msg"=>"valid" ));          

             }else{
                 
                 return json_encode(array( "status"=>102, "msg"=>"Sorry please enter with 11 digit BVN." ));          

             }

       

       }else{
                 return json_encode(array( "status"=>100, "msg"=>"Sorry please enter with 11 digit BVN" ));
       }

}
//////////////////////////////not needed for now
