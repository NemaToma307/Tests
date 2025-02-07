import 'package:flutter/material.dart';
import 'package:flutter_hover_effect/flutter_hover_effect.dart';


String mainFontFamily = "instagram";

class ExamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xff191d2d),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/o.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverEffect(
              height: 120,
              width: 170,
              boxShadowColor: Colors.brown,
              boxShadowBlurRadius: 16.0,
              amplitude: 4.5,
              returnOriginalPosition: false,
              widget: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background
                  borderRadius: BorderRadius.circular(10), // Optional rounded corners
                ),
                child:  Center(
                  child: Column(
                    children: [
                       Text(
                        'To The Lovely Man',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17.0, fontWeight: FontWeight.w600 , fontFamily: mainFontFamily),
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Save the Date ..' , style: TextStyle(fontFamily: mainFontFamily , color: Colors.black45,),),
                          Text('24-12-2024', style: TextStyle(fontFamily: mainFontFamily , color: Colors.black45,)),
                        ],
                      )
                    ],
                  ),
                ),),),
            const SizedBox(
              height: 56.0,
            ),
            // HoverEffect(
            //     padding: EdgeInsets.zero,
            //     boxShadowColor: Colors.purple,
            //     boxShadowBlurRadius: 16.0,
            //     amplitude: .5,
            //     returnOriginalPosition: false,
            //     height: 200,
            //     width: 200,
            //     backgroundColor: Colors.transparent,
            //     shape: BoxShape.circle,
            //     widget: Container(
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         image: DecorationImage(
            //           image: NetworkImage(
            //             'https://picsum.photos/250?image=9',
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),

    );
  }
}