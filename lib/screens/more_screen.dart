  import 'package:flutter/material.dart';

  class MoreScreen extends StatelessWidget {
    static const String routeName='more';

    const MoreScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(backgroundColor: Colors.blue,title: Text("MoreScreen"),),
      );
    }
  }
