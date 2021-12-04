<?php 
	
	include 'conexion.php';

	$username = $_POST['usuario'];
	$password = $_POST['pass'];
	

	//echo($username,$password);

	//Cambiando los valores a utf8
	$connect->character_set_name();
	$connect->set_charset('utf8'); //también se puede usar utf8mb4

	$consulta = $connect->prepare("SELECT * FROM tbl_user WHERE matriculauser='".$username."' AND tx_password='".$password."'"); 
	$consulta->execute();
	$resultado = $consulta->get_result();

	//echo ($resultado);

	$resultados=array();

	while($extraerDatos=$resultado->fetch_assoc()){
		$resultados[]=$extraerDatos;
	}

	echo json_encode($resultados);
	//echo '<script>alert("'.$resultados.'")</script>';

?>