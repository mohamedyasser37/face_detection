import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../compenets/constants.dart';
import '../../main.dart';
import '../video_call.dart';

final String userId = Random().nextInt(900000 + 100000).toString();
final String randomConferenceId = Random()
    .nextInt(100000000 * 10 + Random().nextInt(10))
    .toString()
    .padLeft(10, '0');
class NewMeeting extends StatefulWidget {
  static const String routeName = 'NewMeeting';

  NewMeeting({Key? key}) : super(key: key);

  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  String name = '';
  jumpToMeetingPage(BuildContext context, {required String conferenceId}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoCall(
        conferenceId:conferenceId
    )));
  }

  @override
  void initState() {

    super.initState();

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
            Image.asset(
              "assets/images/zoom2.png",
              fit: BoxFit.cover,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: SelectableText(
                      randomConferenceId,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(Icons.copy),
                  )),
            ),
            Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
            ElevatedButton.icon(
              onPressed: () {
               // Share.share("Meeting Code : $_meetingCode");
              },
              icon: Icon(Icons.arrow_drop_down),
              label: Text("Share invite"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 30),
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed:() {
                jumpToMeetingPage(context,
                    conferenceId: randomConferenceId) ;



              },

               icon: Icon(Icons.video_call),
               label: Text("start call"),
               style: OutlinedButton.styleFrom(
                primary: Colors.indigo,
                side: BorderSide(color: Colors.indigo),
                fixedSize: Size(350, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ), ),


          ],
        ),
      ),
    );
  }
  void resultsCounter(String output) {


    switch (output) {
      case "0 angry":
        angry++;
        break;

      case "1 disgust":
        disgust++;

        break;

      case "2 fear":
        fear++;

        break;

      case "3 happy":
        happy++;

        break;

      case "4 neutral":
        neutral++;
        break;
      case "5 sad":
        sad++;


        break;
      case "6 surprise":
        surprise++;
        break;

      default:

        break;
    }
    print('----------------------------------------------------');
    print('----------------------------------------------------');
    print('----------------------------------------------------');
    print("angry $angry");
    print("disgust $disgust");
    print("fear $fear");
    print("happy $happy");
    print("neutral $neutral");
    print("sad $sad");
    print("surprise $surprise");
    print("sumOfResults $sumOfResults");
    print('----------------------------------------------------');
    print('----------------------------------------------------');
    print('----------------------------------------------------');

    sumOfResults = angry + disgust + fear + happy + neutral + sad + surprise;

  }

}