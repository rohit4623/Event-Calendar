<?php
namespace MRBS;

require "defaultincludes.inc";
function display_buttons($row, $is_series)
{
    global $user, $reminders_enabled, $reminder_interval;

    $last_reminded = (empty($row['reminded'])) ? $row['last_updated'] : $row['reminded'];
    $returl = this_page();

    $target_id = ($is_series) ? $row['repeat_id'] : $row['id'];

    // When we're going to view_entry.php we need to pass the id and series
    // in a query string rather than as hidden inputs.   That's because some
    // pages called by view_entry use HTTP_REFERER to form a return URL, and
    // view_entry needs to have a valid id.
    $query_string = "id=$target_id";
    $query_string .= ($is_series) ? "&amp;series=1" : "";

    //Change show upload button inspite of user level
        // get the area settings for this room
        get_area_settings(get_area($row['room_id']));
        // if enough time has passed since the last reminder
        // output a "upload" button, otherwise nothing
        /*if ($reminders_enabled  &&
            (working_time_diff(time(), $last_reminded) >= $reminder_interval))
        {*/
            echo "<form action=\"status_update_form.php\" method=\"get\">\n";
            echo "<div>\n";
            echo "<input type=\"hidden\" name=\"id\" value=\"" . $row['id'] . "\">\n";
            echo "<input type=\"submit\" value=\"" . "Upload". "\">\n";
            echo "</div>\n";
            echo "</form>\n";  //Change Changed submit style to get
        /*}
        else
        {
            echo "&nbsp";
        }*/
//    }
}


function display_table_head()
{
    echo "<thead>\n";
    echo "<tr>\n";
    // We give some columns a type data value so that the JavaScript knows how to sort them
    echo "<th class=\"control\">&nbsp;</th>\n";
    echo "<th class=\"header_name\">" . get_vocab("entry") . "</th>\n";
    echo "<th class=\"header_create\">" . get_vocab("createdby") . "</th>\n";
    echo "<th class=\"header_area\">" . get_vocab("area") . "</th>\n";
    echo "<th class=\"header_room\">" . get_vocab("room") . "</th>\n";
    echo "<th class=\"header_start_time\"><span class=\"normal\" data-type=\"title-numeric\">" . get_vocab("start_date") . "</span></th>\n";
    echo "<th class=\"header_action\">" . get_vocab("action") . "</th>\n";
    echo "</tr>\n";
    echo "</thead>\n";
}

// display the table head for a subtable
function display_subtable_head($row)
{
    echo "<thead>\n";
    echo "<tr>\n";
    // We give some columns a type data value so that the JavaScript knows how to sort them
    echo "<th class=\"control\">&nbsp;</th>\n";
    // reservation name, with a link to the view_entry page
    echo "<th><a href=\"view_entry.php?id=".$row['repeat_id']."&amp;series=1\">" . htmlspecialchars($row['name']) ."</a></th>\n";

    // create_by, area and room names
    echo "<th>" . htmlspecialchars($row['create_by']) . "</th>\n";
    echo "<th>"   . htmlspecialchars($row['area_name']) . "</th>\n";
    echo "<th>"   . htmlspecialchars($row['room_name']) . "</th>\n";

    echo "<th><span class=\"normal\" data-type=\"title-numeric\">" . get_vocab("series") . "</span></th>\n";

    echo "<th>&nbsp;</th>\n";
    echo "</tr>\n";
    echo "</thead>\n";
}


// display the title row for a series
function display_series_title_row($row)
{
    echo "<tr id=\"row_" . $row['repeat_id'] . "\">\n";
    echo "<td class=\"control\">&nbsp;</td>\n";
    // reservation name, with a link to the view_entry page
    echo "<td><a href=\"view_entry.php?id=".$row['repeat_id']."&amp;series=1\">" . htmlspecialchars($row['name']) ."</a></td>\n";

    // create_by, area and room names
    echo "<td>" . htmlspecialchars($row['create_by']) . "</td>\n";
    echo "<td>"   . htmlspecialchars($row['area_name']) . "</td>\n";
    echo "<td>"   . htmlspecialchars($row['room_name']) . "</td>\n";

    echo "<td>";
    // <span> for sorting
    echo "<span title=\"" . $row['start_time'] . "\"></span>";
    echo get_vocab("series");
    echo "</td>\n";

    echo "<td>\n";
    display_buttons($row, TRUE);
    echo "</td>\n";
    echo "</tr>\n";
}

