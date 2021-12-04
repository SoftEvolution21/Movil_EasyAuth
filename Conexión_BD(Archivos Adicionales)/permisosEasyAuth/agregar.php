<?php
	session_start();
	include 'conexion.php';
	//include_once('db.php');

	//Recibimos los datos y los almacenamos en variables
	$numPer = $_POST['noPermiso'];
	$matricula = $_POST['matricula'];
	$motivo = $_POST['motivo'];
	$dias = $_POST['dias'];
	$horario = $_POST['horario'];
	$mes = $_POST['mes'];
	$anio = $_POST['anio'];

	//Obtenemos el id del usuario
	$consultar = $connect->query("SELECT * FROM tbl_user WHERE matriculauser='".$matricula."'");
	$idUser = mysqli_fetch_array($consultar);
	$id = $idUser['idtbl_user'];


	//Verificamos si existe ese número de permiso
	//$sql = "SELECT * FROM solicitudpermiso_tbl_user WHERE No_permiso='".$numPer."' AND idtbl_user ='".$id."' AND (tx_statuspermiso='En espera'  OR tx_statuspermiso = 'Rechazado')";
	$sql = "SELECT * FROM solicitudpermiso_tbl_user WHERE No_permiso='".$numPer."' AND idtbl_user ='".$id."' ";

	$s = mysqli_query($connect,$sql);

	if (mysqli_num_rows($s)==0) {

		//Hacemos la insercción a la BD;
		//Cambiamos los valores a utf8
		$connect->character_set_name();
		$connect->set_charset('utf8');
		$connect->query("INSERT INTO solicitudpermiso_tbl_user VALUES (0,'','".$numPer."','".$motivo."','".$dias."','".$mes."','".$anio."','".$horario."',NOW(),'En espera','0000-00-00 00:00:00','".$id."')");
	 	
	} else{
		
	}
	
?>