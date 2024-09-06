// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/qrGeneraterScreen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String result = "No Qr Found";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'QR Scanner',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                child: const Icon(
                  Icons.qr_code_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                onTap: () => Get.to(const QRGeneraterScreen()),
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: Get.width - 50,
            height: Get.width - 50,
            color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(result,style: const TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
                ElevatedButton(
                    onPressed: () {
                      startScan();
                    },
                    child: const Text('Start Scan'))
              ],
            ),
          ),
        ));
  }

  void startScan() async {
    var scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF', 'Cancel', true, ScanMode.QR);
      if (scanResult != -1) {
        setState(() {
          result = scanResult.toString();
        });
      } else {
        setState(() {
          result = 'No Qr Found';
        });
      }
    } on PlatformException catch (e) {
      scanResult = 'Platform Error Occur';
      Get.snackbar('PlatForm Error', e.code,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      scanResult = 'Error Occur';
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
    if (!mounted) {
      return;
    }
  }
}
