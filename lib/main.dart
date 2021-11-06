import 'package:flutter/material.dart';
import 'package:qrcode_scanner_2022/homepage.dart';
import 'package:qrcode_scanner_2022/pages/qr_create_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigationBar()
    );
  }
}

