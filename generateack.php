<?php
namespace MRBS;

require "defaultincludes.inc";

//vars to be displayed
$html = "";

//require_once ('TCPDF-master/examples/tcpdf_include.php');

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends \TCPDF {

    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'coep_logo.png';
        $this->Image($image_file, 20, 10, 25, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        // Set font
        $this->SetFont('helvetica', 'B', 20);
        // Title
        $this->Cell(0, 10, 'College of Engineering, Pune', 0, false, 'L', 0, '', 0, false, 'M', 'M');

    }
}


// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);



//$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('Event Calendar');
$pdf->SetAuthor('MRBS Admin');
$pdf->SetTitle('MRBS Acknowledgement');
$pdf->SetSubject('Acknowledgement');

// set default header data
$pdf->SetHeaderData('coep_logo.png',19, 'College of Engineering, Pune', 'An autonomous institute of Government of maharashtra');


// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', 20/* PDF_FONT_SIZE_MAIN*/));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

//$pdf->SetHeaderData('',19, '', 'An Autonomous institute of Government of Maharashtra');
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


$pdf->SetFont('helvetica', 'B', 10);

$txt = <<<EOD
An Autonomous institute of Government of Maharashtra
EOD;


// print a block of text using Write()
$pdf->Write(0, $txt, '', 0, 'C', true, 0, false, false, 0);

$txt = "\n\n\n\n";
$pdf->Write(0, $txt, '', 0, 'C', true, 0, false, false, 0);

$txt = "<hr>";

$pdf->writeHTML($txt, true, false, false, false, '');

$pdf->SetFont('helvetica', 'B', 20);

$pdf->Write(0, 'Acknowledgement', '', 0, 'C', true, 0, false, false, 0);

$pdf->SetFont('dejavusans', '', 15);


$pdf->writeHTML($html, true, false, false, false, '');


$name = $_GET["name"];
$club_name = $_GET["club_name"];
$description = $_GET["description"];
$students_attended = $_GET["students_attended"];
$location = $_GET["location"];
$start_time = $_GET["start_time"];
$end_time = $_GET["end_time"];


$html = "<p>This is to acknowledge that the event ". $name. " by club/Team ". $club_name ." was conducted successfully in ". $location ." from ". $start_time." to ". $end_time." . </p>
<br><br><p>Event Description: ". $description. "</p>
<br><br><p>No of students attended: ". $students_attended . "</p>";
// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

$html = <<<EOD
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<hr>
<p>
<table>
<tr>
<td>Student Secretary</td>
<td>Faculty Advisor</td>
<td>Dean Student Affairs / V.P. Gymkhana</td>
</tr>
</table>
</p>
EOD;
// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);



ob_end_clean();
$pdf->Output('acknowledgement.pdf', 'D');


