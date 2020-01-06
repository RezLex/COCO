  <?php

require 'fpdf/fpdf.php';

    $registro=$_GET["re"];
    $MT = $_GET["MT"];
    $MTr = $_GET["MTa"];
  
  class PDF extends FPDF
  {
    function Header()
    {
      $this->Image('logo_ceti.png', 5, 5, 30 );
      $this->SetFont('Arial','B',15);
      $this->Cell(30);
      $this->Cell(120,10, 'Reporte De Alumnos',0,0,'C');
      $this->Ln(20);
    }
    
    function Footer()
    {
      $this->SetY(-15);
      $this->SetFont('Arial','I', 8);
      $this->Cell(0,10, 'Pagina '.$this->PageNo().'/{nb}',0,0,'C' );
    }   
  }


    $pdf = new PDF();
    $pdf->AliasNbPages();
    $pdf->AddPage();
    $pdf->Ln(5);


  $conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
  mysqli_query($conectar,"SET NAMES 'utf8'");

    $sql="Select nombre, apellido_paterno, apellido_materno from docente where id_docente = $registro";
     
    $res=mysqli_query($conectar,$sql);

    while($row=mysqli_fetch_array($res))
    {
      $pdf->SetFont('Arial','B',12);
      $pdf->Cell(20,6,'Docente: ',0,0,'');
      $pdf->SetFont('Arial','',12);
      $pdf->Cell(80,6,utf8_decode($row[0]).' '.utf8_decode($row[1]).' '.utf8_decode($row[2]),0,0,'');
      $pdf->Ln(7);

    }

    $pdf->SetFont('Arial','B',12);
    $pdf->Cell(26,6,'Asignatura: ',0,0,'');
    $pdf->SetFont('Arial','',12);
    $pdf->Cell(80,6,utf8_decode($MT),0,0,'');
    $pdf->Ln(10);


    $pdf->SetFillColor(232,232,232);
    $pdf->SetFont('Arial','B',12);
    $pdf->Cell(70,6,utf8_decode('Alumno'),1,0,'C',1);
    $pdf->Cell(40,6,utf8_decode('Registro'),1,0,'C',1);
    $pdf->Cell(70,6,utf8_decode('Calificación'),1,1,'C',1);
    $pdf->SetFont('Arial','',10);

    $sql="select asignatura.id_asignatura, asignatura.nombre, alumno.nombre, alumno.apellido_paterno, alumno.apellido_materno, calificacion.registro, calificacion.calificacion from asignatura inner join calificacion on asignatura.id_asignatura = calificacion.id_asignatura inner join docente on docente.id_docente = calificacion.nomina inner join alumno on calificacion.registro = alumno.registro where docente.id_docente = $registro and calificacion.id_asignatura = '$MTr'";
    $res=mysqli_query($conectar,$sql);

    while($row=mysqli_fetch_array($res))
    {
      $pdf->Cell(70,6,utf8_decode($row[2]).' '.utf8_decode($row[3]).' '.utf8_decode($row[4]),1,0,'');
      $pdf->Cell(40,6,utf8_decode($row[5]),1,0,'C');
      $pdf->Cell(70,6,utf8_decode($row[6]),1,1,'C');
    }
    $pdf->Output('Reporte.pdf','D');
?>