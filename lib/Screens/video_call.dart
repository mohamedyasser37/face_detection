
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hieroglyphic_app/Screens/zoom/new_meeting.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';


class VideoCall extends StatelessWidget {
  final String conferenceId;
  VideoCall({super.key, required this.conferenceId});
  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_SIGIN');
  final controller = ZegoUIKitPrebuiltVideoConferenceController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltVideoConference(
            appID: appID ,
            appSign: appSign.toString() ,
            userID: userId,
            conferenceID: conferenceId,
            controller: controller,
            config: ZegoUIKitPrebuiltVideoConferenceConfig(
              background:Text(""),

              leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
                title: "Leave the conference",
                message: "Are you sure to leave the conference?",
                cancelButtonName: "Cancel",
                confirmButtonName: "Confirm",
              ),

              avatarBuilder: (BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
                return user != null
                    ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://your_server/app/avatar/${user.id}.png',
                      ),
                    ),
                  ),
                )
                    : const SizedBox();
              },
            ),
            userName: 'user_ $userId',
            ),
        );
    }
}