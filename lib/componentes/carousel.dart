import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        reverse: true,
        viewportFraction: 0.90,
        height: 200.0
      ),

      items: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0, bottom: 20.0, top: 20.0),
          child: Container(
            child: Image(image: AssetImage('assets/img/SoftEvolution.png')),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 15.0, bottom: 20.0, top: 20.0),
          child: Container(
            child: CircleAvatar(//Envolverlo para agregarle un borde
              radius: 75.0,
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
        ),
      ],
    );
  }


}