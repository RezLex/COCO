<?php
@session_start();
unset($_SESSION["ID"]); 
unset($_SESSION["nombre"]);
unset($_SESSION["registro"]);
unset($_SESSION["root"]);
session_destroy();
header("Location: LoginPrin.html");
?>