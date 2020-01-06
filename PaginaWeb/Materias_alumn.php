<?php 
@session_start();
if(!empty($_SESSION["nombre"]) || !empty($_SESSION["registro"])) 
{ 
?>
<!DOCTYPE html>
<html>

<head>
	<title> Tira de materias de <?php echo $_SESSION["nombre"]; ?></title>
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
     left: 10%;
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
     left: 10%;

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
$nombre=  $_SESSION['nombre']; 
$registro=$_SESSION['registro'];
?>

<!-- Contenido principal -->
<h1 style="text-align: center;"><span style="background-color: #ff6600; color: #ffffff; font-size: 45px;"><img src="logo_sep.png" width="141" height="149" />Tira de materias<img src="logo_ceti.png" width="192" height="148" /></span></h1>

<br>
<?php
echo"<a class='boton' href='Alumnos.php'><u>Regresar</u></a>";
?>
<br>
<h3>
<div class="table">
   <table border="1" style="margin: 0 auto;">
    <tr>
      <td>Clave</td>
      <td>Asignatura</td>
      <td>Docente</td>
      <td>Academia</td>
    </tr>
        <?php
    $sql="Select asignatura.id_asignatura, asignatura.nombre, docente.apellido_paterno, docente.apellido_materno, docente.nombre, academia.nombre 
from calificacion 
inner join docente on calificacion.nomina = docente.id_docente 
inner join asignatura on asignatura.id_asignatura = calificacion.id_asignatura 
inner join academia on asignatura.id_academia = academia.id_academia where registro = $registro";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {
      
    ?>
    <tr>
      <td><?php echo $row[0]?></td>
      <td><?php echo $row[1]?></td>
      <td><?php echo $row[2]." ".$row[3]." ".$row[4]; ?></td>
      <td><?php echo $row[5]?></td>
    </tr>
    
    <?php
    }
    ?>
  </table>
</div>
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