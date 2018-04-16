<?php
namespace MRBS;

// Handles actions on bookings awaiting approval

require "defaultincludes.inc";
require_once "mrbs_sql.inc";
require_once "functions_mail.inc";


function GetImageExtension($imagetype)
	     {
	       if(empty($imagetype)) return false;
	       switch($imagetype)
	       {
	           case 'image/bmp': return '.bmp';
	           case 'image/gif': return '.gif';
	           case 'image/jpeg': return '.jpg';
	           case 'image/png': return '.png';
	           default: return false;
	       }
	     }
// Get non-standard form variables
$id = get_form_var('id', 'int');
$students = get_form_var('students', 'int');
$report = get_form_var('report', 'string');
$returl = get_form_var('returl', 'string');


$total = count($_FILES['upload']['name']);

$dir_name = "upload/".$id;

$oldmask = umask(0);
mkdir($dir_name, 0777);
umask($oldmask);

for($i=0; $i<$total; $i++) {

    $tmpFilePath = $_FILES['upload']['tmp_name'][$i];
    $imgtype=$_FILES["upload"]["type"][$i];
    $ext= GetImageExtension($imgtype);


    if ($tmpFilePath != ""){

        $imagename=($i+1).".png";
        $target_path = $dir_name."/".$imagename;

        if(move_uploaded_file($tmpFilePath, $target_path)) {



        }
        else{
            echo "Error While uploading image on the server";
        }
    }
}
update_status_info($id, $students, $report, $dir_name);

/*if (!empty($_FILES["image"]["name"])) {
    $file_name=$_FILES["image"]["name"];
    $temp_name=$_FILES["image"]["tmp_name"];
    $imgtype=$_FILES["image"]["type"];
    $ext= GetImageExtension($imgtype);
    $imagename=date("d-m-Y")."-".time().$ext;
    $target_path = "upload/".$imagename;


	if(move_uploaded_file($temp_name, $target_path)) {
        update_status_info($id, $students, $report, $target_path);


    }else{
	   echo "Error While uploading image on the server";
	}
}*/
$result = get_ack_variables($id);

// Give the return URL a query string if it doesn't already have one
if (strpos($returl,     '?') === FALSE)
{
    $returl .= "?year=$year&month=$month&day=$day&area=$area&room=$room";
}

header("Location: generateack.php?name=$result[0]&club_name=$result[1]&description=$result[2]&students_attended=$result[3]&location=$result[4]&start_time=$result[5]&end_time=$result[6]");
//header("Location:" . $returl);
exit;
