import 'package:easyauth/solicitante/login.dart';
import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';

class ForoDocente extends StatefulWidget {
  //ForoDocente({Key? key}) : super(key: key);
  static final String routName = 'ForoDocente';

  @override
  _ForoDocenteState createState() => _ForoDocenteState();
}

class _ForoDocenteState extends State<ForoDocente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Permisos aceptados', style: Theme.of(context).textTheme.title,),
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

      body: Center(
        child: Text('Bienvenido Docente', style: Theme.of(context).textTheme.body2, textAlign: TextAlign.center,),
      ),

    );
  }
}