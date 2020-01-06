<?php 
@session_start();
if(!empty($_SESSION["nombre"]) || !empty($_SESSION["ID"])) 
{ 
?>
<!DOCTYPE html>
<html>

<head>
	<title> Tira de materias de <?php $nombre=$_GET["nombre"]; echo $nombre; ?></title>
</head>
    <style type="text/css" >

 	.table{

    text-decoration: none;
    padding: 10px;
    font-weight: 200;
    font-size: 20px;
    color: #ffffff;
    background-color: #000000;
    border-radius: 6px;
    border: 2px;
    position: absolute;
     left: 30%;
}
input[type=submit]{


  width: 220px;
  height: 30px;
  border-radius: 20px;
  margin:0 auto;
  border: 0px;
  background-color: #32A43E;
  font: 20px normal normal uppercase helvetica, arial, serif;
      position: absolute;

     left: 30%;

}
.boton{
    text-decoration: none;
    padding: 10px;
    font-weight: 200;
    font-size: 25px;
    color: #ffffff;
    background-color: #000000;
    border-radius: 6px;
    border: 2px;
    position: absolute;
     top: 32%;
     left: 30%;

}
   .boton:hover{
    color: #000000;
    background-color: #ffffff;
    border: 2px solid #000000;
  }

 body {
background: url(FONDO2.jpg) no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
font-family: Georgia, "Times New Roman",
          Times, serif;
    color: white;
   }
  </style>

</head>

<body>
<?php 
$conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
mysqli_query($conectar,"SET NAMES 'utf8'");
$Mat=$_POST["Mat"]; 
$N=  $_SESSION['nombre'];
$Mtr=$_SESSION['ID'] ;

$sql="select asignatura.id_asignatura, asignatura.nombre, alumno.nombre, alumno.apellido_paterno, alumno.apellido_materno, calificacion.registro, calificacion.calificacion from asignatura inner join calificacion on asignatura.id_asignatura = calificacion.id_asignatura inner join docente on docente.id_docente = calificacion.nomina inner join alumno on calificacion.registro = alumno.registro where docente.id_docente = $Mtr and calificacion.id_asignatura = '$Mat';";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {
      $Mn=$row[1];
      }

?>

<!-- Contenido principal -->
<h1 style="text-align: center;"><span style="background-color: #0074FF; color: #ffffff; font-size: 30px;"><img src="logo_sep.png" width="141" height="149" />Calificaciones de <?php echo $Mn ?><img src="logo_ceti.png" width="192" height="148" /></span></h1>

<br>
<?php
echo"<a class='boton' href='CalDoc_slc.php?nombre=$N&ID=$Mtr'><u>Regresar</u></a>";
?>
<br>
<h3>
<form name="Registro" method="POST" action="act_doc_cal.php" >
<input type=hidden name="Mat" value="<?php echo $Mat; ?>">

<div class="table">
   <table border="1" style="margin: 0 auto;">
    <tr>
      <td>Alumnos</td>
      <td>Registro</td>
      <td>Calificación</td>
    </tr>
        <?php
    
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {

    ?>
    <tr>
      <td><?php echo $row[2]." ".$row[3]." ".$row[4]; ?></td>
      <td><?php echo $row[5]?></td>
      <td><input type="text" name="<?php echo $row[5]?>" value = "<?php echo $row[6]?>" required></input></td>
    </tr>
    
    <?php
    }
    ?>
  </table>
<br>
<input type="submit" value="Cambiar Calificaciones">
<br>
</div>
</form>
</h3>

</body>
</html>
<?php
}else
{
    header("Location: LoginPrin.html");
    exit;
}
?>