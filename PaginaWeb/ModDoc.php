<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>
<!DOCTYPE html>
<html>
<head>
	<title>Modificar Maestros</title>
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
$M=$_POST['Mtr'];

 $sql="select *, AES_DECRYPT(Password,'1234') from docente where id_docente = $M";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {

    $Mt=  $row[0];
    $N=   $row[4];
    $AP=  $row[3];
    $AM=  $row[2];
    $Ac=  $row[1];
    $Pass=$row[6];

    }
$sql=" select nombre from academia where id_academia = $Ac";
    $res=mysqli_query($conectar,$sql);
    while ($row=mysqli_fetch_array($res)) {

    $nAc=  $row[0];
    }


?>
<h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" />Modificar información del docente<img src="logo_ceti.png" width="192" height="148" /></span></h1>
<div class="form">

<form name="Registro" method="POST" action="act_doc_mod.php" >
<input type=hidden name="M" value="<?php echo $M; ?>">
Matricula
<br>    
<input align="center" type="matricula" name="Matr"; value="<?php echo $Mt; ?>" required> 
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
Academia
<br>
<select name= "aca" >

 <?php
 $sql = "select * from academia";
 $res=mysqli_query($conectar,$sql);
 while ($valores = mysqli_fetch_array($res)) {
  if ($Ac==$valores[0]){
  echo "<option selected='true' value=".$valores[0].">".$valores[1]."</option>";
}else{
  echo "<option value=".$valores[0].">".$valores[1]."</option>";
}
 }
 ?>
</select>
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