import 'package:flutter/material.dart';

import '../video_call.dart';

class JoinWithCode extends StatelessWidget {
  static const String routeName = 'joinWithCode';
  final conferenceController = TextEditingController();

  jumpToMeetingPage(BuildContext context, {required String conferenceId}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoCall(
        conferenceId:conferenceId
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: Icon(Icons.arrow_back_ios_new_sharp, size: 35),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 50),
            Image.network(
              "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
              fit: BoxFit.cover,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: conferenceController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Example : abc-efg-dhi"),
                ),
              ),
            ),
            ElevatedButton(
          onPressed: () => jumpToMeetingPage(context,
        conferenceId: conferenceController.text),

              child: Text("Join"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(50, 30),
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}