// display an entry in a row
function display_entry_row($row,$flag)
{
    echo "<tr>\n";
    echo "<td>&nbsp;</td>\n";

    // reservation name, with a link to the view_entry page
    echo "<td>";
    echo "<a href=\"view_entry.php?id=" . $row['id'] . "\">" . htmlspecialchars($row['name']) . "</a></td>\n";

    // create_by, area and room names
    echo "<td>" . htmlspecialchars($row['create_by']) . "</td>\n";
    echo "<td>" . htmlspecialchars($row['area_name']) . "</td>\n";
    echo "<td>" . htmlspecialchars($row['room_name']) . "</td>\n";

    // start date, with a link to the day.php
    $link = getdate($row['start_time']);
    echo "<td>";
    // <span> for sorting
    echo "<span title=\"" . $row['start_time'] . "\"></span>";
    echo "<a href=\"day.php?day=$link[mday]&amp;month=$link[mon]&amp;year=$link[year]&amp;area=" . $row['area_id'] . "\">";
    if (empty($row['enable_periods'])) {
        $link_str = time_date_string($row['start_time']);
    } else {
        list(, $link_str) = period_date_string($row['start_time']);
    }
    echo "$link_str</a></td>";

    // action buttons
    if ($flag) {
        echo "<td>\n";
        display_buttons($row, FALSE);
        echo "</td>\n";
    }
    else{
        echo "<td>\n";
        echo "COMPLETE";
        echo "</td>\n";
    }

    echo "</tr>\n";
}


// Check the user is authorised for this page
checkAuthorised();

// Also need to know whether they have admin rights
$user = getUserName();
$is_admin = (authGetUserLevel($user) >= 2);

print_header($day, $month, $year, $area, isset($room) ? $room : "");

echo "<h1>" . "Status Update Pending" . "</h1>\n";

// Get a list of all bookings awaiting approval
// We are only interested in areas where approval is required

//$sql_approval_enabled = some_area_predicate('approval_enabled');

echo "<h3>" . "Status Update Completed Events" . "</h3>\n";
$sql = "SELECT E.id, E.name, E.room_id, E.start_time, E.create_by, " .
    db()->syntax_timestamp_to_unix("E.timestamp") . " AS last_updated,
               E.reminded, E.repeat_id,
               M.room_name, M.area_id, A.area_name, A.enable_periods,
               E.info_time AS entry_info_time, E.info_user AS entry_info_user,
               T.info_time AS repeat_info_time, T.info_user AS repeat_info_user
          FROM $tbl_room AS M, $tbl_area AS A, $tbl_entry AS E
     LEFT JOIN $tbl_repeat AS T ON E.repeat_id=T.id
         WHERE E.room_id = M.id
           AND M.area_id = A.id
           AND M.disabled = 0
           AND A.disabled = 0
           AND E.students_attended IS NOT NULL";

$sql_params = array();

// Ordinary users can only see their own bookings
/*if (!$is_admin)
{*/				// All users can see only their bookings
$sql .= " AND E.create_by=?";
$sql_params[] = $user;
//}				Change
// We want entries for a series to appear together so that we can display
// them as a separate table below the main entry for the series.
$sql .= " ORDER BY repeat_id, start_time";

$res = db()->query($sql, $sql_params);

if ($res->count() == 0)
{

}
else  // display them in a table
{
    echo "<div id=\"pending_list\" class=\"datatable_container\">\n";
    echo "<table id=\"pending_table\" class=\"admin_table display\">\n";
    display_table_head();

    echo "<tbody>\n";
    $last_repeat_id = NULL;
    $is_series = FALSE;
    for ($i = 0; ($row = $res->row_keyed($i)); $i++)
    {
        display_entry_row($row,0);
    }
    echo "</tbody>\n";
    echo "</table>\n";
    echo "</div>\n";
}

echo "<h3>" . "Status Update Pending Events" . "</h3>\n";
$sql = "SELECT E.id, E.name, E.room_id, E.start_time, E.create_by, " .
    db()->syntax_timestamp_to_unix("E.timestamp") . " AS last_updated,
               E.reminded, E.repeat_id,
               M.room_name, M.area_id, A.area_name, A.enable_periods,
               E.info_time AS entry_info_time, E.info_user AS entry_info_user,
               T.info_time AS repeat_info_time, T.info_user AS repeat_info_user
          FROM $tbl_room AS M, $tbl_area AS A, $tbl_entry AS E
     LEFT JOIN $tbl_repeat AS T ON E.repeat_id=T.id
         WHERE E.room_id = M.id
           AND M.area_id = A.id
           AND M.disabled = 0
           AND A.disabled = 0
           AND (E.status&" . STATUS_COMPLETE . " != 0)";

$sql_params = array();

// Ordinary users can only see their own bookings       
/*if (!$is_admin)
{*/				// All users can see only their bookings
    $sql .= " AND E.create_by=?";
    $sql_params[] = $user;
//}				Change
// We want entries for a series to appear together so that we can display
// them as a separate table below the main entry for the series. 
$sql .= " ORDER BY repeat_id, start_time";

$res = db()->query($sql, $sql_params);

if ($res->count() == 0)
{
    echo "<p>" . "You have no status update pending" . "</p>\n";
}
else  // display them in a table
{
    echo "<div id=\"pending_list\" class=\"datatable_container\">\n";
    echo "<table id=\"pending_table\" class=\"admin_table display\">\n";
    display_table_head();

    echo "<tbody>\n";
    $last_repeat_id = NULL;
    $is_series = FALSE;
    for ($i = 0; ($row = $res->row_keyed($i)); $i++)
    {
        display_entry_row($row,1);
    }
    echo "</tbody>\n";
    echo "</table>\n";
    echo "</div>\n";
}

output_trailer();

