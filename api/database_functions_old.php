<?php
$table = "";
$app_name = 'Whatsapp Lending Platform';
require_once("db_connect.php");
require_once("config.php");
global $dbc;


function unique_id_generator($data){
    $data = secure_database($data);
    $newid = md5(uniqid().time().rand(11111,99999).rand(11111,99999).$data);
    return $newid;
}

 function get_unique_id($initial){
            
             $uniquestring = strtoupper($initial['0']);
             $uniquestring2 = strtoupper($initial['1']);
             $uniqueid = rand(1000,99999);
             $uniqueid2 = date('hms');
             $uniqueid4 = time();
             

              $unique_id =  $initial.''.$uniqueid4.''.$uniqueid;

              return $unique_id;
  }

 function format_date($date){
        $date = secure_database($date);
        $new_date_format = date('F-d-Y', strtotime($date));

        return $new_date_format;
  }


function secure_database($value){
    global $dbc;
    $new_value = mysqli_real_escape_string($dbc,$value);
    return $new_value;
}

function variables_not_set(){
            
            return json_encode(array( "status"=>102, "msg"=>"one or more variables missing" ));

}
//105, "msg"=>"you are not authorized!"
// 104: password mismatch
// 103: this record exists
// 102: one or more variables missiing
// 101 : empty fields error
// 100: db error
// 111: success

function check_record_by_one_param($table,$param,$value){
    global $dbc;
    $sql = "SELECT id FROM `$table` WHERE `$param`='$value'";
    $query = mysqli_query($dbc, $sql);
    $count = mysqli_num_rows($query);
    if($count > 0){
      return true; ///exists
    }else{
      return false; //does not exist
    }
    
}        

function check_record_by_two_params($table,$param,$value,$param2,$value2){
    global $dbc;
    $sql = "SELECT id FROM `$table` WHERE `$param`='$value' AND `$param2`='$value2'";
    $query = mysqli_query($dbc, $sql);
    $count = mysqli_num_rows($query);
    if($count > 0){
      return true; ///exists
    }else{
      return false; //does not exist
    }
    
}        


function check_password($pass,$cpass){
    if($pass == $cpass){
      return true; //pass is same
    }else{
      return false; //pass is not same
    }
} 


function admin_registration($first_name,$last_name,$other_name,$password,$cpassword,$mobile_phone_number,$email_address,$permissions_details,$added_by,$status){
       global $dbc;
       //,$pinpass
       
        $first_name = secure_database($first_name);
        $password = secure_database($password);
        $password = md5($password);
        $cpassword = secure_database($cpassword);
        $cpassword = md5($cpassword);
        $last_name = secure_database($last_name);
        $other_name = secure_database($other_name);
        $mobile_phone_number = secure_database($mobile_phone_number);
        $email_address = secure_database($email_address);
        //$pinpass = secure_database($pinpass);
        $permissions_details = secure_database($permissions_details);
        $added_by = secure_database($added_by);
        $status = secure_database($status);
    
        $data = $first_name.$last_name.$email_address;
        $admin_id = unique_id_generator($data);
        $table = 'admin';
      
  

        $check_exist = check_record_by_one_param($table,'email_address',$email_address);
        $check_password = check_password($password,$cpassword);

        $check_admin_exist = check_record_by_one_param($table,'added_by',$added_by);

       


         if($check_exist){
                return json_encode(array( "status"=>103, "msg"=>"this record exists" ));
         }

         else if($check_admin_exist == false){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }

         else if($check_password == false){

                return json_encode(array( "status"=>104, "msg"=>"password mismatch found" ));

         }

         else{
                  
                if($first_name == "" || $last_name == "" || $other_name == "" || $mobile_phone_number == "" || $email_address == ""  ||   $permissions_details == "" || $added_by == "" || $status == "" || $password == "" || $cpassword == "" ){

                return json_encode(array( "status"=>101, "msg"=>"empty field(s) found" ));

                }

                else{


                $sql = "INSERT INTO `admin` SET
                `admin_id` = '$admin_id',
                `first_name` = '$first_name',
                `last_name` = '$last_name',
                `other_name` = '$other_name',
                `password` = '$password',
                `mobile_phone_number` = '$mobile_phone_number',
                `email_address` = '$email_address',
                `permissions_details` = '$permissions_details',
                `when_added` = now(),
                `added_by` = '$added_by'
                ";
                $query = mysqli_query($dbc, $sql);
                
               

                if($query){
                  return json_encode(array( "status"=>111, "msg"=>"success" ));
                }else{

                return json_encode(array( "status"=>100, "msg"=>"Something went wrong" ));

                }


                }

         }


        
}




