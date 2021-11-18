<?php  
	session_start();
	//conectarse evitando ataques de inicio de sesión --SEGURIDAD DE CONEXION--
	$connect = new mysqli('localhost', 'root','','db_permisos');

	if($connect){
		echo "Conexión exitosa";
	} else{
		echo "Falló la conexión";
		exit();
	}

?>