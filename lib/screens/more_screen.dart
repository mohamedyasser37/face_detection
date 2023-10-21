import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TestCamera extends StatefulWidget {
  static const String routeName='more';

  @override
  State<TestCamera> createState() => _TestCameraState();
}

class _TestCameraState extends State<TestCamera> {

  void loadModel(){
    Tflite.close();

  }


  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera '),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}