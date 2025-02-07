//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class scanScreen extends StatefulWidget {
//
//   @override
//   State<scanScreen> createState() => _scanScreenState();
// }
//
// class _scanScreenState extends State<scanScreen> {
//
//   var height ;
//   var width ;
//
//   var qr = 'lets scan';
//
//   @override
//   Widget build(BuildContext context) {
//
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scanning'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(qr , style: TextStyle(color: Colors.red),),
//             ElevatedButton(onPressed: scanQr, child: Text('Scanned')),
//             SizedBox(height: height, width: width,)
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Future<void> scanQr() async {
//     try{
//
//       FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
//
//         setState(() {
//           qr = value;
//         });
//       });
//
//     }catch(e){
//       setState(() {
//         qr='unable scan';
//       });
//
//     }
// }
//
// }
