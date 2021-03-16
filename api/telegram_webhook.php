<?php   require_once("config/validations.php");
        //   echo '1614986733:AAGrnwiZt_VplJb711VboHpbr0g8fZtPzsc';
        //   echo "Bot Webhook Test";

        $path = "https://api.telegram.org/bot1614986733:AAGrnwiZt_VplJb711VboHpbr0g8fZtPzsc";
        $telegram_json = file_get_contents("php://input");
        $update = json_decode(file_get_contents("php://input"), TRUE);
        $chatId = $update["message"]["chat"]["id"];
        $currentMessage = $update["message"]["text"];
        $chatStatus = get_one_row_by_id('chat_status_tbl','chat_id',$chatId);
        
        
        function defaultMessage(){
        	$messageReply = "Welcome to OneFiveSix Credit.\n\n";
            $messageReply .= "What will you like to do?\n";
            $messageReply .= "Please reply with any of the options below\n";
            $messageReply .= "1. Register\n";
            $messageReply .= "2. Apply for a loan\n";
            $messageReply .= "3. View existing loans\n";
            $messageReply .= "4. Manual repayment\n";
            $messageReply .= "5. Contact us\n";
            $messageReply .= "6. FAQs\n";
            return urlencode($messageReply);
        }
        
        function updateChatStage($chatId,$status,$jso){
            global $dbc;
             $check_exist = check_record_by_one_param('chat_status_tbl','chat_id',$chatId);
             
             
             
             if($check_exist == false){
                  ///means the array is new
                        $arr = array();
                        $jsoo = json_encode($arr);
                        $sql_ins = "INSERT INTO `chat_status_tbl` SET `variable_json`='$jsoo', `chat_id`= '$chatId',`status`='$status',`date_added`=now()";
                        $query_ins = mysqli_query($dbc,$sql_ins);
             }else{
             
                    //means leave it, dont touch it
                 if($jso == ""){
                        
                        $sql_upll = "UPDATE `chat_status_tbl` SET `status`= '$status' WHERE `chat_id`='$chatId'";
                        $query_upll = mysqli_query($dbc,$sql_upll);
                     
                 }
                 
                 else if( empty($jso) ){
                        $jsone = json_encode($jso);
                        $sql_upll = "UPDATE `chat_status_tbl` SET `status`= '$status',`variable_json`='$jsone' WHERE `chat_id`='$chatId'";
                        $query_upll = mysqli_query($dbc,$sql_upll);
                 }
                 
                 else{
                     //means you edited the array
                        $jsone = json_encode($jso);
                        $sql_upll = "UPDATE `chat_status_tbl` SET `status`= '$status',`variable_json`='$jsone' WHERE `chat_id`='$chatId'";
                        $query_upll = mysqli_query($dbc,$sql_upll);
                     
                 }
             
                 
             
                 
                 
             }
        }
        
        
        
       //////////logic starts here
       if( $chatStatus === null || $currentMessage == 'hello' ){
            updateChatStage($chatId,'started',[]);
            $messageReply = defaultMessage();
            file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageReply);
            updateChatStage($chatId,'started',[]);
        }

       elseif($chatStatus['status'] === "started"  && $currentMessage == '1'){
			$messageReply = "Thank you. \n";
			$messageReply .= "Please enter your mobile no provided to employer.\n";
			$messageRep = urlencode($messageReply);
    	    file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
            updateChatStage($chatId,'get_phone',"");
        }
        


       elseif($chatStatus['status'] === "get_phone" && $currentMessage != 'hello'){
            $start_reg_with_phone = start_reg_with_phone($currentMessage);
            $dec = json_decode($start_reg_with_phone,true);
            
            if(  $dec['status'] == 111  ){
                 $messageReply = "Thank you. \n";
                 $messageReply .= "Enter your BVN.\n";
                 $messageRep = urlencode($messageReply);                
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                
                //get_variable
                $variable_arr = json_decode($chatStatus['variable_json'],true);
                $add_arr = array(
                "phone"=>$currentMessage
                );
                array_push($variable_arr,$add_arr);
                
                //get variable end
                 updateChatStage($chatId,'get_bvn',$variable_arr);
                 
            }else{
            	 $messageRep = $dec['msg'];
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'get_phone',"");
            }
					
        }
        
        
        
        
     elseif($chatStatus['status'] === "get_bvn" && $currentMessage != 'hello'){
			$new_bvn_validate = new_bvn_validate( $currentMessage , json_decode($chatStatus['variable_json'],true)[0]['phone']  );
            $dec = json_decode($new_bvn_validate,true);
            if(  $dec['status'] == 111  ){
                 $messageReply = "Thank you. \n";
                 $messageReply .= "Enter your email address.\n";
                 $messageRep = urlencode($messageReply);                
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 
                //get_variable
                $variable_arr = json_decode($chatStatus['variable_json'],true);
                $add_arr = array(
                "bvn"=>$currentMessage
                );
                array_push($variable_arr,$add_arr);
              
                //get variable end
                updateChatStage($chatId,'get_email',$variable_arr);
          
            }else{
            	 $messageRep = $dec['msg'];
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'get_bvn',"");
            }
        }
       
     
       
      elseif($chatStatus['status'] === "get_email" && $currentMessage != 'hello'){
			$validate_email =  validate_email($currentMessage);
            $dec = json_decode($validate_email,true);
            if(  $dec['status'] == 111  ){
                 $messageReply = "Thank you. \n";
                 $messageReply .= "Please enter your 11 digit salary account no.\n";
                 $messageRep = urlencode($messageReply);                
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                
                //get_variable
                $variable_arr = json_decode($chatStatus['variable_json'],true);
                $add_arr = array(
                "email"=>$currentMessage
                );
                array_push($variable_arr,$add_arr);
              
                //get variable end 
                 
                 updateChatStage($chatId,'get_account_no',$variable_arr);
            
                
                
            }else{
            	 $messageRep = $dec['msg'];
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'get_email',"");
            }
         }
         
         
     elseif($chatStatus['status'] === "get_account_no" && $currentMessage != 'hello'){
			$new_accountno_validate =  new_accountno_validate($currentMessage,json_decode($chatStatus['variable_json'],true)[0]['phone'],json_decode($chatStatus['variable_json'],true)[1]['bvn'] );
            $dec = json_decode($new_accountno_validate,true);
            if(  $dec['status'] == 111  ){
                
                $user_det = user_reg_details($currentMessage,json_decode($chatStatus['variable_json'],true)[0]['phone'],json_decode($chatStatus['variable_json'],true)[1]['bvn'],json_decode($chatStatus['variable_json'],true)[2]['email']);
                $user_dec = json_decode($user_det,true);
                $fullname = $user_dec['fullname'];
                $phone = $user_dec['phone'];
                $dob = $user_dec['dob'];
                $bankname = $user_dec['bankname'];
                $acctno = $user_dec['acctno'];
                $email = $user_dec['email'];
                $bvn = $user_dec['bvn'];
                
                $messageReply = "Thank you. \n";
                $messageReply .= "Please confirm your details below.\n";
                $messageReply .= "Full name:	".$fullname."\n";
                $messageReply .= "BVN:		".$bvn." \n";
                $messageReply .= "Phone no:	".$phone."\n";
                $messageReply .= "DOB:		".$dob."\n";
                $messageReply .= "Email:		".$email."\n";
                $messageReply .= "Bank name:	".$bankname."\n";
                $messageReply .= "Bank a/c no:	".$acctno."\n\n";
                $messageReply .= "Enter 1 to confirm details\n";
                $messageReply .= "Enter 2 to return to main menu\n";
                // $messageReply .= "Enter 're' for incorrect details\n";
                $messageReply .= "Kindly Note: If any of the above information is incorrect, send a mail to help@156credit.com\n";
                
                $messageRep = urlencode($messageReply);
                file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                
                //get_variable
                $variable_arr = json_decode($chatStatus['variable_json'],true);
                $add_arr = array(
                "account_no"=>$currentMessage
                );
                array_push($variable_arr,$add_arr);
               
                //get variable end
                
                updateChatStage($chatId,'confirm_user_details',$variable_arr);
                 
                 
            }else{
            	 $messageRep = $dec['msg'];
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'get_account_no',"");
            }
         }
         
         
         ///send otp here
     elseif($chatStatus['status'] === "confirm_user_details"  && $currentMessage == '1'){
		        
                $send_otp =  send_otp(json_decode($chatStatus['variable_json'],true)[0]['phone'],json_decode($chatStatus['variable_json'],true)[2]['email']);
                $dec = json_decode($send_otp,true);
                if(  $dec['status'] == 111  ){
                    $messageReply = "Enter OTP sent to your phone number and email address.\n";
                    $messageRep = urlencode($messageReply);                
                    file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                    updateChatStage($chatId,'get_otp',"");
                }else{
                    ///most likely will not run at all
                    $messageRep = $dec['msg'];
                    file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                    updateChatStage($chatId,'confirm_user_details',"");
                }
		
        }
        
      
      ///enter otp
    elseif($chatStatus['status'] === "get_otp"  && $currentMessage !== 'hello'){
                $verify_otp =  verify_otp($currentMessage,'08032122345');
                $dec = json_decode($verify_otp,true);
                if(  $dec['status'] == 111  ){
                    
                    $user_registration_version2 = user_registration_version2(json_decode($chatStatus['variable_json'],true)[0]['phone'], json_decode($chatStatus['variable_json'],true)[2]['email'] );
                    $dec_reg = json_decode($user_registration_version2,true);
                    if($dec_reg['status'] == 111){
                        
                        $messageReply = "Congratulations. Registration complete.\n";
                        $messageReply .= "Enter 'hello' to return to main menu.\n";
                        $messageRep = urlencode($messageReply);                
                        file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                        updateChatStage($chatId,'started',[]);
                    
                        
                    }else{
                    
                        $messageRep = $dec_reg['msg'];
                        file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                        updateChatStage($chatId,'get_otp',"");
                    
                    }
                    
               
                }else{
                    ///when wront otp is entered
                    $messageRep = $dec['msg'];
                    file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                    updateChatStage($chatId,'get_otp',"");
                }
		
        }
        

    
    
        ///starting afresh
     elseif($chatStatus['status'] === "confirm_user_details"  &&  $currentMessage == '2'){
                updateChatStage($chatId,'started');
                $messageReply = defaultMessage();
                file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageReply);
                updateChatStage($chatId,'started',"");
        }
        
        if($chatStatus['status'] === "confirm_user_details"  && $currentMessage == '3'){
		         $messageReply = "Unfortunately, we are unable to complete registration. Please contact your employer. \n";
                 $messageReply .= "Enter 2 to return to main menu.\n";
                 $messageRep = urlencode($messageReply);                
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'confirm_user_details',"");
        }
        
        
        
        
        
      //  }
      
      
      
      ///view existing loans
     elseif($chatStatus['status'] === "started" && $currentMessage == '3' ){
            $messageReply = "Thank you.\n";
            $messageReply .= "Please enter your registered phone no\n";
            $messageRep = urlencode($messageReply);
            file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);   
            updateChatStage($chatId,'get_phone_4_loan_status',"");
        }
      
       if($chatStatus['status'] === "get_phone_4_loan_status"  && $currentMessage != 'hello'){
             $view_running_loan =  view_running_loan($currentMessage);
             $dec = json_decode($view_running_loan,true);
             if($dec['status'] == 111){
                $fullname = $dec['first_name'].' '.$dec['last_name'];
                $loan_amountf = $dec['loan_amountf'];
                $expected_repaymentf = $dec['expected_repaymentf'];
                $tenure_days = $dec['tenure_days'];
                $date_applied = $dec['date_applied'];
                $date_approved = $dec['date_approved'];
                $interest_rate = $dec['interest_rate'];
                
               
                $messageReply = "Your loan details are below:\n";
                $messageReply .= "Fullname: ".$fullname." \n";
                $messageReply .= "Loan Amount: &#8358;".$loan_amountf." \n";
                $messageReply .= "Expected Repayment: &#8358;".$expected_repaymentf." \n";
                $messageReply .= "Tenure: ".$tenure_days." days \n";
                $messageReply .= "Interest Rate: ".$interest_rate."%  \n";
                $messageReply .= "Date Applied: ".date('F-d-Y',strtotime($date_applied))."\n";
                $messageReply .= "Date Approved: ".date('F-d-Y',strtotime($date_approved))." \n";
                $messageRep = urlencode($messageReply);
                file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);   
                updateChatStage($chatId,'started',[]);
                 
             }else{
                 $messageRep = $dec['msg'];
                 file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);
                 updateChatStage($chatId,'get_phone_4_loan_status',"");
                 
             }
         } 



         //////last resort
         else if( $chatStatus['status'] === "started" 
         	     && $currentMessage != '1'
		         && $currentMessage != '2'
		         && $currentMessage != '3'
		         && $currentMessage != '4'
		         && $currentMessage != '5'
		         && $currentMessage != '6'
		         && $currentMessage != 'hello' ){
         	updateChatStage($chatId,'started',[]);
            $messageReply = "Please enter a valid option";
            file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageReply);
            updateChatStage($chatId,'started',[]);
         } 

         else{

         }
        
      
     

       
       
       
       
       
       ///start a loan application
        // else if($chatStatus['status'] === "started" && $currentMessage == '2' ){
        //     $messageReply = "Thank you.\n";
        //     $messageReply .= "Please enter your registered phone no\n";
        //     $messageRep = urlencode($messageReply);
        //     file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);   
        //     updateChatStage($chatId,'get_phone_loan',"");
        // }
        
        
          

// 		else if($currentMessage == '3'){
//             $messageReply = "Great...check your existing loans.";
//             file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageReply);   
//         }

//         else if($currentMessage == '4'){
//             $messageReply = "Great...make a manual repayment";
//             file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageReply);   
//         }

//         else if($currentMessage == '5'){
//             $messageReply = "Please contact customer service at \n";
//             $messageReply .= "+234 123456\n";
//             $messageRep = urlencode($messageReply);
//             file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);   
//         }



        //FAQs
        // else if($currentMessage == '6'){
        //     $messageReply = "Please check out our FAQs. Details are on our website\n";
        //     $messageReply .= "https://156credit.com\n";
        //     $messageRep = urlencode($messageReply);
        //     file_get_contents($path."/sendmessage?chat_id=".$chatId."&text=".$messageRep);   
        // }

    




// 		$sql = "INSERT INTO `telegram_webhook_tbl` SET `chat_json`='$telegram_json'";
// 		$query = mysqli_query($dbc, $sql);
	    //////////logic ends here


?>