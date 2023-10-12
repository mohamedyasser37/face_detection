import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  static const String routeName='favorite';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.red,
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("FavoriteScreen")),
    );
  }
}
