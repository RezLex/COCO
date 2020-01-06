<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>
<!DOCTYPE html>
<html>
<head>
	<title>Pagina Principal Admin</title>
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

<!-- Contenido principal -->
<h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" />Bienvenido Administrador<img src="logo_ceti.png" width="192" height="148" /></span></h1>

<br>
<br>
<a class="boton" href="AltasAlum.php">Registrar Alumnos</a>

<a class="boton" href="AltasDoc.php">Registrar Docentes</a>

<a class="boton" href="DelAlumn.php">Dar de baja Alumnos</a>

<a class="boton" href="DelDoc.php">Dar de baja Docentes</a>

<a class="boton" href="ModAlumn_slc.php">Modificar Alumnos</a>

<a class="boton" href="ModDoc_slc.php">Modificar Docentes</a>

<a class="boton" href="ENDGAME.php">Salir</a>
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