<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>
<!DOCTYPE html>
<html>
<head>
	<title>Altas Alumnos</title>
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
  width: 100px;
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
<h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" />Registrar Alumno<img src="logo_ceti.png" width="192" height="148" /></span></h1>
<div class="form">

<form name="Registro" method="POST" action="act_alum_reg.php" >
<?php
$conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
mysqli_query($conectar,"SET NAMES 'utf8'");
?>
Registro
<br>    
<input align="center" type="registro" name="Registro"; placeholder="16100000" required> 
<br>
<br>
Nombre
<br>
<input align="center" type="text" name="Nombre" placeholder="..." required > 
<br>
<br>
Apellido Paterno
<br>
<input align="center" type="text" name="APa" placeholder="..." required > 
<br>
<br>
Apellido Materno
<br>
<input align="center" type="text" name="AMa" placeholder="..." required > 
<br>
<br>
Carrera
<br>
<select name= "carrera" value = "0">
 <?php
 $sql = "select * from carrera";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)) {
  echo "<option value=".$valores[0].">".$valores[1]."</option>";
 }
 ?>
</select>
<br>
<br>
Sexo:
<br>
M<input align="center" type="radio" name="sexo" value="M" required align="center" checked> <t> F <input align="center" type="radio" name="sexo" value="F" required align="center">
<br>
<br>
Domicilio
<br>
<input align="center" type="text" name="Domicilio" placeholder="Av..." required > 
<br>
<br>
Colonia
<br>
<input align="center" type="text" name="Col" placeholder="Col..." required > 
<br>
<br>
Municipio
<br>
<select name= "Municipio" value = "0">
 <?php
 $sql = "select * from municipio";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)) {
  echo "<option value=".$valores[0].">".$valores[1]."</option>";
 }
 ?>
</select>
<br>
<br>
Celular
<br>
<input align="center" type="text" name="Celular" placeholder="333000000" required > 
<br>
<br>
<input type="submit" value="Registrar">
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