import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/loginscreen.dart';
import 'package:hieroglyphic_app/compenets/cashe_helper.dart';
import 'package:hieroglyphic_app/screens/favorite_screen.dart';
import 'package:hieroglyphic_app/screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/screens/list_screen.dart';
import 'package:hieroglyphic_app/screens/more_screen.dart';
import 'package:hieroglyphic_app/screens/onBoarding_Screen.dart';

import 'firebase_options.dart';

List<CameraDescription>? camera;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? Login = CacheHelper.getData(key: 'Login');
  print(Login);

  if (onBoarding != null) {
    if (Login != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        FavoriteScreen.routeName: (context) => const FavoriteScreen(),
        ListScreen.routeName: (context) => const ListScreen(),
        MoreScreen.routeName: (context) => const MoreScreen(),
      },
      home: startWidget,
    );
  }
}
