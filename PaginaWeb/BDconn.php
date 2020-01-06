<?php

$conectar=mysqli_connect('localhost','root','','DBWEB') or die ("No se conectó a la base de datos");
mysqli_query($conectar,"SET NAMES 'utf8'");
	$registro=$_POST['Registro'];
	$pass=$_POST['contra'];
	if($registro=="Root"&&$pass=="1234"){
		session_start();
		$_SESSION['root'] = "root";
		header("Location: Admin.php");
	}else{
		$res = "Select * from alumno where registro = '$registro' and password = AES_ENCRYPT('$pass','1234')";
		$sql=mysqli_query($conectar,$res);
		if(!$sql){
			echo mysqli_error($conectar);

		}elseif(mysqli_num_rows($sql)==0){
			$res = "Select * from docente where id_docente = '$registro' and password = AES_ENCRYPT('$pass','1234')";
			$sql=mysqli_query($conectar,$res);
			if(!$sql){
				echo mysqli_error($conectar);
			}elseif(mysqli_num_rows($sql)==0){
				
				ob_start(); 
				header("refresh:2; url=LoginPrin.html");
				echo"Usuario o contraseña incorrecta";
				ob_end_flush();
			}
			else{
					while($row = mysqli_fetch_array($sql)) {
				$nombre = $row[4];
				$ID = $row[0];
				session_start();
				$_SESSION['nombre'] = $nombre;
				$_SESSION['ID'] = $ID;
				$_SESSION['stat'] = 1;
				header ("Location: Maestros.php");

			}

			}
		}else{
			while($row = mysqli_fetch_array($sql)) {

				
				$nombre = $row[7];
				$registro = $row[0];
				session_start();
				$_SESSION['nombre'] = $nombre;
				$_SESSION['registro'] = $registro;
				$_SESSION['stat'] = 1;


				header ("Location: Alumnos.php");
			}
			mysqli_free_result($sql);

	}




	
}
?>