<?php
//namespace MRBS;
//include 'generatepdf.php';
require_once('simple_html_dom.php');
session_start();
$i = 0;


require_once ('TCPDF-master/examples/tcpdf_include.php');

//$var = "<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\">";
//$var .= $html;
//$var .= "</table>";

$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('Rohit Khole');
$pdf->SetAuthor('MRBS Admin');
$pdf->SetTitle('MRBS Report');
$pdf->SetSubject('Report');

// set default header data
$pdf->SetHeaderData('coep_logo.png',19, 'College of Engineering, Pune', 'An Autonomous Institute of Government of Maharashtra');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);



// add a page
$pdf->AddPage();
$pdf->SetFont('helvetica', 'B', 20);

$pdf->Write(0, 'Report on events', '', 0, 'C', true, 0, false, false, 0);

$pdf->SetFont('dejavusans', '', 10);
//$pdf->writeHTML($var, true, false, true, false, '');
$html = <<<EOF
<!DOCTYPE html>
<html>
<head>
<title>MRBS Report</title>
</head>
<body>
EOF;

$selected = $_POST['checkboxarr'];

if($selected != "") {
$html .= <<<EOF
<div id="report_output" class="datatable_container">
<table class="admin_table display" id="customers report_table" cellspacing="0" cellpadding="1" border="1">
<thead>
<tr class = "even">
EOF;

    $options = explode(" ", $selected);

    //echo htmlspecialchars($_POST['html']);

    $content = str_get_html($_POST['html']);


    $element = $content->find('th');
    foreach ($element as $i1) {
        $html .= $i1;
        // echo htmlspecialchars($i1);
    }

    $html .= <<<EOF
</tr>
</thead>
<tbody>
EOF;

    foreach ($options as $opt) {
        //echo $opt;

        $element = $content->find('#' . $opt);

        foreach ($element as $i2) {
            //echo $i2;
            $html .= $i2;
            //break;
            // echo htmlspecialchars($i);
        }

    }
}
else {
    $html .= $_POST['html'];
}

$html .= <<<EOF
</tbody>
</table>
</body>
</html>
EOF;

//echo $html;

$html = '<style>'.file_get_contents('/var/www/html/event_calendar/css/mrbs-pdf.css').'</style>'.$html;

$pdf->writeHTML($html, true, false, false, false, '');

$pdf->Output('report.pdf', 'I');

