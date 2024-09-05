// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/grScannerScreen.dart';

class QRGeneraterScreen extends StatefulWidget {
  const QRGeneraterScreen({super.key});

  @override
  State<QRGeneraterScreen> createState() => _QRGeneraterScreenState();
}

class _QRGeneraterScreenState extends State<QRGeneraterScreen> {
  TextEditingController qrText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'QR Generater',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 30,
              ),
              onTap: () => Get.offAll(const QrScannerScreen()),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            qrText.text.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: const Text(
                      'Enter The data in TextFeild',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                : QrImageView(
                    data: qrText.toString(),
                    version: QrVersions.auto,
                    size: Get.width * 0.6,
                  ),
            SizedBox(
              height: Get.height / 20,
            ),
            TextField(
              controller: qrText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  hintText: "https://etc",
                  label: const Text(
                    'Enter The Text',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue, width: 3)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 55, 110, 155), width: 3)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue, width: 3))),
            ),
          ],
        ),
      ),
    );
  }
}
