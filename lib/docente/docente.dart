import 'package:easyauth/solicitante/login.dart';
import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animate_do/animate_do.dart';

class ForoDocente extends StatefulWidget {
  //ForoDocente({Key? key}) : super(key: key);
  static final String routName = 'ForoDocente';

  @override
  _ForoDocenteState createState() => _ForoDocenteState();
}

class _ForoDocenteState extends State<ForoDocente> {

  //Llamamos a los datos 
  Future<List> getPermisos() async{
  
    final response = await http.get(Uri.parse("http://192.168.1.103/permisosEasyAuth/permisos.php"));

    return json.decode(response.body);

  }

  @override
  Widget build(BuildContext context) {

    //Recibo los argumentos
    Map parametro = ModalRoute.of(context).settings.arguments;
    String nombre = parametro['nombre'];
    String appaterno = parametro['paterno'];
    String apmaterno = parametro['materno'];
    
    return WillPopScope(
      onWillPop: _noretorno,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Permisos autorizados', style: Theme.of(context).textTheme.title,),
        ),

        drawer: Drawer(
          child: Container(
          //color: Colors.grey[400],
          color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(
              children: <Widget>[

                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  child:Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 70.0,
                          //backgroundImage: AssetImage('assets/img/docente.png'),
                          child: ClipOval(
                            child: Image.asset('assets/img/docente.png'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft + Alignment(1.8,0),
                        child: Text(
                          'Bienvenido: \n$nombre \n$appaterno \n$apmaterno',style: TextStyle(
                            color: Colors.white, fontSize: 17.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight + Alignment(0, 2.0),
                        child: Text(
                          'Online', style: TextStyle(
                            color: Colors.white, fontSize: 16.0,
                          ),
                        ),
                      )
                    ],
                  )
                ),

                SizedBox(height: 40.0,),
                SlideInLeft(
                  child: ListTile(
                    leading: Icon(Icons.logout,color: Theme.of(context).primaryColorDark,),
                    title: Text('Cerrar Sesión', style: Theme.of(context).textTheme.body2,),
                    onTap: (){
                      AlertDialog alertDialog = new AlertDialog(
                        content: Text("¿Estás seguro de cerrar \nla sesión?", textAlign: TextAlign.center,style: Theme.of(context).textTheme.body2,),
                        actions: <Widget>[
                          RaisedButton(
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                            child: Text("Cancelar",style: TextStyle(color: Colors.white),),
                            color: Theme.of(context).primaryColor,
                            onPressed: ()=> Navigator.pop(context),
                          ),
                          SizedBox(width: 15.0,),
                          RaisedButton(
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0), borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                            child: Text("Aceptar",style: TextStyle(color: Colors.white),),
                            color: Theme.of(context).primaryColor,
                            onPressed: ()=> Navigator.of(context).pushNamedAndRemoveUntil(Login.routName, (Route<dynamic> route) => false),
                          ),
                        ],
                      );
                      showDialog(context: context, barrierDismissible: false, builder: (context)=> alertDialog);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        body: FutureBuilder<List>(

          future: getPermisos(),
          builder: (context, snapshot){
            
            /*if(snapshot.data==null){
              return Center(child: Text('No tienes permisos',style: TextStyle(fontSize: 17.0)),);
            }*/
             if (snapshot.hasError) print(snapshot.error); //Si hay un error, imprimirlo en consola
            return snapshot.hasData
            ? notificaciones(snapshot.data)
            : new Center( //Si se demora mucho la consulta, mostraremos una barra de progreso circular
              child: CircularProgressIndicator(),
            );

          },
        )

      ),
    );
  }

  notificaciones(List datos){

    final List list = datos;

    return ListView.builder(
      itemCount: list == null ? 0 :list.length,
      itemBuilder: (context,i){
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
            child: ListTile(
              title: Text(
                  "Se le informa a todo el personal docente que el alumno " + list[i]['tx_nombreuser'] + " " + list[i]['tx_appaterno'] + " " + list[i]['tx_apmaterno'] + 
                  " de la carrera " + list[i]['tx_carrera'] + " del " + list[i]['tx_cuatrimestre']  + " grupo "+ "'" + list[i]['tx_grupo'] + "'," +
                  " se le autorizó un permiso escolar para el día: " + list[i]['dias'] + " de " + list[i]['mes'] + " del año en curso, " +
                  "en el horario de " + list[i]['horario'] + "." + 
                  "\n\nSe le solicita a los docentes de la academia correspondiente tomarlo en cuenta, por su comprensión, gracias",
                  style: Theme.of(context).textTheme.display1,textAlign: TextAlign.justify,
                ),
                //Le ponemos un icono
                /*leading: Icon(
                  Icons.notifications,
                  size: 60.0,
                  color: Theme.of(context).primaryColor,
                ),*/
                subtitle: Text("\nFecha de notificación: ${list[i]['dt_notificado']}",
                  style: TextStyle(fontSize: 15.0, color: Colors.black),textAlign: TextAlign.justify,
                ),
            ),
          ),
        );
      }
    );
  }

  Future<bool> _noretorno() {

    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
        content: Text("No puedes volver a \nla vista anterior", textAlign: TextAlign.center,style: Theme.of(context).textTheme.body2,),
        actions: <Widget>[
          RaisedButton(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
            child: Text("Aceptar",style: TextStyle(color: Colors.white),),
            color: Theme.of(context).primaryColor,
            onPressed: ()=> Navigator.pop(context),
          ),
        ],
      )
    );
  }

}