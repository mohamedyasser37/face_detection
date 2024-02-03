import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/Screens/first_page.dart';

class FavoriteScreen extends StatelessWidget {

  static const String routeName='favorite';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.red,
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("FavoriteScreen")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
          }, child: Text('Exit'))
        ]
      ),
    );
  }
}
