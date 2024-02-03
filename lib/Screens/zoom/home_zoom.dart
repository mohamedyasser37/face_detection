import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/Screens/zoom/new_meeting.dart';

import 'join_with_code.dart';

class HomeZoom extends StatelessWidget {
  const HomeZoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Video Conference"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, NewMeeting.routeName);
            },
            icon: Icon(Icons.add),
            label: Text("New Meeting"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 30),
              primary: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 30,
          indent: 40,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: OutlinedButton.icon(
            onPressed: () {
             // Get.to(JoinWithCode());
              Navigator.pushNamed(context, JoinWithCode.routeName);
            },
            icon: Icon(Icons.margin),
            label: Text("Join with a code"),
            style: OutlinedButton.styleFrom(
              primary: Colors.indigo,
              side: BorderSide(color: Colors.indigo),
              fixedSize: Size(350, 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
        ),
        SizedBox(height: 50),
        Image.asset('assets/images/zoom.png'),

      ]),
    );
  }
}
