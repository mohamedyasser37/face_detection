import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/Screens/chat_page/chatPage.dart';
import 'package:hieroglyphic_app/Screens/pdf/pdf.dart';
import 'package:hieroglyphic_app/Screens/pdf_screen/favorite_screen.dart';
import 'package:hieroglyphic_app/Screens/zoom/home_zoom.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../compenets/constant/colors.dart';
import '../../widgets/drawer.dart';


import '../test_model/test_camera.dart';
import '../test_real.dart';




class HomeScreen extends StatelessWidget {
  static const String routeName='home';

  @override
  Widget build(BuildContext context) {
    List<String> screensName=[
       AppLocalizations.of(context)!.homeTitle,
       AppLocalizations.of(context)!.testReal,
      AppLocalizations.of(context)!.testCamera,
       AppLocalizations.of(context)!.pdf,
       AppLocalizations.of(context)!.zoom,
      AppLocalizations.of(context)!.chat,


    ];

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title:  Text(screensName[cubit.currentIndex]),

            backgroundColor: AppColor.primaryColor,
            ),

          drawer: MainDrawer(

          ),

          bottomNavigationBar:
          CurvedNavigationBar(

           // buttonBackgroundColor:  Colors.white ,
            color:AppColor.primaryColor ,
            height: 50,

            backgroundColor: Colors.white.withOpacity(.8),
            items:cubit.bottomWidget,
            index: cubit.currentIndex,
            onTap: (index) {
            cubit.changeBottomNavBar(index,context);
            },
          ),
          body: tabs[cubit.currentIndex],


        );
      },
    );
  }

List<Widget> tabs=[FeedbackScreen(),TestReal(),TestCamera(),Pdf(),HomeZoom(),ChatPage()];
}


