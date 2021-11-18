import 'package:easyauth/docente/docente.dart';
import 'package:easyauth/solicitante/listado.dart';
import 'package:easyauth/src/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          content: Text("Usuario no encontrado"),
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

      if(datauser[0]['idctg_tipousuario']==2){
        Navigator.pushReplacementNamed(context, ForoDocente.routName);
      }

      else if(datauser[0]['idctg_tipousuario']==3){
        Navigator.pushReplacementNamed(context, ListadoPermisos.routName);
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
      

      body: ListView(
        //Bajamos el contenido
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 80.0
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
            child: Text('EasyAuth', style: Theme.of(context).textTheme.body1),
          ),

          Divider(
            height: 30.0,
            color: Theme.of(context).primaryColor,
            thickness: 1.0,
          ),
          //Formulario
          TextField(
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
            onChanged: (valor){
              if(valor.isEmpty) return "Campo Obligatorio";
            },
          ),
          
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: controllerPass,
            textCapitalization: TextCapitalization.characters,
            obscureText: passVisible,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              labelText: 'Introduce tu contraseña',
              suffixIcon: IconButton(
                icon: Icon(
                  passVisible
                  ? Icons.visibility_off 
                  : Icons.visibility,
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
            onChanged: (valor){},
          ),

          SizedBox(
            height: 25.0,
          ),
          FlatButton(
            shape: StadiumBorder(),
            child: Text('Iniciar Sesión',
              style: Theme.of(context).textTheme.title,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: (){
              login(context);
              //Navigator.pop(context);
            }, 
          ),
        ],
      ),

    );
  }
}