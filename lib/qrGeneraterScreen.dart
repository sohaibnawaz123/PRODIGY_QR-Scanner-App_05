import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/grScannerScreen.dart';

class QRGeneraterScreen extends StatefulWidget {
  const QRGeneraterScreen({super.key});

  @override
  State<QRGeneraterScreen> createState() => _QRGeneraterScreenState();
}

class _QRGeneraterScreenState extends State<QRGeneraterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.blue,
        title: const Text('QR Generater',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w900),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(child: const Icon(Icons.qr_code_scanner,color: Colors.white,size: 30,),onTap: ()=>Get.offAll(const QrScannerScreen()),),
        )
      ],),
    );
  }
}