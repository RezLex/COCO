<?php 
@session_start();
if($_SESSION["root"] == "root") 
{ 
?>

<!DOCTYPE html>
<html>
<head>
    <title>Modificación</title>

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
    $M = $_POST['M'];
    $Mt=$_POST['Matr'];
    $N=$_POST['Nombre'];
    $AP=$_POST['APa'];
    $AM=$_POST['AMa'];
    $Ac=$_POST['aca'];
    $Pass=$_POST['Pss'];
    $stat = "";



    $sql = "update docente set id_docente = $Mt, id_academia = $Ac, apellido_materno = '$AM', apellido_paterno = '$AP', nombre = '$N', password = AES_ENCRYPT('$Pass','1234') where id_docente = $M";
    if (mysqli_query($conectar,$sql)) {
        $stat="Docente ".$N. " Modificado";
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

