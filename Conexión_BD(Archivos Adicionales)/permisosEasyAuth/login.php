<?php  

	include 'conexion.php';

	$username = $_POST['usuario'];
	$password = $_POST['pass'];
	
	$consulta = $connect->prepare("SELECT tbl_user.idctg_tipousuario, tbl_user.matriculauser, tbl_user.idcarrera, tbl_user.idcuatrimestre FROM tbl_user WHERE matriculauser='".$username."' AND tx_password='".$password."'");
	$consulta->execute();
	$resultado = $consulta->get_result();

	$results=array();

	while($fetchData=$resultado->fetch_assoc()){
		$results[]=$fetchData;
	}

	echo json_encode($results);

?>