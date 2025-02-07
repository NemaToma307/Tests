

import 'dart:async';
import 'dart:math';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/api.dart';
import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_hover_effect/flutter_hover_effect.dart';

class homePageCarouselSlider extends StatefulWidget {

  @override
  State<homePageCarouselSlider> createState() => _homePageCarouselSliderState();
}

class _homePageCarouselSliderState extends State<homePageCarouselSlider>  with SingleTickerProviderStateMixin{

  List<Model> model =[];

  Api api = Api();

  List<Color> primaryColors = const [
    Colors.white,
    Colors.pinkAccent,
    Colors.pink,
  ];
  List<Color> secondaryColors = const [
    Colors.blue,
    Colors.blueAccent,
    Colors.white,
  ];


  @override
  void initState()  {
    super.initState();

    gg();
  }


  gg() async{
    final info = await  api.getAllData();
    print("get02");
    setState(() {
      this.model = info.map((e) => Model.fromMap(e)).toList();
    });


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     // backgroundColor:  Colors.blue,
      appBar: AppBar(
          title: Text('Fake Api',)
      ),
      body: AnimateGradient(
        primaryBeginGeometry: const AlignmentDirectional(0, 1),
        primaryEndGeometry: const AlignmentDirectional(0, 2),
        secondaryBeginGeometry: const AlignmentDirectional(2, 0),
        secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
        textDirectionForGeometry: TextDirection.rtl,
        primaryColors: primaryColors,
        secondaryColors: secondaryColors,
        child: CarouselSlider(
          slideIndicator:CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 50),
          ) ,
          slideTransform: CubeTransform(),
          unlimitedMode: true,
          children: [
            if (model.isEmpty) const Center(child: CircularProgressIndicator()) else
              for(var i  = 0 ; i< model.length  ; i++)
                 Center(
                   child: HoverEffect(
                     boxShadowColor: Colors.brown,
                     boxShadowBlurRadius: 16.0,
                     amplitude: 4.5,
                     returnOriginalPosition: false,
                     widget:  SizedBox(
                       height: 1200,
                       width: 50,
                       child: Container(
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ),
          ],

        ),
      ),

    );
  }
}
