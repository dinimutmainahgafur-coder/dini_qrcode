import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const QRCodeApp());
}

class QRCodeApp extends StatelessWidget {
  const QRCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR Code App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff2563EB),
        scaffoldBackgroundColor: const Color(0xffF5F7FA),
        fontFamily: "Roboto",
      ),
      home: const HomePage(),
    );
  }
}