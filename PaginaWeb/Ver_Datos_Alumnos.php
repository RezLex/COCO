<?php 
@session_start();
if(!empty($_SESSION["nombre"]) || !empty($_SESSION["registro"])) 
{ 
?>
<!DOCTYPE html>
<html>
<head>
	<title> Datos de <?php $nombre=$_GET["nombre"]; echo $nombre; ?></title>
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
     left: 36%;
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
     left: 36%;

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
<h1 style="text-align: center;"><span style="background-color: #ff6600; color: #ffffff; font-size: 45px;"><img src="logo_sep.png" width="141" height="149" />Datos<img src="logo_ceti.png" width="192" height="148" /></span></h1>

<br>
<?php
echo"<a class='boton' href='Alumnos.php'><u>Regresar</u></a>";
?>
<br>
<h3>
<div class="table">
   <table >
        <?php
    $sql="Select alumno.nombre, alumno.apellido_paterno, alumno.apellido_materno, alumno.registro, carrera.nombre, alumno.celular, alumno.sexo, alumno.domicilio, municipio.nombre from alumno inner join municipio on alumno.clave_municipio = municipio.clave_municipio inner join carrera on alumno.id_carrera = carrera.id_carrera where alumno.registro = $registro";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {
      
    ?>
    <tr>
      <td>Nombre(s):</td>
      <td><?php echo $row[0]?></td>
    </tr>
   <tr>
      <td>Apellidos:</td>
      <td><?php echo $row[1]." ".$row[2]?></td>
      
    </tr>
    <tr>
      <td>Registro:</td>
      <td><?php echo $row[3]?></td>
    </tr>
    <tr>
      <td>Carrera:</td>
      <td><?php echo $row[4]?></td>
    </tr>
    <tr>
      <td>Celular:</td>
      <td><?php echo $row[5]?></td>
    </tr>
    <tr>
      <td>Sexo:</td>
      <td><?php echo $row[6]?></td>
    </tr>
    <tr>
      <td>Domicilio:</td>
      <td><?php echo $row[7]?></td>
    </tr>
    <tr>
      <td>Municipio:</td>
      <td><?php echo $row[8]?></td>
    </tr>
    <?php
    }
    ?>
  </table>
<?php
echo"<a href='AlumnosPass.php'><u>Cambiar contraseña</u></a>";
?>
</div>
<br>
<br>
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