
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue.withOpacity(.4),
        items: [
          _buildNavigatincomponents(icon: Icons.home_outlined,desc: "Home",),
          _buildNavigatincomponents(icon: Icons.favorite_border_outlined,desc: "Favorite"),
          _buildNavigatincomponents(icon: Icons.list,desc: "List"),
          _buildNavigatincomponents(icon: Icons.more_vert_outlined,desc: "More"),
        ],
        onTap: (index) {
          setState(() {});
        },
      ),
      appBar: AppBar(title:const Text(" "),backgroundColor: Colors.blue,),
      drawer: MainDrawer(),
    );
  }
}






Column _buildNavigatincomponents({required IconData icon,required String desc}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 30,color: Colors.blue,),
      Text(desc),
    ],
  );
}