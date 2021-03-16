<?php require_once('config/validations.php');
    //echo pulling_json();
    $array = array(
    'status'=>true,
    'message'=> 'BVN resolved',
    'data'=> array(
        "first_name"=> "OLUSOLA",
        "last_name"=> "ADEBUNMI",
        "dob"=> "03-Sep-58",
        "formatted_dob"=> "1950-08-03",
        "mobile"=> "08168509044",
        "bvn"=> "22225553718"
    ),
    'meta'=>array(
        "calls_this_month"=> 3,
        "free_calls_left"=> 7
    )
   );


    
     $encode = json_encode($array);
    
    //echo $encode['status'];

    $decode = json_decode($encode,true);
    //$decode = json_decode($encode,JSON_FORCE_OBJECT);
    echo  $encoded_data =  strtolower($decode['meta']['calls_this_month']);
    //echo  $encoded_data =  $decode->first_name;
    
    //$decode_data = json_decode($encoded_data,true);
    //echo $decode_data['first_name'];
?>