function user_registration($acctno,$bankname,$bvn,$employer_name,$staff_no,$first_name,$last_name,$other_name,$password,$cpassword,$mobile_phone_number,$email_address,$other_details,$channel,$status,$sece_ques,$sece_ans){
       global $dbc;
       //,$pinpass
       
        $acctno = secure_database($acctno);
        $bankname = secure_database($bankname);
        $bvn = secure_database($bvn);
        $employer_name = secure_database($employer_name);
        $staff_no = secure_database($staff_no);
        

        $last_name = secure_database($last_name);
        $other_name = secure_database($other_name);
        $mobile_phone_number = secure_database($mobile_phone_number);
        $email_address = secure_database($email_address);
        //$pinpass = secure_database($pinpass);
        $other_details = secure_database($other_details);
        $channel = secure_database($channel);
        $status = secure_database($status);
        $sece_ques = secure_database($sece_ques);
        $sece_ans = secure_database($sece_ans);
    
        $data = $first_name.$last_name.$email_address;
        $user_id = unique_id_generator($data);
        $table = 'user';
        $password = secure_database($password);
        $password = md5($password);
        $cpassword = secure_database($cpassword);
        $cpassword = md5($cpassword);
      
      
  
        $check_exist = check_record_by_one_param($table,'email_address',$email_address);
        $check_password = check_password($password,$cpassword);


       


         if($check_exist){
                return json_encode(array( "status"=>103, "msg"=>"this record exists" ));
         }

         else if($check_password == false){

                return json_encode(array( "status"=>104, "msg"=>"password mismatch found" ));

         }

         else{
                if( $acctno == "" || $bankname == "" || $bvn == "" || $employer_name == "" || $staff_no == "" ||  $first_name == "" || $last_name == "" || $mobile_phone_number == "" || $email_address == "" || $password == "" ){

                return json_encode(array( "status"=>101, "msg"=>"empty field(s) found" ));

                }

                else{


                $sql = "INSERT INTO `user` SET
                `user_id` = '$user_id',
                `first_name` = '$first_name',
                `last_name` = '$last_name',
                `other_name` = '$other_name',
                `password` = '$password',
                `mobile_phone_number` = '$mobile_phone_number',
                `email_address` = '$email_address',
                `other_details` = '$other_details',
                `when_added` = now(),
                `channel` = '$channel',
                `sece_ques` = '$sece_ques',
                `sece_ans` = '$sece_ans',
                `status` = '$status'
                ";
                $query = mysqli_query($dbc, $sql);
                if($query){

                return json_encode(array( "status"=>111, "msg"=>"success" ));


                }else{

                return json_encode(array( "status"=>100, "msg"=>"Something went wrong" ));

                }


                }

         }


        
}


function insert_audit_log($activity_performed,$who_performed,$ip_address,$url_accessed,$system_name,$before_details,$after_details){
     global $dbc;
       //,$pinpass
       
        $activity_performed = secure_database($activity_performed);
        $who_performed = secure_database($who_performed);
        $ip_address = secure_database($ip_address);
        $url_accessed = secure_database($url_accessed);
        $system_name = secure_database($system_name);
        $before_details = secure_database($before_details);
        $after_details = secure_database($after_details);

              if($activity_performed == "" || $who_performed == "" || $ip_address == "" || $url_accessed == "" || $system_name == ""  ||   $before_details == ""  || $after_details == ""){

                return json_encode(array( "status"=>101, "msg"=>"empty field(s) found" ));

                }

                else{


                $sql = "INSERT INTO `audit_log` SET
                `activity_performed` = '$activity_performed',
                `who_performed` = '$who_performed',
                `ip_address` = '$ip_address',
                `url_accessed` = '$url_accessed',
                `system_name` = '$system_name',
                `before_details` = '$before_details',
                `after_details` = '$after_details',
                `when_performed` = now()
                ";
                $query = mysqli_query($dbc, $sql);
                if($query){

                return json_encode(array( "status"=>111, "msg"=>"success" ));


                }else{

                return json_encode(array( "status"=>100, "msg"=>"Something went wrong" ));

                }


                


         }

                  
      

}

