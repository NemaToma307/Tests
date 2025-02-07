

import 'package:firebasetesting/Fake_Api/dummyjson/comments/api.dart';
import 'package:firebasetesting/Fake_Api/dummyjson/comments/model.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  ApiComments apiComments = ApiComments();

 // Map<String, dynamic>? model ;
  CommentResponse? commentResponse;

  @override
  void initState() {
    super.initState();
    gg();
  }

  gg() async {

    Map<String, dynamic> info = await  apiComments.getAllDataComments();
    print("get02");
    setState(() {
       this.commentResponse = CommentResponse.fromJson(info);
      //this.model = info  ;
    });

    for(var i =0 ; i<3 ; i++){
      print(commentResponse!.comments[i].postId);
      print('**************************');
      print(commentResponse!.comments[i].likes);


    }

   // print('object *************************** ${model.toString()}');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Comment page '),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50,),
            commentResponse == null ? Center(child: CircularProgressIndicator()) :
            SizedBox(
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: commentResponse!.comments.length,
                    physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير إذا لزم الأمر
                    shrinkWrap: true,
                    itemBuilder: (context , index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                decoration : BoxDecoration(
                                  color: Colors.white, // Background color
                                  border: Border.all(color: Colors.black38, width: 2), // Border color and width
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey, // Shadow color
                                      spreadRadius: 2, // How much the shadow spreads
                                      blurRadius: 3, // Softness of the shadow
                                      offset: Offset(0, 1), // Shadow position (x, y)
                                    ),
                                  ],
                                ),
                              child:  Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children:[
                                            CircleAvatar(
                                              radius: 30,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                    colors: [Colors.purple, Colors.pink], // Gradient colors
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  border: Border.all(color: Colors.white, width: 1), // Border color & width
                                                  borderRadius: BorderRadius.circular(32), // Rounded corners
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.3), // Shadow color
                                                      spreadRadius: 2, // Spread of the shadow
                                                      blurRadius: 5, // Softness of the shadow
                                                      offset: Offset(0, 4), // Position of the shadow
                                                    ),
                                                  ],

                                                ),
                                              ),
                                            ),
                                            dataPost(commentResponse!.comments[index].user!.fullName.toString() , index , 15 ,FontWeight.bold , 10),
                                            ]
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Stack(children:[
                                                CircleAvatar(
                                                  backgroundColor: Colors.blue.shade900,
                                                  radius: 19,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.blue.shade900,
                                                    radius: 17,
                                                    child:  Text(commentResponse!.comments[index].postId.toString(),
                                                      style: TextStyle(color: Colors.white ,  fontSize: 13),),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                              child: Stack(
                                                  children:[
                                                    CircleAvatar(
                                                      backgroundColor: Colors.green.shade900,
                                                      radius: 19,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors.white,
                                                        radius: 18,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(2.0),
                                                      child: CircleAvatar(
                                                          backgroundColor: Colors.green.shade900,
                                                          radius: 17,
                                                          child: Text(commentResponse!.comments[index].commentId.toString() ,
                                                            style: TextStyle(color: Colors.white , fontSize: 13),)
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  dataPost(commentResponse!.comments[index].body.toString() , index, 14 ,FontWeight.normal , 0),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.favorite , color: Colors.red,),
                                        SizedBox(width: 15,),
                                        dataPost(commentResponse!.comments[index].likes.toString() , index, 14 ,FontWeight.bold , 0),
                                      ],
                                    ),
                                  ),

                                ],
                              )
                                              ),
                        ),
                      ],
                    );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}

Widget dataPost (String text , int index , double size , FontWeight weight , double padding){
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Text(text , style: TextStyle(
        fontWeight: weight, fontSize: size,
    ),),
  );

}



