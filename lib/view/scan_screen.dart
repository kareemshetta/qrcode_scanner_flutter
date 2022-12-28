import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscanner/component/components.dart';
import 'package:qrscanner/controller/codes_cubit.dart';
import 'package:qrscanner/view/codes_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static const routeName = '/scan-screen';

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String str = 'hi';
  Future<void> scanQr() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      setState(()async {
        str = barcodeScanRes;
        print(str);
       await CodesCubit.get(context).addCode(code: barcodeScanRes);
        Navigator.of(context)
            .pushNamed(CodesScreen.routeName, arguments: barcodeScanRes);
      });
    } catch (e) {
      setState(() {
        str = 'unable to scan';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final str = 'daskhgd6565w';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 70,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(3)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.deepOrange,
                              width: 2.3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(3)),
                      margin: EdgeInsets.only(top: 15, right: 20),
                      child: Image.asset(
                        'asssets/images/menu-bar.png',
                        width: 20,
                        color: Colors.deepOrange,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Scan Qr Code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 84),
                  child: Text(
                    'Place qr code inside the frame to scan please avoid shake to get results quickly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffB9B9B9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 170,
                  height: 170,
                  child: QrImage(data: str, backgroundColor: Colors.white),
                ),
                Text(
                  'scanning code...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffB9B9B9),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_library_outlined,
                        color: Colors.grey[400],
                      ),
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.grey[400],
                      ),
                      Icon(
                        Icons.flash_on,
                        color: Colors.grey[400],
                      )
                    ],
                  ),
                ),
                defaultButton(
                    onPressed: scanQr,
                    buttonTitle: 'Place Camera Code',
                    color: Colors.deepOrangeAccent)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
