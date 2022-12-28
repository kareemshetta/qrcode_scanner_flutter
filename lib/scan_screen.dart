// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class ScanScreen extends StatefulWidget {
//   const ScanScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }
//
// class _ScanScreenState extends State<ScanScreen> {
//   var str = 'hi';
//
//   Future<void> scanQr() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       setState(() {
//         str = barcodeScanRes;
//       });
//     } catch (e) {
//       setState(() {
//         str = 'unable to scan';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child:
//           Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         Text(str),
//         ElevatedButton(
//           onPressed: scanQr,
//           child: Text('scan qr'),
//         )
//       ]),
//     ));
//   }
// }
