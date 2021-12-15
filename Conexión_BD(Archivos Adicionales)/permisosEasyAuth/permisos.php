<?php 

    include 'conexion.php';

    $connect->character_set_name();
	$connect->set_charset('utf8');

    $queryResult=$connect->query("SELECT tbl_user.tx_nombreuser, tbl_user.tx_appaterno, tbl_user.tx_apmaterno, carrera.tx_carrera, cuatrimestre.tx_cuatrimestre, grupo.tx_grupo, solicitudpermiso_tbl_user.dias, solicitudpermiso_tbl_user.mes, solicitudpermiso_tbl_user.horario, solicitudpermiso_tbl_user.dt_solicitud, solicitudpermiso_tbl_user.tx_statuspermiso, solicitudpermiso_tbl_user.dt_notificado FROM tbl_user INNER JOIN carrera ON tbl_user.idcarrera = carrera.idcarrera INNER JOIN cuatrimestre ON tbl_user.idcuatrimestre = cuatrimestre.idcuatrimestre INNER JOIN grupo ON tbl_user.idgrupo = grupo.idgrupo INNER JOIN solicitudpermiso_tbl_user ON  solicitudpermiso_tbl_user.idtbl_user = tbl_user.idtbl_user AND solicitudpermiso_tbl_user.tx_statuspermiso ='Autorizado' ORDER BY dt_notificado DESC");

    //$queryResult=$connect->query("SELECT * from cuatrimestre");

   // $result=mysqli_query($con,$sql);

    $result=array();

	while($fetchData=$queryResult->fetch_assoc()){
		$result[]=$fetchData;
	}

	echo json_encode($result,JSON_UNESCAPED_UNICODE);

?>