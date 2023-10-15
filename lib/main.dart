import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/Screens/register_screen/register_screen.dart';
import 'package:hieroglyphic_app/screens/favorite_screen.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:hieroglyphic_app/screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/screens/list_screen.dart';
import 'package:hieroglyphic_app/screens/more_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/loginscreen/loginscreen.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=HomeCubit.get(context);

          return MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line

              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Spanish
            ],
            locale:cubit.isEnglish?Locale('en'): Locale('ar'),
            debugShowCheckedModeBanner: false,
            themeMode:
            cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    color: Colors.blue
                )
            ),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                    color: Colors.amber
                )
            ),

            initialRoute: HomeScreen.routeName,
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              FavoriteScreen.routeName: (context) => FavoriteScreen(),
              ListScreen.routeName: (context) => ListScreen(),
              MoreScreen.routeName: (context) => MoreScreen(),
            },
            home: HomeScreen(),
          );
        },
      ),
    );
  }




}


