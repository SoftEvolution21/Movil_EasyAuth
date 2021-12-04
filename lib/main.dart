import 'package:easyauth/docente/docente.dart';
import 'package:easyauth/solicitante/listado.dart';
import 'package:easyauth/solicitante/login.dart';
import 'package:easyauth/solicitante/solicitar.dart';
import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();//Inicializamos los widgets e flutter

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routName,
      routes: {
        HomePage.routName: (BuildContext context) => HomePage(),
        Login.routName: (BuildContext context) => Login(),
        ForoDocente.routName: (BuildContext context) => ForoDocente(),
        ListadoPermisos.routName: (BuildContext context) => ListadoPermisos(),
        Solicitar.routName: (BuildContext context) => Solicitar(),
      },

      
      theme: ThemeData(//ThemeData para colores y tipografías generales

        //Definimos los colores a usar
        primaryColor: Color.fromRGBO(40, 66, 147, 1.0),//Azul oscuro del logo
        primaryColorDark: Color.fromRGBO(28, 42, 93, 1.0),// Color mas oscuro que el fondo(Iconos)
        primaryColorLight: Colors.grey[100],
        accentColor: Color.fromRGBO(104, 200, 240, 1.0),//Azul claro
        scaffoldBackgroundColor: Colors.white,//Blanco para los Scaffolds

        //Definimos el tipo de letra a usar
        textTheme: TextTheme(
          title: TextStyle(fontSize: 20.0,color: Colors.white, fontFamily: 'poppins'),
          subtitle: TextStyle(fontSize: 22, color: Color.fromRGBO(28, 42, 93, 1.0),fontFamily: 'poppins', fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),
          body2: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Color.fromRGBO(28, 42, 93, 1.0),fontFamily: 'poppins'),//Para letras del menú
          //headline1: TextStyle(fontSize: 22, color: Color.fromRGBO(28, 42, 93, 1.0),fontFamily: 'poppins'),
        ),


      ),
    );
  }
}