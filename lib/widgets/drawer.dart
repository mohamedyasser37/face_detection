import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/screens/home_screen/cubit/home_cubit.dart';

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
          const DrawerHeader(
            padding:EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: CircleAvatar(),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin,color:Colors.blue,),
            title:  Text("Private information",style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary ),),
          ),
          ListTile(
            leading: const Icon(Icons.settings,color: Colors.blue,),
            title:  Text("settings",style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary ),),
          ),
        ],
      ),
    );
  }
}
