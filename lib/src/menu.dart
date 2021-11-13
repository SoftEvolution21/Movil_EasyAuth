import 'package:easyauth/src/home.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  //const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: Colors.grey[400],
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: <Widget>[

            /*DrawerHeader(//Opcion 1
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/img/UTS4.png'),
                  ),
                  /*SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'EasyAuth', 
                    style: TextStyle(fontSize: 30.0),
                  )*/
                ],
              ),
            )*/

            DrawerHeader(//opción 2
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child:Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/img/EasyAuth2.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Soft Evolution',style: TextStyle(
                        color: Colors.white, fontSize: 20.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .4),
                    child: Text(
                      'S.A de C.V', style: TextStyle(
                        color: Colors.white, fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              )
            ),

            Divider(),
            ListTile(
              leading: Icon(Icons.home, color: Theme.of(context).primaryColorDark,),
              title: Text('Inicio', style: Theme.of(context).textTheme.body2,),
              onTap: () => Navigator.pushReplacementNamed(context, HomePage.routName),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login, color: Theme.of(context).primaryColorDark,),
              title: Text('Login',style: Theme.of(context).textTheme.body2,),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_mail_sharp, color: Theme.of(context).primaryColorDark,),
              title: Text('Contáctanos', style: Theme.of(context).textTheme.body2,),
            ),
          ],
        ),
      ),
    );
  }
}