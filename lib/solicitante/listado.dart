import 'package:easyauth/solicitante/login.dart';
import 'package:easyauth/solicitante/solicitar.dart';
import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animate_do/animate_do.dart';

class ListadoPermisos extends StatefulWidget {
  //ForoDocente({Key? key}) : super(key: key);
  static final String routName = 'Listado';

  @override
  _ListadoPermisosState createState() => _ListadoPermisosState();
}

class _ListadoPermisosState extends State<ListadoPermisos> {
  @override
  Widget build(BuildContext context) {

    //Recibo los argumentos
    Map parametro = ModalRoute.of(context).settings.arguments;
    String matricula = parametro['matricula'];
    String nombre = parametro['nombre'];
    String appaterno = parametro['paterno'];
    String apmaterno = parametro['materno'];

    //Llamamos a los datos 
    Future<List> getData() async{

      final response = await http.post(Uri.parse("http://192.168.1.102/permisosEasyAuth/getdata.php"),//conexion local

      body:{
        "matricula": matricula,
      });
      
      return json.decode(response.body);
    }


    return WillPopScope(
      onWillPop: _noretorno,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Permisos Solicitados', style: Theme.of(context).textTheme.title,),
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
                            child: Image.asset('assets/img/alumno2.png'),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
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

        //Botón para agregar un nuevo permiso
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, Solicitar.routName, arguments: {
               'matricula': matricula, 'nombre':nombre, 'paterno':appaterno,'materno':apmaterno,
              });//pushNamed para que puede volver a esta vista sin problemas.
          }
        ),

        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){//Con esto mostramos cualquier error
            
            if (snapshot.hasError) print(snapshot.error); //Si hay un error, imprimirlo en consola
            return snapshot.hasData
            ? listarPermisos(snapshot.data)
            : new Center( //Si se demora mucho la consulta, mostraremos una barra de progreso circular
              child: CircularProgressIndicator(),
            );
          }
        ),

      ),
    );
  }

  //Creamos ListarPermisos
  listarPermisos(List datos){

    final List list = datos;
    return ListView.builder(
      itemCount: list == null ? 0: list.length,
      itemBuilder: (context, i){
        return Container(
          padding: const EdgeInsets.all(10.0),
          child:  GestureDetector(
            //Le damos el estilo dentro de un Card
            child:  Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
              child: ListTile(
                title: Text(
                  "No. de permiso: " + list[i]['No_permiso'] + "\nMotivo: " + list[i]['motivo'] + "\nPara el día: " + list[i]['dias'] + "\nDel mes de: " + list[i]['mes'] + 
                  "\nDel año: " + list[i]['anio'] + "\nHorario: " + list[i]['horario'] + "\nFecha de Solicitud (AA/MM/DD): " +list[i]['dt_solicitud'],
                  style: Theme.of(context).textTheme.body2,
                ),
                //Le ponemos un icono
                leading: Icon(
                  Icons.dock_outlined,
                  size: 60.0,
                  color: Theme.of(context).primaryColor,
                ),
                subtitle: Text(
                  "\nStatus : ${list[i]['tx_statuspermiso']}" + "\nObservaciones : ${list[i]['observaciones']}" + "\nFecha de autorización : ${list[i]['dt_notificado']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
            
          ),
        );
      },
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