import 'package:flutter/material.dart';

class Cabecera extends StatelessWidget {
  //const Cabecera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Container(
        height: 250,
        width: double.infinity,//para abarcar todo lo ancho
        child: CustomPaint(
          painter: _HeaderPainter(),
        ),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    lapiz.color = Color.fromRGBO(40, 66, 147, 1.0);
    lapiz.style = PaintingStyle.fill;

    //dibujamos el diseño 
    final path = new Path();
    path.lineTo(0, size.height*0.7);
    path.lineTo(size.width*0.2, size.height*0.5);
    path.lineTo(size.width, size.height*0.5);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => true;

  /*@override
  bool shouldRebuildSemantics(_HeaderPainter oldDelegate) => false;*/
}

class FondoTxt extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Container(
        height: 35,
        width: double.infinity,//para abarcar todo lo ancho
        child: CustomPaint(
          painter: _Painter2(),
        ),
        //color: Colors.cyan,
      ),
    );
  }
}

class _Painter2 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();
    //lapiz.color = Color.fromRGBO(40, 66, 147, 1.0);
    lapiz.color = Color.fromRGBO(17, 97, 172, 1.0);
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(size.width*0.02,0);
    path.lineTo(size.width*0.3,0);
    path.lineTo(size.width*0.35, size.height*0.5);
    path.lineTo(size.width*0.3, size.height);
    path.lineTo(size.width*0.02, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(_Painter2 oldDelegate) => true;

  /*@override
  bool shouldRebuildSemantics(_Painter2 oldDelegate) => false;*/
}