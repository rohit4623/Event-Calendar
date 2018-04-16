<?php
namespace MRBS;

// Handles actions on bookings awaiting approval

require "defaultincludes.inc";
require_once "mrbs_sql.inc";
require_once "functions_mail.inc";

print_header($day, $month, $year, $area, isset($room) ? $room : "");

$id = get_form_var('id', 'int');

echo "<form class=\"form_general\" id=\"form_datacollect\" action=\"save_info.php\" method=\"post\" enctype=\"multipart/form-data\" target=\"_blank\"> <fieldset>";
echo "<legend>Event Report</legend>";
echo "<div>";
echo "<label for=\"students\">No.of students attended: </label>"."<input type=\"text\" name=\"students\"required></div>";
echo "<div>";
echo "<label for=\"report\">Report on Event: </label>";
echo "<textarea type=\"text\" rows=\"10\" cols = \"50\" name=\"report\" required></textarea>";
echo "</div><div>";
echo "<label for=\"image\">Upload event image: </label>";
echo "<input type=\"file\" name=\"upload[]\" id=\"image\" multiple=\"multiple\">";
echo "</div>";

echo "<input type=\"hidden\" name=\"id\" value=\"" . $id . "\">\n";
echo "<input type=\"hidden\" name=\"returl\" value=\"" . $returl . "\"><br>";
echo "<input type=\"submit\" value=\"" . "Upload Information". "\">\n";
echo "</fieldset>";
echo "</form>\n";

output_trailer();
header('Location: statuspending.php');
?>
