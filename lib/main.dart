import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/loginscreen.dart';
import 'package:hieroglyphic_app/Screens/pdf/pdf.dart';
import 'package:hieroglyphic_app/Screens/zoom/join_with_code.dart';
import 'package:hieroglyphic_app/compenets/cashe_helper.dart';
import 'package:hieroglyphic_app/screens/favorite_screen.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:hieroglyphic_app/screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/screens/onBoarding_Screen.dart';
import 'Screens/zoom/new_meeting.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<CameraDescription>? camera;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  camera = await availableCameras();
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  bool? Login = CacheHelper.getData(key: 'Login');
  print(onBoarding);
  print(Login);

  if (onBoarding != null) {
    if (Login != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  print(widget);
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return MaterialApp(

              title: 'Flutter Demo',
              localizationsDelegates: const [
                AppLocalizations.delegate, // Add this line

              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // arabic
            ],
            locale: cubit.isEnglish ? Locale('en') : Locale('ar'),
            debugShowCheckedModeBanner: false,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            theme:
                ThemeData(appBarTheme: const AppBarTheme(color: Colors.blue)),
            darkTheme:
                ThemeData(appBarTheme: const AppBarTheme(color: Colors.amber)),
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              FavoriteScreen.routeName: (context) =>  FavoriteScreen(),
              Pdf.routeName: (context) => Pdf(),
              JoinWithCode.routeName: (context) => JoinWithCode(),
              NewMeeting.routeName: (context) => NewMeeting(),

            },
            home: HomeScreen(),
          );
        },
      ),
      // initialRoute:HomeScreen.routeName ,
    );
  }
}
