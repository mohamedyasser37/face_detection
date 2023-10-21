import 'package:flutter/material.dart';

class TestCamera extends StatefulWidget {
  const TestCamera({Key? key}) : super(key: key);

  @override
  State<TestCamera> createState() => _TestCameraState();
}

class _TestCameraState extends State<TestCamera> {
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
