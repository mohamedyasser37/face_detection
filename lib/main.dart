import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/Screens/register_screen/register_screen.dart';
import 'package:hieroglyphic_app/screens/favorite_screen.dart';
import 'package:hieroglyphic_app/screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/screens/list_screen.dart';
import 'package:hieroglyphic_app/screens/more_screen.dart';

import 'Screens/loginscreen/loginscreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName :(context) => HomeScreen(),
        FavoriteScreen.routeName :(context) => FavoriteScreen(),
        ListScreen.routeName :(context) => ListScreen(),
        MoreScreen.routeName :(context) => MoreScreen(),
      },
      home:  HomeScreen(),
    );
  }
}


