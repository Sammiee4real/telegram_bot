<?php $sms_sender_id = 'CloudWare';//values in this script should be changed by app configureation
$app_domain = $_SERVER['HTTP_HOST'];
$app_name = 'Whatsapp Lending';
$app_slug = 'whatsapp_lending';
$app_link = $_SERVER['HTTP_HOST'];
$app_domain_root= $_SERVER['HTTP_HOST'];
date_default_timezone_set('Africa/Lagos');
//set timezone
$report_dir = "report/";
$report_pre_fix = 'report';

//NB: Expiry date is in days
$expiry_date = "60";

//Country code: NB: Should be a string
$country_code = "234";

//paystack secret testkey
$secret_key = 'sk_live_3811f301276c2252058b122991a6d3a92fb2c6bc';

//sms for 156
$senderid = "IMPORTANT";
$developerid = 62668735;
$cloud_sms_password = "pass4156credit%%";


//sms for samuel
// $senderid = "IMPORTANT";
// $developerid = 92814362;
// $cloud_sms_password = "pass4adebunmi%";



?>
