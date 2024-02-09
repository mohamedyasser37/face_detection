import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/generated/l10n.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';

import '../compenets/cashe_helper.dart';
import '../compenets/constant/colors.dart';
import '../compenets/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      width: MediaQuery.of(context).size.width*0.62,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
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
            leading: const Icon(
              Icons.person_pin,
              color: AppColor.primaryColor,
            ),
            title: Text(
              "${CacheHelper.getData(key: 'name')}",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: AppColor.primaryColor,
            ),
            title: InkWell(
              onTap: () {
                HomeCubit.get(context).logOut(context);
              },
              child: Text(
                AppLocalizations.of(context)!.logOut,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: AppColor.primaryColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.setting,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(HomeCubit.get(context).isEnglish
                  ? 'Light Mode'
                  : 'الوضع العادي'),
              Switch(
                activeColor: AppColor.primaryColor,
                value: HomeCubit.get(context).isDark ? true : false,
                onChanged: (enabled) {
                  HomeCubit.get(context).changeMode();
                },
              ),
              Text(HomeCubit.get(context).isEnglish
                  ? 'Dark Mode'
                  : 'الوضع الليلي'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(HomeCubit.get(context).isEnglish ? 'Arabic' : 'عربي'),
              Switch(
                activeColor: AppColor.primaryColor,
                value: HomeCubit.get(context).isEnglish ? true : false,
                onChanged: (enabled) {
                  HomeCubit.get(context).changeLanguage();
                },
              ),
              Text(HomeCubit.get(context).isEnglish ? 'ُEnglish' : 'انجليزي'),
            ],
          ),
        ],
      ),
    );
  }
}
