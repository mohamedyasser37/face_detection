import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/screens/favorite_screen.dart';
import 'package:hieroglyphic_app/screens/first_page.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:hieroglyphic_app/screens/list_screen.dart';
import 'package:hieroglyphic_app/screens/more_screen.dart';

import '../../widgets/drawer.dart';




class HomeScreen extends StatelessWidget {
  static const String routeName='home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit=HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(" Home "), backgroundColor: Colors.blue,),

            drawer: MainDrawer(),

            bottomNavigationBar:
            CurvedNavigationBar(height: 50,

              backgroundColor: Colors.blue.withOpacity(.8),
              items:cubit.bottomWidget,
              index: cubit.currentIndex,

              onTap: (index) {

              cubit.changeBottomNavBar(index,context);
              },
            ),
            body: tabs[cubit.currentIndex],


          );
        },
      ),
    );
  }

List<Widget> tabs=[FirstPage(),FavoriteScreen(),ListScreen(),MoreScreen()];
}


