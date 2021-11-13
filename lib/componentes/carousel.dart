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
            child: Image(image: AssetImage('assets/img/EasyAuth2.png')),
          ),
        ),
      ],
    );
  }


}