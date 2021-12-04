<?php  
	
	
	//conectarse evitando ataques de inicio de sesión --SEGURIDAD DE CONEXION--
	$connect = new mysqli('localhost', 'root','','db_permisos2');

	if($connect){
		//echo "Welcome";
	} else{
		echo "Falló la conexión, revise ip o firewall";
		exit();
	}

?>