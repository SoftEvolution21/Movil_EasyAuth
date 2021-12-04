import 'package:easyauth/componentes/carousel.dart';
import 'package:easyauth/componentes/header.dart';
import 'package:easyauth/src/menu.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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

      body:  ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[

            Stack(
              children: [
                Cabecera(),
                _textos(context),
                //FadeInUp(child: Carousel()),
                FadeInUp(child: Carousel()),
              ],
            ),
            SizedBox(height: 10.0,),
            _informacion(context),

          ],
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

        BounceInLeft(
          child: Text(
            '¡Bienvenido!',
            style: TextStyle(color:Colors.white, fontSize: 22.0, fontFamily: 'poppins'),
          ),
        ),
        SizedBox(height: 15.0,),
        BounceInRight(
          child: Text(
            'Tramita tus permisos online',
            style: TextStyle(color:Colors.white, fontSize: 18.0, fontFamily: 'poppins'),
          ),
          //delay: Duration(seconds: 3),
          //duration: Duration(seconds: 5),
          //infinite: true,
        )
      ],
    ),
  );
}

Widget _informacion(BuildContext context){
  return Column(

    children: <Widget>[

      FadeInLeft(
        delay: Duration(seconds: 1),
        child: Stack(
          children: [
            FondoTxt(),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5.0, right: 1.0, left: 15.0),
                  child: Icon(Icons.beenhere, color: Theme.of(context).scaffoldBackgroundColor),
                ),

                 Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5.0, right: 5.0, left: 10.0),
                  child: Text('Misión',style: TextStyle(color:Colors.white, fontFamily: 'poppins',fontSize: 19.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
           
          ],
        ),
      ),
      SizedBox(height: 8.0,),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ZoomIn(
          delay: Duration(seconds: 2),
          child: Card(
            color: Theme.of(context).primaryColorLight,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Colaborar con las Empresas e Instituciones en alcanzar sus objetivos en forma eficaz y eficiente, a través del desarrollo de software que mejor se adapten a su realidad, y los servicios profesionales necesarios para optimizar la utilización de las mismas.',
                    style: Theme.of(context).textTheme.body2,textAlign: TextAlign.justify,
                  ),
                  //leading: Icon(Icons.beenhere, color: Theme.of(context).primaryColorDark,),
                ),
              ],
            ),
          ),
        ),
      ),

      SizedBox(height: 50.0,),
      FadeInLeft(
        delay: Duration(seconds: 1),
        child: Stack(
          children: [
            FondoTxt(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5.0, right: 1.0, left: 15.0),
                  child: Icon(Icons.visibility_outlined, color: Theme.of(context).scaffoldBackgroundColor),
                ),
                
                 Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5.0, right: 5.0, left: 10.0),
                  child: Text('Visión',style: TextStyle(color:Colors.white, fontFamily: 'poppins',fontSize: 19.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ), 
      SizedBox(height: 8.0,),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ZoomIn(
          delay: Duration(seconds: 2),
          child: Card(
            color: Theme.of(context).primaryColorLight,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Theme.of(context).primaryColor)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Ser reconocidos en toda la república mexicana como la compañía líder del desarrollo de software, que ofrece los más altos niveles de excelencia, profesionalismo, integridad y lealtad, superando las expectativas de sus clientes y socios de negocios.',
                    style: Theme.of(context).textTheme.body2,textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 50.0,),

    ],

  );
}
