<?php 
@session_start();
if(!empty($_SESSION["nombre"]) || !empty($_SESSION["registro"])) 
{ 
?>
<!DOCTYPE html>
<html>

<head>
	<title>Pagina Principal Estudiantes</title>
</head>
    <style type="text/css" >

 	.boton{
    text-decoration: none;
    padding: 10px;
    font-weight: 200;
    font-size: 25px;
    color: #ffffff;
    background-color: #000000;
    border-radius: 6px;
    display:block; 
    margin-left: auto;
    margin-right: auto;
    border: 2px;
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
$nombre=  $_SESSION['nombre']; 
$registro=$_SESSION['registro'];
?>

<!-- Contenido principal -->
<h1 style="text-align: center;"><span style="background-color: #ff6600; color: #ffffff; font-size: 45px;"><img src="logo_sep.png" width="141" height="149" />Bienvenido <?php echo $nombre ?><img src="logo_ceti.png" width="192" height="148" /></span></h1>

<br>
<br>
<?php
echo"<a class='boton' href='Ver_Datos_Alumnos.php'>Datos</a>";

echo"<a class='boton' href='Calificaciones_alumn.php'>Kardex de calificaciones</a>";

echo"<a class='boton' href='Materias_alumn.php'>Tira de Materias </a>";

echo"<a class='boton' href='ENDGAME.php'>Salir</a>";
?>
<div class=""></div>
</body>
</html>
<?php
}else
{
    header("Location: LoginPrin.html");
    exit;
}
?>