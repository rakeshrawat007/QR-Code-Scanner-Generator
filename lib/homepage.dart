import 'package:flutter/material.dart';
import 'package:qrcode_scanner_2022/pages/qr_create_page.dart';
import 'package:qrcode_scanner_2022/pages/qr_scan_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyNavigationBar extends StatefulWidget {

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  late BannerAd _bottomBannerAd;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   QRCreatePage(),
    QRScanPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.create),
                title: Text('QR Generator'),
                backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_sharp),
                title: Text('QR Scanner'),
                backgroundColor: Colors.blueAccent
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}