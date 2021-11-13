import 'package:easyauth/componentes/carousel.dart';
import 'package:easyauth/src/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static final String routName = 'Home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(40, 66, 147, 1.0),
        centerTitle: true,
        title: Text('EasyAuth', style: Theme.of(context).textTheme.title),
      ),
      drawer: Menu(),

      body: SafeArea(
        child: ListView(
          children: <Widget>[

           _textos(context),
            SizedBox(height:10.0),
            Carousel(),
            SizedBox(height: 40.0,),
            _informacion(context),

          ],
        ),
      ),
    );
  }
}

Widget _textos(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        Text(
          '¡Bienvenido!',
          style: Theme.of(context).textTheme.subtitle,
        ),
        Divider(),
        Text(
          'Tramita tus permisos online',
          style: Theme.of(context).textTheme.body2,
        )
      ],
    ),
  );
}

Widget _informacion(BuildContext context){
  return Column(

    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Card(
          color: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.beenhere, color: Theme.of(context).primaryColorDark,),
                title: Text('\nMisión',style: TextStyle(fontFamily: 'Benne',fontSize: 19.0, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  '\nColaborar con las Empresas e Instituciones en alcanzar sus objetivos en forma eficaz y eficiente, a través del desarrollo de software que mejor se adapten a su realidad, y los servicios profesionales necesarios para optimizar la utilización de las mismas.',
                  style: Theme.of(context).textTheme.body2,textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),

      SizedBox(height: 50.0,),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Card(
          color: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.visibility_outlined, color: Theme.of(context).primaryColorDark,),
                title: Text('\nVisión',style: TextStyle(fontFamily: 'Benne',fontSize: 19.0, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  '\nSer reconocidos en toda la república mexicana como la compañía líder del desarrollo de software, que ofrece los más altos niveles de excelencia, profesionalismo, integridad y lealtad, superando las expectativas de sus clientes y socios de negocios.',
                  style: Theme.of(context).textTheme.body2,textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 50.0,),

    ],

  );
}