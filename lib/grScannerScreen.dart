import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/qrGeneraterScreen.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('QR Scanner',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w900),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(child: const Icon(Icons.qr_code_sharp,color: Colors.white,size: 30,),onTap: ()=>Get.to(const QRGeneraterScreen()),),
        )
      ],),
    );
  }
}