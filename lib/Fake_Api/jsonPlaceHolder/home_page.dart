

import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/api.dart';
import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/model.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  List<Model> model =[];

  Api api = Api();

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
      appBar: AppBar(
        title: Text('Fake Api',)
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50,),
            model.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                  height: double.maxFinite,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: model.length,
                      physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير إذا لزم الأمر
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final post = model[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Stack(
                              children: [
                                // Container(
                                //   width: 50.0,
                                //   height: 50.0,
                                //   decoration: BoxDecoration(
                                //     color: Colors.blue, // لون الحاوية
                                //     shape: BoxShape.circle, // يجعل الحاوية دائرية
                                //   ), ),
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(post.id.toString() , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                            title: Text(post.title2.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(post.body2.toString()),
                            trailing: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: Text(post.userId.toString() ,
                                    style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                              ),
                  ),
                ),
          ],
        ),
      ),

    );
  }
}
