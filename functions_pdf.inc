<?php
namespace MRBS;

require_once "defaultincludes.inc";

class MYPDF extends \TCPDF {
    public function Header() {
        //Change path K_PATH_IMAGES to point at <project root>/images
        //Logo
        $image_file = K_PATH_IMAGES . '../../../images/coeplogo.png';
        $this->Image($image_file, 20, 10, 25, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

        //Set font
        $this->SetFont('helvetica', 'B', 20);

        //Title
        $this->Cell(0, 10, 'College of Engineering, Pune', 0, false, 'L', 0, '', 0, false, 'M', 'M');

    }
}

//Generate report
function generate_report ($html) {
    $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // set document information
    $pdf->SetCreator('Event Calendar');
    $pdf->SetAuthor('MRBS Admin');
    $pdf->SetTitle('MRBS Report');
    $pdf->SetSubject('Report');

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
    $pdf->writeHTML($html, true, false, false, false, '');
    $pdf->Output('Report.pdf', 'I');
}

?>

