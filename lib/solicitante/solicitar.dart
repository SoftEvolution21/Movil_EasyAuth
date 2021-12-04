
import 'package:easyauth/solicitante/listado.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animate_do/animate_do.dart';

class Solicitar extends StatefulWidget {
  //Solicitar({Key? key}) : super(key: key);

  static final String routName = "Solicitar";

  @override
  _SolicitarState createState() => _SolicitarState();
}

class _SolicitarState extends State<Solicitar> {

  //Instanciar los controladores
  TextEditingController numPermiso = new TextEditingController();
  TextEditingController matricula1 = new TextEditingController();
  TextEditingController motivo= new TextEditingController();
  TextEditingController diasPermiso = new TextEditingController();
  TextEditingController horario = new TextEditingController();
  TextEditingController mes = new TextEditingController();
  TextEditingController anio = new TextEditingController();
  TextEditingController dtSolicitud= new TextEditingController();


  var _formkey = GlobalKey<FormState>();//Nos permite hacer las validaciones
  //var datauser;

  @override
  Widget build(BuildContext context) {

    //Recibo los argumentos
    Map parametro = ModalRoute.of(context).settings.arguments;
    String matricula = parametro['matricula'];
    String nombre = parametro['nombre'];
    String appaterno = parametro['paterno'];
    String apmaterno = parametro['materno'];

    List<dynamic> mapPermi = parametro['nopermisos'];

    //print(mapPermi);

    void addData(){

    //var url = Uri.parse("http://192.168.1.103/permisosEasyAuth/agregar.php"); //conexión local

    var url = Uri.parse("http://187.141.125.210/easyauth/agregar.php"); //Conexión al servidor

    http.post(url,body:{
      "noPermiso": numPermiso.text,
      "matricula" : matricula,
      "motivo": motivo.text,
      "dias": diasPermiso.text,
      "horario": horario.text,
      "mes": mes.text,
      "anio": anio.text,
    });
  }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Solicitar Permiso', style: Theme.of(context).textTheme.title,),
      ),

      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[

              ListTile(
                leading: Icon(Icons.keyboard_hide_outlined, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: matricula, labelText: matricula,
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
              ListTile(
                leading: Icon(Icons.format_list_numbered, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: numPermiso,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    
                    var num = int.parse(value);//Convertimos el valor a int
                    
                    if (num > 3) return "No puedes solicitar más de 3 permisos en \nun cuatrimestre";

                    if(num <=0) return "Número inválido";
                    
                    else if(value.isEmpty) return "Ingrese el número de permiso";

                    /*mapPermi.forEach((element) {
                      if(value = element['No_permiso']){

                        return "Este número de permiso ya existe.";
                      }
                    });*/
                     /*if( num == mapPermi[0]['No_permiso']){

                        return "Este número de permiso ya existe.";
                      }*/

                   
                    //return value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "No. de permiso", labelText: "Número de permiso",
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
              ListTile(
                leading: Icon(Icons.subject, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: motivo,
                  validator: (value){
                    if(value.isEmpty) return "Ingrese el motivo";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Motivo", labelText: "Motivo de tu permiso",
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
               ListTile(
                leading: Icon(Icons.view_day_outlined, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: diasPermiso,
                  validator: (value){
                    if(value.isEmpty) return "Ingrese los días";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Días del mes", labelText: "Días de permiso",
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
               ListTile(
                leading: Icon(Icons.watch_later_rounded, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: horario,
                  validator: (value){
                    if(value.isEmpty) return "Ingrese el horario";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Horario de permiso", labelText: "Horario de permiso",
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
               ListTile(
                leading: Icon(Icons.calendar_today_outlined, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: mes,
                  validator: (value){
                    if(value.isEmpty) return "Ingrese el mes";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Mes", labelText: "Mes",
                  ),
                ),
              ),


              SizedBox(
                height: 25.0,
              ),
               ListTile(
                leading: Icon(Icons.calendar_today_rounded, color: Theme.of(context).primaryColorDark,),
                title: TextFormField(
                  controller: anio,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value.isEmpty) return "Ingrese el año";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    hintText: "Año", labelText: "Año",
                  ),
                ),
              ),

              SizedBox(height: 25.0,),

              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //Cancelar
                    RaisedButton(
                      child: Text('Cancelar', style: Theme.of(context).textTheme.title,),
                      color:  Color.fromRGBO(17, 97, 172, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: ()=> Navigator.pushReplacementNamed(context, ListadoPermisos.routName, arguments: {
                        'matricula': matricula,'nombre':nombre, 'paterno':appaterno,'materno':apmaterno,
                      }),
                    ),
                    
                    //Agregar
                    RaisedButton(
                      child: Text('Guardar', style: Theme.of(context).textTheme.title,),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: (){
                        if(_formkey.currentState.validate()){

                          addData();//ejecuto antes el agregar para asi ya me tome los datos al aceptar la ventana emergente
                          
                          AlertDialog alertDialog = new AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Theme.of(context).primaryColor)),
                            content: Text("¡Tu solicitud se ha enviado exitosamente!",style: TextStyle(fontWeight: FontWeight.bold),),
                            actions: <Widget>[
                              RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                child: Text("Aceptar",style: TextStyle(color: Colors.white),),
                                color: Theme.of(context).primaryColor,
                                onPressed: (){
                                  /*Navigator.pushReplacementNamed(context, ListadoPermisos.routName, arguments: {
                                    'matricula': matricula,'nombre':nombre, 'paterno':appaterno,'materno':apmaterno,
                                  });*/

                                  Navigator.of(context).pushNamedAndRemoveUntil(ListadoPermisos.routName, (Route<dynamic> route) => false,
                                  arguments: {'matricula': matricula,'nombre':nombre, 'paterno':appaterno,'materno':apmaterno,});
                                },
                              ),
                            ],
                          );
                          showDialog(context: context,barrierDismissible: false, 
                            builder: (context)=> ZoomIn(child: WillPopScope(onWillPop: _noretorno, child: alertDialog))
                          );
                        }
                      },
                    ),
                    
                  ],
                ),
              )

              
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _noretorno() {
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
        content: Text("Acceso denegado", textAlign: TextAlign.center,style: Theme.of(context).textTheme.body2,),
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