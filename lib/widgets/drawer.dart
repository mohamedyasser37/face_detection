import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar( radius: 50 ,child: CircleAvatar(),)
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_pin,color:Colors.blue,),
            title:  Text("Private information",style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary ),),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.blue,),
            title:  Text("settings",style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.primary ),),
          ),

        ],
      ),
    );
  }
}
