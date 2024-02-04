import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';

import '../compenets/constant/colors.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Image.asset('assets/images/logo.png'),
                  radius: 50,
                 backgroundColor: Colors.white,
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_pin,
              color: AppColor.primaryColor,
            ),
            title: Text(
              "Private information",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color:AppColor.primaryColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color:AppColor.primaryColor,
            ),
            title: Text(
              "settings",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(HomeCubit.get(context).isEnglish?'Light Mode':'الوضع العادي'),
              Switch(
                activeColor: AppColor.primaryColor,
                value: HomeCubit.get(context).isDark ? true : false,
                onChanged: (enabled) {
                  HomeCubit.get(context).changeMode();
                },
              ),
              Text(HomeCubit.get(context).isEnglish?'Dark Mode':'الوضع الليلي'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(HomeCubit.get(context).isEnglish? 'Arabic':'عربي'),
              Switch(
                activeColor: AppColor.primaryColor,
                value: HomeCubit.get(context).isEnglish ? true : false,
                onChanged: (enabled) {
                  HomeCubit.get(context).changeLanguage();
                },
              ),
              Text(HomeCubit.get(context).isEnglish? 'ُEnglish':'انجليزي'),
            ],
          ),
        ],
      ),
    );
  }
}
