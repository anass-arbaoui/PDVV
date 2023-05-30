import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_app/widgets/app-bar.dart';
import 'package:qr_code_app/widgets/scan-qr-code.dart';

void main() {
  runApp(MaterialApp(home: ScanQrCode()));
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String qrCodeValue = "";

//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Barcode Scanner - googleflutter.com'),
//           ),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Scanned Barcode Number",
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: 40,
//                     // Takes 80% of the screen width
//                     child: TextButton(
//                       onPressed: barcodeScanning,
//                       style: TextButton.styleFrom(
//                         backgroundColor: Color(0xff608EE9),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               10.0), // Radius for button borders
//                         ),
//                       ),
//                       child: Text(
//                         'Scanner le code Qr',
//                         style: TextStyle(
//                           color: Colors.white, // White text color
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   qrCodeValue,
//                   style: TextStyle(fontSize: 25, color: Colors.green),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   //scan barcode asynchronously
//   Future barcodeScanning() async {
//     try {
//       ScanResult barcode = await BarcodeScanner.scan();
//       setState(() => this.qrCodeValue = barcode.rawContent);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           this.qrCodeValue = 'Autorisez l\'utilisation de la caméra ';
//         });
//       } else {
//         setState(() => this.qrCodeValue = 'Unknown error: $e');
//       }
//     } on FormatException {
//       setState(() => this.qrCodeValue = 'Nothing captured.');
//     } catch (e) {
//       setState(() => this.qrCodeValue = 'Unknown error: $e');
//     }
//   }
// }
