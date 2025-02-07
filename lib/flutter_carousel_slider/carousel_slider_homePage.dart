



import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class carouselSlider extends StatefulWidget {

  @override
  State<carouselSlider> createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white54,
      body: CarouselSlider(
        slideIndicator:CircularSlideIndicator(
          padding: EdgeInsets.only(bottom: 50),
        ) ,
        slideTransform: CubeTransform(),
        unlimitedMode: true,
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
