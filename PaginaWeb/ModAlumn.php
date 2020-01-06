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
<?php
$conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
mysqli_query($conectar,"SET NAMES 'utf8'");
$R=$_POST['Registro'];
$sql="select *, AES_DECRYPT(password,'1234') from alumno where registro = $R";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {
    $Re=   $row[0];
    $N=   $row[7];
    $AP=  $row[5];
    $AM=  $row[4];
    $C=   $row[10];
    $Sx=  $row[3];
    $D=   $row[1];
    $Col= $row[6];
    $M=   $row[9];
    $Cel= $row[2];
    $Pass=$row[11];

    }
?>
<h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" />Modificar información del alumno<img src="logo_ceti.png" width="192" height="148" /></span></h1>
<div class="form">

<form name="Registro" method="POST" action="act_alum_mod.php" >
<input type=hidden name="R" value="<?php echo $R; ?>">
Registro
<br>    
<input align="center" type="registro" name="Registro"; value="<?php echo $Re; ?>" required> 
<br>
<br>
Nombre
<br>
<input align="center" type="text" name="Nombre" value="<?php echo $N; ?>" required > 
<br>
<br>
Apellido Paterno
<br>
<input align="center" type="text" name="APa" value="<?php echo $AP; ?>" required > 
<br>
<br>
Apellido Materno
<br>
<input align="center" type="text" name="AMa" value="<?php echo $AM; ?>" required > 
<br>
<br>
Password
<br>
<input align="center" type="text" name="Pss" value="<?php echo $Pass; ?>" required > 
<br>
<br>
Carrera
<br>
<select name= "carrera" value = "0">
 <?php
 $sql = "select * from carrera";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)){
 if ($C == $valores[0]) {
  echo "<option selected='true' value=".$valores[0].">".$valores[1]."</option>";
 }else{
  echo "<option value=".$valores[0].">".$valores[1]."</option>";
 }
}
 ?>
</select>
<br>
<br>
Sexo:
<br>
M<input align="center" type="radio" name="sexo" value="M" required align="center" <?php if($Sx == 'M'){echo "checked";}?>> <t> F <input align="center" type="radio" name="sexo" value="F" required align="center" <?php if($Sx == 'F'){echo "checked";}?> >
<br>
<br>
Domicilio
<br>
<input align="center" type="text" name="Domicilio" value="<?php echo $D; ?>" required > 
<br>
<br>
Colonia
<br>
<input align="center" type="text" name="Col" value="<?php echo $Col; ?>" required > 
<br>
<br>
Municipio
<br>
<select name= "Municipio" value = "0">
 <?php
 $sql = "select * from municipio";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)) {
  if ($M == $valores[0]) {
    echo "<option selected='true' value=".$valores[0].">".$valores[1]."</option>";
  }else{
  echo "<option value=".$valores[0].">".$valores[1]."</option>";
}
 }
 ?>
</select>
<br>
<br>
Celular
<br>
<input align="center" type="text" name="Celular" value="<?php echo $Cel; ?>" required > 
<br>
<br>
<input type="submit" value="Modificar">
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