function get_one_row_by_id($table,$param,$id){
    global $dbc;
    $sql = "SELECT * FROM `$table` where `$param`='$id'";
    $query = mysqli_query($dbc,$sql);
    $count = mysqli_num_rows($query);
    if($count > 0){
       $row = mysqli_fetch_array($query);
       return $row;
    }else{
      return null;
    }
}


function view_defaulters($admin_id) {
        global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `defaulter_list` ORDER BY `since_when` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['user_id']);
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                      $array_row = array(

                        'defaulter_id'=>$row['defaulter_id'],
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'since_when'=> $row['since_when'],
                        'amount_owed'=> $row['amnt_owed'],
                        'recovery_level_used'=> $row['recovery_level_used']
                        

                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}


function view_pending_disbursments($admin_id) {
     global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `diss_pend` ORDER BY `when_requested` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['client_id']);
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                      $array_row = array(

                        'disbursement_id'=>$row['diss_id'],
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'when_requested'=> $row['when_requested'],
                        'amount'=> $row['amount'],
                        'disbursement_channel'=> $row['channel_dis'],
                        'expected_repayment'=> $row['expected_repay']
                        

                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}


function view_pend_disb_log($admin_id) {
       global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `diss_pend_log` ORDER BY `when_requested` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['client_id']);
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                      if($row['repaid'] == 0){
                        $repaid = "still on loan";
                        $classified_default = "defaulter";
                      }else{
                        $repaid = "loan fully paid";
                        $classified_default = "good client";

                      }

                      $array_row = array(

                        'disbursement_id'=>$row['diss_id'],
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'when_requested'=> $row['when_requested'],
                        'when_disbursed'=> $row['when_diss'],
                        'who_disbursed'=> $row['who_diss'],
                        'amount'=> $row['amount'],
                        'disbursement_channel'=> $row['channel_dis'],
                        'repayment_status'=> $repaid,
                        'expected_repayment'=> $row['expected_repay'],
                        'expected_repayment_date'=> $row['expected_repay_date'],
                        'classified_default'=> $row['expected_repay_date']
                        

                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}



function view_failed_logins($admin_id) {
        global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `failed_logins` ORDER BY `when_last_login` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['user_id']);
                      // if($get_user != null){

                      // }
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                   

                      $array_row = array(
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'ip_address'=> $row['ip_address'],
                        'when_last_login'=> $row['when_last_login'],
                        'system_name'=> $row['system_name']
                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}

function view_last_logins($admin_id) {
        global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `last_logins` ORDER BY `when_last_login` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['user_id']);
                      // if($get_user != null){

                      // }
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                   

                      $array_row = array(
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'ip_address'=> $row['ip_address'],
                        'when_last_login'=> $row['when_last_login'],
                        'system_name'=> $row['system_name']
                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}



function view_password_log($admin_id) {
         global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `password_log` ORDER BY `when_updated_last` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){


                      $get_user = get_one_row_by_id('user', 'user_id',$row['user_id']);
                      // if($get_user != null){

                      // }
                      $first_name = $get_user['first_name'];
                      $last_name = $get_user['last_name'];
                      $mobile_phone_number = $get_user['mobile_phone_number'];
                      $email_address = $get_user['email_address'];

                   

                      $array_row = array(
                        'first_name'=> $first_name,
                        'last_name'=> $last_name,
                        'phone'=> $mobile_phone_number,
                        'email'=> $email_address,
                        'when_updated_last'=> $row['when_updated_last'],
                        'expiry_date'=> $row['expiry_date']
                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}



function view_clients($admin_id) {
        global $dbc;
        $admin_id = secure_database($admin_id);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false  ){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }else{

              $sql = "SELECT * FROM `user` ORDER BY `when_added` DESC";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    while($row = mysqli_fetch_array($query)){

                      if($row['status'] == 1){
                        $status = "active";
                      }

                      if($row['status'] == 0){
                        $status = "disabled";
                      }

                      if($row['status'] == 2){
                        $status = "suspended";
                      }

                      $array_row = array(
                        'first_name'=> $row['first_name'],
                        'last_name'=> $row['last_name'],
                        'other_name'=> $row['other_name'],
                        'phone'=> $row['mobile_phone_number'],
                        'email'=> $row['email_address'],
                        'other_details'=> $row['other_details'],
                       
                        'channel'=> $row['channel'],
                        'status'=> $status,
                        'secret_question'=> $row['sece_ques'],
                        'secret_answer'=> $row['sece_ans'],
                         'when_added'=> $row['when_added'] 
                      );
                     array_push($array, $array_row);
                      //array_push($array_row);
                    }

                     // return json_encode($array['details']);
                     return json_encode($array);

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }



}


