<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>
<!DOCTYPE html>
<html>
<head>
	<title>Modificar Alumnos</title>
</head>
    <style type="text/css" >

.form{
padding: 10px;
    font-weight: 200;
    font-size: 20px;
    color: #ffffff;
    background-color: #000000;
    border-radius: 6px;
    border: 2px;
position: absolute;
  top: 38%;
  left: 40%;

} 

.text{
  
}
input[type=submit]{

  position:relative;
  width: 130px;
  height: 30px;
  border-radius: 20px;
  margin:0 auto;
  border: 0px;
  background-color: #32A43E;
  font: 20px normal normal uppercase helvetica, arial, serif;

}

 	.boton{
    text-decoration: none;
    padding: 10px;
    font-weight: 50;
    font-size: 20px;
    color: #ffffff;
    background-color: #000000;
    border-radius: 6px;
    margin-right: 30px;
    border: 2px;
position: absolute;
  top: 30%;
  left: 40%;

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
<h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" />Modificar Alumno<img src="logo_ceti.png" width="192" height="148" /></span></h1>
<div class="form">

<form name="Registro" method="POST" action="ModAlumn.php" >
<?php
$conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
mysqli_query($conectar,"SET NAMES 'utf8'");
?>
Seleccionar Alumno
<br>    
<select name= "Registro" value = "0">
 <?php
 $sql = "select registro, nombre, apellido_paterno, apellido_materno from alumno";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)) {
  echo "<option value=".$valores[0].">".$valores[1]." ".$valores[2]." ".$valores[3]."</option>";
 }
 ?>
</select>
<br>
<br>
<input type="submit" value="Seleccionar">
<br>
</form>
  </div>
<a class="boton" href="Admin.php">Regresar</a>
</body>
</html>
<?php
}else
{
    header("Location: LoginPrin.html");
    exit;
}
?>