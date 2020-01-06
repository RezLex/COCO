  <?php

require 'fpdf/fpdf.php';

    $registro=$_GET["re"];
  
  class PDF extends FPDF
  {
    function Header()
    {
      $this->Image('logo_ceti.png', 5, 5, 30 );
      $this->SetFont('Arial','B',15);
      $this->Cell(30);
      $this->Cell(120,10, 'Reporte De Calificaciones',0,0,'C');
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

  $conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
  mysqli_query($conectar,"SET NAMES 'utf8'");

    $sql="Select alumno.nombre, alumno.apellido_paterno, alumno.apellido_materno, alumno.registro, carrera.nombre, alumno.celular, alumno.sexo, alumno.domicilio, municipio.nombre from alumno inner join municipio on alumno.clave_municipio = municipio.clave_municipio inner join carrera on alumno.id_carrera = carrera.id_carrera where alumno.registro = $registro";
     
    $res=mysqli_query($conectar,$sql);

    while($row=mysqli_fetch_array($res))
    {
      $pdf->SetFont('Arial','B',12);
      $pdf->Cell(20,6,'Nombre: ',0,0,'');
      $pdf->SetFont('Arial','',12);
      $pdf->Cell(80,6,utf8_decode($row[0]).' '.utf8_decode($row[1]).' '.utf8_decode($row[2]),0,0,'');
      $pdf->Ln(7);

      $pdf->SetFont('Arial','B',12);
      $pdf->Cell(20,6,'Registro: ',0,0,'');
      $pdf->SetFont('Arial','',12);
      $pdf->Cell(80,6,utf8_decode($row[3]),0,0,'');
      $pdf->Ln(7);

      $pdf->SetFont('Arial','B',12);
      $pdf->Cell(20,6,'Carrera: ',0,0,'');
      $pdf->SetFont('Arial','',12);
      $pdf->Cell(80,6,utf8_decode($row[4]),0,0,'');
      $pdf->Ln(20);

    }

    $pdf->SetFillColor(232,232,232);
    $pdf->SetFont('Arial','B',12);
    $pdf->Cell(70,6,'Asignatura',1,0,'C',1);
    $pdf->Cell(40,6,utf8_decode('Calificación'),1,0,'C',1);
    $pdf->Cell(70,6,'Periodo',1,1,'C',1);
    $pdf->SetFont('Arial','',10);

    $sql="Select asignatura.nombre, calificacion.calificacion, calificacion.periodo from calificacion inner join asignatura on asignatura.id_asignatura = calificacion.id_asignatura where calificacion.registro = $registro";
    $res=mysqli_query($conectar,$sql);

    while($row=mysqli_fetch_array($res))
    {
      $pdf->Cell(70,6,utf8_decode($row['nombre']),1,0,'');
      $pdf->Cell(40,6,utf8_decode($row['calificacion']),1,0,'C');
      $pdf->Cell(70,6,utf8_decode($row['periodo']),1,1,'C');
    }
    $pdf->Output('Reporte.pdf','D');
?>