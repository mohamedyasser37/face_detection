import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  static const String routeName='list';

  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(backgroundColor: Colors.blue,title: const Text("ListScreen")),
    );
  }
}
