import 'package:easyauth/docente/docente.dart';
import 'package:easyauth/solicitante/listado.dart';
import 'package:easyauth/src/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:animate_do/animate_do.dart';

String username;

class Login extends StatefulWidget {

  static final String routName = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Instanciar cotroladores
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  var _formkey = GlobalKey<FormState>();//Nos permite hacer las validaciones

  String mensaje = '';
  bool passVisible  = true;

  Future<List> login(BuildContext context) async{
    final response = await http.post(Uri.parse("http://192.168.8.104/permisosEasyAuth/login.php"),

    body:{
      "usuario": controllerUser.text,
      "pass": controllerPass.text,
    });
  
    var datauser = json.decode(response.body);

    if(datauser.length == 0){
      setState(() {
        AlertDialog alertDialog = new AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Theme.of(context).primaryColor)),
          content: Text("Usuario no encontrado.", style: Theme.of(context).textTheme.display1,),
          actions: <Widget>[
            RaisedButton(
              shape: StadiumBorder(),
              child: Text("Aceptar",style: TextStyle(color: Colors.white),),
              color: Theme.of(context).primaryColor,
              onPressed: ()=> Navigator.pop(context),
            ),
          ],
        );
        showDialog(context: context, builder: (context)=> alertDialog);
      });
    } else{

       if(datauser[0]['idctg_tipousuario']==4){
        Navigator.pushReplacementNamed(context, ForoDocente.routName, arguments: {'nombre':datauser[0]['tx_nombreuser'], 'paterno':datauser[0]['tx_appaterno'],'materno':datauser[0]['tx_apmaterno']});
        //Navigator.pushReplacementNamed(context, ListadoPermisos.routName);
      }

      else if(datauser[0]['idctg_tipousuario']==3){
        
        Navigator.pushReplacementNamed(context, ListadoPermisos.routName, arguments: {'matricula':datauser[0]['matriculauser'],'nombre':datauser[0]['tx_nombreuser'], 'paterno':datauser[0]['tx_appaterno'],'materno':datauser[0]['tx_apmaterno']});
        //Navigator.pushReplacementNamed(context, ListadoPermisos.routName);
      }
      
      else {
        
      }

      setState(() {
         username = datauser[0]['usuario']; 
      });
    }
    return datauser;
  }

  @override

  Widget build(BuildContext context) {
   return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('Iniciar Sesión',style: Theme.of(context).textTheme.title,),
      ),
      drawer: Menu(),
      

      body: Form(
        key: _formkey,
        child: ListView(
          //Bajamos el contenido
          padding: EdgeInsets.symmetric(
            horizontal: 35.0,
            vertical: 70.0
          ),

          children: <Widget>[

            Container(
              child: CircleAvatar(//Envolverlo para agregarle un borde
                radius: 70.0,
                //Usamos el ClipOval para ajustar bien la imagen
                child: ClipOval(
                  child: Image.asset('assets/img/EasyAuth2.png'),
                ),
              ),
              decoration: BoxDecoration(//agregando borde
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColorDark,
                  width: 2.0,
                )
              ),
            ),

            SizedBox(height: 10.0,),
            Align(
              alignment: Alignment.center + Alignment(0, .1),
              //child: Text('EasyAuth', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              child: Text('EasyAuth', style: Theme.of(context).textTheme.body1),
            ),

            Divider(
              height: 30.0,
              color: Theme.of(context).primaryColor,
              thickness: 1.0,
            ),
            //Formulario
            FadeInRight(
              child: TextFormField(
                controller: controllerUser,
                maxLength: 9,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  labelText: 'Introduce tu nombre de usuario',
                  suffixIcon: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  )
                ),
                validator: (valor){
                  if(valor.isEmpty) return "El campo usuario es obligatorio";
                },
              ),
            ),
            
            SizedBox(
              height: 20.0,
            ),
            FadeInLeft(
              child: TextFormField(
                controller: controllerPass,
                textCapitalization: TextCapitalization.characters,
                obscureText: passVisible,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'Introduce tu contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      passVisible
                      ? Icons.visibility 
                      : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: (){
                      setState(() {
                        passVisible = !passVisible;              
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                ),
                validator: (valor){
                  if(valor.isEmpty) return "El campo contraseña es obligatorio";
                },
              ),
            ),

            SizedBox(
              height: 25.0,
            ),
            
              //width: double.infinity,
            ZoomIn(
              delay: Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FlatButton(
                  shape: StadiumBorder(),
                  child: Text('Iniciar Sesión',
                    style: Theme.of(context).textTheme.title,
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                      login(context);
                    }
                  }, 
                ),
              ),
            ),
            
            //Text(mensaje),
          ],
        ),
      ),

    );
  }
}