function admin_login($email_address,$password,$ip_address,$system_name){
    global $dbc;
    $password = secure_database($password);
    $ip_address = secure_database($ip_address);
    $system_name = secure_database($system_name);
    $password = md5($password);
     $sql = "SELECT * FROM `admin` where `email_address`='$email_address' AND `password`='$password'";
    $query = mysqli_query($dbc,$sql);
    $count = mysqli_num_rows($query);
    if($count > 0){
      $get_admin = get_one_row_by_id('admin', 'email_address',$email_address);
    

      if($get_admin != null){
        $admin_id = $get_admin['admin_id'];
       //insert last logins
       $check_first = check_record_by_two_params('last_logins','user_id',$admin_id,'user_type',2);

       if($check_first){
        $sql_upll = "UPDATE `last_logins` SET `when_last_login`= now() WHERE `user_type`=2 AND `user_id`='$admin_id'";
           $query_upll = mysqli_query($dbc,$sql_upll);
            if($query_upll){
              return json_encode(array( "status"=>111, "msg"=>"success" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
              }
       }else{

           $sql_ll = "INSERT INTO `last_logins` SET
           `email`='$email_address',
           `user_id`='$admin_id',
           `user_type`= 2,
           `ip_address`='$ip_address',
           `system_name`='$system_name',
           `when_last_login`= now()

           ";
           $query_ll = mysqli_query($dbc,$sql_ll);
            if($query_ll){
              return json_encode(array( "status"=>111, "msg"=>"success" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
              }

       } 

     }else{
         return json_encode(array( "status"=>100, "msg"=>"login failed" ));
     }
       
       
    
    }else{
       
      $get_admin = get_one_row_by_id('admin', 'email_address',$email_address);
    
      if($get_admin != null){
        $admin_id = $get_admin['admin_id'];

       //insert failded logins
        $sql_fl = "INSERT INTO `failed_logins` SET
           `email`='$email_address',
           `user_id`='$admin_id',
           `user_type`= 2,
           `ip_address`='$ip_address',
           `system_name`='$system_name',
           `when_last_login`= now()

           ";
           $query_fl = mysqli_query($dbc,$sql_fl);

           if($query_fl){
              return json_encode(array( "status"=>100, "msg"=>"login failed. username or password incorrect" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));

              }

      } else{

              return json_encode(array( "status"=>100, "msg"=>"login failed" ));


      }


 
    }
}



function user_login($email_address,$password,$ip_address,$system_name){
    global $dbc;
    $password = secure_database($password);
    $ip_address = secure_database($ip_address);
    $system_name = secure_database($system_name);
    $password = md5($password);
     $sql = "SELECT * FROM `user` where `email_address`='$email_address' AND `password`='$password'";
    $query = mysqli_query($dbc,$sql);
    $count = mysqli_num_rows($query);
    if($count > 0){
      $get_user = get_one_row_by_id('user', 'email_address',$email_address);
    

      if($get_user != null){
        $user_id = $get_user['user_id'];
       //insert last logins
       $check_first = check_record_by_two_params('last_logins','user_id',$user_id,'user_type',1);

       if($check_first){
        $sql_upll = "UPDATE `last_logins` SET `when_last_login`= now() WHERE `user_type`=1 AND `user_id`='$user_id'";
           $query_upll = mysqli_query($dbc,$sql_upll);
            if($query_upll){
              return json_encode(array( "status"=>111, "msg"=>"success" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
              }
       }else{

           $sql_ll = "INSERT INTO `last_logins` SET
           `email`='$email_address',
           `user_id`='$user_id',
           `user_type`= 1,
           `ip_address`='$ip_address',
           `system_name`='$system_name',
           `when_last_login`= now()

           ";
           $query_ll = mysqli_query($dbc,$sql_ll);
            if($query_ll){
              return json_encode(array( "status"=>111, "msg"=>"success" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
              }

       } 

     }else{
         return json_encode(array( "status"=>100, "msg"=>"login failed" ));
     }
       
       
    
    }else{
       
      $get_user = get_one_row_by_id('user', 'email_address',$email_address);
    
      if($get_user != null){
        $user_id = $get_user['user_id'];

       //insert failded logins
        $sql_fl = "INSERT INTO `failed_logins` SET
           `email`='$email_address',
           `user_id`='$user_id',
           `user_type`= 1,
           `ip_address`='$ip_address',
           `system_name`='$system_name',
           `when_last_login`= now()

           ";
           $query_fl = mysqli_query($dbc,$sql_fl);

           if($query_fl){
              return json_encode(array( "status"=>100, "msg"=>"login failed. username or password incorrect" ));
              }else{
              return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));

              }

      } else{

              return json_encode(array( "status"=>100, "msg"=>"login failed" ));


      }


 
    }
}


function insert_chat_return_template($message_type,$message,$message_url,$message_image,$who_added){
     global $dbc;
       //,$pinpass
       
        
        $message_type = secure_database($message_type);
        $message = secure_database($message);
        $message_url = secure_database($message_url);
        $message_image = secure_database($message_image);
        $who_added = secure_database($who_added);
        $data = $message_type.$message.$who_added;
        $message_id = unique_id_generator($data);

        $check_admin_exist = check_record_by_one_param('admin','added_by',$who_added);
  
       if($check_admin_exist == false){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }
       
         else  if( $message_type == "" || $message == "" || $message_url == "" || $message_image == ""  ||   $who_added == "" ){

                return json_encode(array( "status"=>101, "msg"=>"empty field(s) found" ));

                }

                else{


                $sql = "INSERT INTO `chat_return_template` SET
                `message_id` = '$message_id',
                `message_type` = '$message_type',
                `message` = '$message',
                `message_url` = '$message_url',
                `message_image` = '$message_image',
                `who_added` = '$who_added',
                `when_added` = now()
                ";
                $query = mysqli_query($dbc, $sql);
                if($query){

                return json_encode(array( "status"=>111, "msg"=>"success" ));


                }else{

                return json_encode(array( "status"=>100, "msg"=>"Something went wrong" ));

                }


                


         }

                  
      

}


//will be more secure later
function user_change_password($email_address,$oldpassword,$newpassword,$cnewpassword){
  global $dbc;
      $curdate = date('Y-m-d H:i:s');
      $plus_20days = date('Y-m-d H:i:s', strtotime('+20 days',strtotime($curdate)));

       $table = 'user';
        $email_address = secure_database($email_address);
        $oldpassword = secure_database($oldpassword);
        $newpassword = secure_database($newpassword);
        $cnewpassword = secure_database($cnewpassword);

        $oldpassword = md5($oldpassword);
        $newpassword = md5($newpassword);
        $cnewpassword = md5($cnewpassword);

        $check = check_record_by_two_params($table,'email_address',$email_address,'password',$oldpassword);
        $check2 = check_record_by_one_param($table,'email_address',$email_address);
        if($check == true and $check2 == true){
           
            $get_rec = get_one_row_by_id($table,'email_address',$email_address);
            $user_id = $get_rec['user_id'];
            if($newpassword == $cnewpassword){

            $sql = "UPDATE `$table` SET `password`='$newpassword' where `email_address`='$email_address' AND `password`='$oldpassword'";
            $query = mysqli_query($dbc,$sql);


          $check_first = check_record_by_two_params('password_log','user_id',$user_id,'user_type',1);
          if($check_first){
                $sql_upll = "UPDATE `password_log` SET `when_updated_last`= '$curdate',`expiry_date`='$plus_20days' WHERE `user_type`=1 AND `user_id`='$user_id'";
                   $query_upll = mysqli_query($dbc,$sql_upll);
                    if($query_upll){
                      return json_encode(array( "status"=>111, "msg"=>"success, password valid for 20 days" ));
                      }else{
                      return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
                      }
               }else{

                   $sql_ll = "INSERT INTO `password_log` SET
                 
                   `user_id`='$user_id',
                   `user_type`= 1,
                   `when_updated_last`= now(),
                   `expiry_date`= '$plus_20days'

                   ";
                   $query_ll = mysqli_query($dbc,$sql_ll);
                    if($query_ll){
                      return json_encode(array( "status"=>111, "msg"=>"success, password valid for 20 days" ));
                      }else{
                      return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
                      }

               } 


            }else{
                return json_encode(array("status"=>100,"msg"=>"password mismatch"));
            }

        }

  else{
                return json_encode(array( "status"=>100, "msg"=> "no traceable record" ));
   
    }

}


function admin_change_password($email_address,$oldpassword,$newpassword,$cnewpassword){
  global $dbc;
        $curdate = date('Y-m-d H:i:s');
         $plus_20days = date('Y-m-d H:i:s', strtotime('+20 days',strtotime($curdate)));
  
       $table = 'admin';
        $email_address = secure_database($email_address);
        $oldpassword = secure_database($oldpassword);
        $newpassword = secure_database($newpassword);
        $cnewpassword = secure_database($cnewpassword);

        $oldpassword = md5($oldpassword);
        $newpassword = md5($newpassword);
        $cnewpassword = md5($cnewpassword);

        $check = check_record_by_two_params($table,'email_address',$email_address,'password',$oldpassword);
        $check2 = check_record_by_one_param($table,'email_address',$email_address);
        if($check == true and $check2 == true){
           
            $get_rec = get_one_row_by_id($table,'email_address',$email_address);
            $admin_id = $get_rec['admin_id'];
            if($newpassword == $cnewpassword){

            $sql = "UPDATE `$table` SET `password`='$newpassword' where `email_address`='$email_address' AND `password`='$oldpassword'";
            $query = mysqli_query($dbc,$sql);


          $check_first = check_record_by_two_params('password_log','user_id',$admin_id,'user_type',2);
          if($check_first){
                $sql_upll = "UPDATE `password_log` SET `when_updated_last`= '$curdate',`expiry_date`='$plus_20days' WHERE `user_type`=1 AND `user_id`='$admin_id'";
                   $query_upll = mysqli_query($dbc,$sql_upll);
                    if($query_upll){
                      return json_encode(array( "status"=>111, "msg"=>"success, password valid for 20 days" ));
                      }else{
                      return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
                      }
               }else{

                   $sql_ll = "INSERT INTO `password_log` SET
                 
                   `user_id`='$admin_id',
                   `user_type`= 2,
                   `when_updated_last`= now(),
                   `expiry_date`= '$plus_20days'

                   ";
                   $query_ll = mysqli_query($dbc,$sql_ll);
                    if($query_ll){
                      return json_encode(array( "status"=>111, "msg"=>"success, password valid for 20 days" ));
                      }else{
                      return json_encode(array( "status"=>100, "msg"=>"something went wrong" ));
                      }

               } 


            }else{
                return json_encode(array("status"=>100,"msg"=>"password mismatch"));
            }

        }

  else{
                return json_encode(array( "status"=>100, "msg"=> "no traceable record" ));
   
    }

}


function view_single_client($admin_id,$uemail_address){
      global $dbc;
        $admin_id = secure_database($admin_id);     
        $uemail_address = secure_database($uemail_address);     
        $check_admin_exist = check_record_by_one_param('admin','added_by',$admin_id);
        $check_admin_exist2 = check_record_by_one_param('admin','admin_id',$admin_id);
        $check_client_exist = check_record_by_one_param('user','email_address',$uemail_address);
        $array= array();


       if($check_admin_exist == false  AND  $check_admin_exist2 == false){

                return json_encode(array( "status"=>105, "msg"=>"you are not authorized!" ));

         }

         else if($check_client_exist == false){

                return json_encode(array( "status"=>105, "msg"=>"client does not exist!" ));

         }

         else{

              $sql = "SELECT * FROM `user` where `email_address`='$uemail_address'";
              $query = mysqli_query($dbc,$sql);
              $count = mysqli_num_rows($query);
              if($count > 0){
                    $row = mysqli_fetch_array($query);


                      if($row['status'] == 1){
                        $status = "active";
                      }

                      if($row['status'] == 0){
                        $status = "disabled";
                      }

                      if($row['status'] == 2){
                        $status = "suspended";
                      }

                    $array_row = array(
                        'first_name'=> $row['first_name'],
                        'last_name'=> $row['last_name'],
                        'other_name'=> $row['other_name'],
                        'phone'=> $row['mobile_phone_number'],
                        'email'=> $row['email_address'],
                        'other_details'=> $row['other_details'],
                       
                        'channel'=> $row['channel'],
                        'status'=> $status,
                        'secret_question'=> $row['sece_ques'],
                        'secret_answer'=> $row['sece_ans'],
                         'when_added'=> $row['when_added'] 
                      );
                     array_push($array, $array_row);
                     return json_encode($array);
                    //return json_encode(array('status'=>111,"msg"=>json_encode($array)));

              }else{

                     return json_encode(array( "status"=>106, "msg"=>"no record found" ));

              }



         }


}



//////////////////////////////not needed for now
