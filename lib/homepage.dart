import 'package:flutter/material.dart';
import 'package:qrcode_scanner_2022/helper/ad_helper.dart';
import 'package:qrcode_scanner_2022/pages/qr_create_page.dart';
import 'package:qrcode_scanner_2022/pages/qr_scan_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyNavigationBar extends StatefulWidget {

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  bool _isBottomBannerAdLoaded = false;
  late BannerAd _bottomBannerAd;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    QRScanPage(),
    QRCreatePage(),
  ];

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createBottomBannerAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bottomBannerAd.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isBottomBannerAdLoaded
      ? Container(
      height: _bottomBannerAd.size.height.toDouble(),
      width: _bottomBannerAd.size.width.toDouble(),
      child: AdWidget(ad: _bottomBannerAd),
    )
        : null,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(

        child: BottomNavigationBar(
            showUnselectedLabels: true,

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.create,size: 20,),
                  title: Text('QR Generator'),
                  backgroundColor: Colors.blueAccent
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_sharp,size: 20,),
                  title: Text('QR Scanner'),
                  backgroundColor: Colors.blueAccent
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5
        ),
      ),
    );
  }
}