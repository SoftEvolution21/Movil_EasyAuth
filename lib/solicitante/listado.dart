import 'package:easyauth/solicitante/login.dart';
import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';

class ListadoPermisos extends StatefulWidget {
  //ForoDocente({Key? key}) : super(key: key);
  static final String routName = 'Listado';

  @override
  _ListadoPermisosState createState() => _ListadoPermisosState();
}

class _ListadoPermisosState extends State<ListadoPermisos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Permisos Solicitados', style: Theme.of(context).textTheme.title,),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), 
            onPressed: (){  
               AlertDialog alertDialog = new AlertDialog(
                content: Text("¿Estás seguro de cerrar \nla sesión?", textAlign: TextAlign.center,style: Theme.of(context).textTheme.body2,),
                actions: <Widget>[
                  RaisedButton(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                    child: Text("Cancelar",style: TextStyle(color: Colors.white),),
                    color: Theme.of(context).primaryColor,
                    onPressed: ()=> Navigator.pop(context),
                  ),
                  SizedBox(width: 15.0,),
                  RaisedButton(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                    child: Text("Aceptar",style: TextStyle(color: Colors.white),),
                    color: Theme.of(context).primaryColor,
                    onPressed: ()=> Navigator.of(context).pushNamedAndRemoveUntil(Login.routName, (Route<dynamic> route) => false),
                  ),
                ],
              );
              showDialog(context: context, barrierDismissible: false, builder: (context)=> alertDialog);
            }
          )
        ],
      ),

      //Botón para agregar un nuevo permiso
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Icon(Icons.add),
        onPressed: (){
         //Navigator.pushNamed(context, Solicitar.routName, arguments: {'matricula': matricula});//pushNamed para que puede volver a esta vista sin problemas.
        }
      ),

      body: Center(
        child: ListTile(
          title: Text('Bienvenido Alumno', style: Theme.of(context).textTheme.body2, textAlign: TextAlign.center,),
        )
         
      ),

    );
  }
}