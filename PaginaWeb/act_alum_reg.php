<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>

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
  top: 30%;
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
    margin-top: 500px;

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
    $N=$_POST['Nombre'];
    $AP=$_POST['APa'];
    $AM=$_POST['AMa'];
    $C=$_POST['carrera'];
    $Sx=$_POST['sexo'];
    $D=$_POST['Domicilio'];
    $Col=$_POST['Col'];
    $M=$_POST['Municipio'];
    $Cel=$_POST['Celular'];
    $Pass="a".$R;

    $stat = "";

      $sql ="update r set r.registro = $R where id = 0";
    mysqli_query($conectar,$sql);

    $sql = "insert into alumno (`REGISTRO`, `DOMICILIO`, `CELULAR`, `SEXO`, `APELLIDO_MATERNO`, `APELLIDO_PATERNO`, `COLONIA`, `NOMBRE`, `password`, `CLAVE_MUNICIPIO`, `ID_CARRERA`) values ($R, '$D', $Cel, '$Sx', '$AM', '$AP', '$Col', '$N', AES_ENCRYPT('$Pass','1234'), $M, $C)";
    if (mysqli_query($conectar,$sql)) {
            $stat="Alumno ".$N. " registrado";
            ob_start(); 
            header("refresh:2; url=Admin.php");
            ob_end_flush();
    } else {
        $stat = mysqli_error($conectar);
    }

 
?>
    <h1 style="text-align: center;"><span style="background-color: #CC0606; color: #ffffff;"><img src="logo_sep.png" width="141" height="149" /><?php echo $stat ?><img src="logo_ceti.png" width="192" height="148" /></span></h1>

</body>
</html>
<?php
}else
{
    header("Location: LoginPrin.html");
    exit;
}
?>


