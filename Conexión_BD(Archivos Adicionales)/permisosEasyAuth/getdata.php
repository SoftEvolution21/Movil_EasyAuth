<?php  
	//@session_start();
	include 'conexion.php';
	//include_once('db.php');

	
	$username = $_POST['matricula'];

	$connect->character_set_name();
	$connect->set_charset('utf8');
	$queryResult=$connect->query("SELECT solicitudpermiso_tbl_user.idsolicitudpermiso, solicitudpermiso_tbl_user.No_permiso, solicitudpermiso_tbl_user.motivo, solicitudpermiso_tbl_user.dias, solicitudpermiso_tbl_user.mes, solicitudpermiso_tbl_user.anio, solicitudpermiso_tbl_user.horario, solicitudpermiso_tbl_user.dt_solicitud,solicitudpermiso_tbl_user.tx_statuspermiso,solicitudpermiso_tbl_user.observaciones,solicitudpermiso_tbl_user.dt_notificado, tbl_user.matriculauser FROM solicitudpermiso_tbl_user INNER JOIN tbl_user ON solicitudpermiso_tbl_user.idtbl_user = tbl_user.idtbl_user WHERE tbl_user.matriculauser = '".$username."' ORDER BY solicitudpermiso_tbl_user.No_permiso ASC");

	$result=array();

	while($fetchData=$queryResult->fetch_assoc()){
		$result[]=$fetchData;
	}

	echo json_encode($result);

?>