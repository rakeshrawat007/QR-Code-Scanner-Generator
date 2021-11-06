import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatePage extends StatefulWidget {
  const QRCreatePage({Key? key}) : super(key: key);

  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            QrImage(
              backgroundColor: Colors.white,
            data: controller.text,
            size: 200.0,
          ),
              SizedBox(
                height: 40,
              ),
              buildTextFiedl(context),
            ],
          ),
        ),
      ),
    );
  }
Widget buildTextFiedl(BuildContext context)=>TextField(
  controller: controller,
  style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  decoration:  InputDecoration(
    hintText: "Enter the data",
        hintStyle: TextStyle(
      color: Colors.grey,
  ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Theme.of(context).accentColor,
      )
    ),
    suffixIcon: IconButton(
      color: Theme.of(context).accentColor,
      icon: Icon(Icons.done,size:30), onPressed: () {
        setState(() {
        });
    },
    )
  ),
);

}
