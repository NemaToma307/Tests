//
//
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:firebasetesting/barcode/scan.dart';
// import 'package:flutter/material.dart';
//
// class HomePageBarcode extends StatefulWidget {
//
//   @override
//   State<HomePageBarcode> createState() => _HomePageBarcodeState();
// }
//
// class _HomePageBarcodeState extends State<HomePageBarcode> {
//
//   var qrStr='Add data';
//
//   void _show(BuildContext ctx) {
//     showModalBottomSheet(
//         elevation: 10,
//         backgroundColor: Colors.blueGrey,
//         context: ctx,
//         builder: (ctx) => Container(
//           width: 300,
//           height: 250,
//           color: Colors.white54,
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               BarcodeWidget(data: qrStr, barcode: Barcode.qrCode(),color: Colors.blueAccent,),
//               Container(
//                 alignment: Alignment.center,
//                 width: MediaQuery.of(context).size.width*8,
//                 child: TextField(
//                   onChanged: (val){
//                     setState(() {
//                       qrStr = val;
//                     });
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Write here',
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black
//                       )
//                     )
//                   ),
//
//                 ),
//               )
//             ],
//           )
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page Barcode '),
//       ),
//       body: Center(
//         child : Column(
//           children: [
//             ElevatedButton(
//                 onPressed:() => _show(context),
//                 child: Text('Creat Barcode')
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//                 onPressed: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> scanScreen()));
//
//                 },
//                 child: Text('Generate Barcode')
//             )
//           ],
//         )
//
//       ),
//     );
//   }
// }
