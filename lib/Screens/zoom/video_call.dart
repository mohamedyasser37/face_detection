import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCall extends StatelessWidget {
  static const String routeName = 'videoCall';

  final AgoraClient client=AgoraClient(agoraConnectionData: AgoraConnectionData(
    appId: "467a9df789894293a1dbcb4b9637fb77",
    tempToken: "007eJxTYAjZ6rAstvvQq18V71Qer+Yp8rhf8lQlpH9yvdP++anlrS8VGEzMzBMtU9LMLSwtLE2MLI0TDVOSkpNMkizNjM3TkszNd/nlpzYEMjK4fVzCwsgAgSA+C0NJanEJAwMA8bshsA==",
  channelName: "test"
  ),
  enabledPermission: [
    Permission.camera,
      Permission.microphone,
      ]);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client)
          ],
        ),
      ),
    );
  }
}










// class VideoCall extends StatefulWidget {
//   String channelName = "test";
//
//   VideoCall({required this.channelName});
//   @override
//   _VideoCallState createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//   //late final AgoraClient _client;
//   bool _loading = true;
//   String tempToken = "";
//
//   @override
//   void initState() {
//     getToken();
//     super.initState();
//   }
//
//   Future<void> getToken() async {
//     String link =
//         "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${widget.channelName}";
//
//     Response _response = await get(Uri.parse(link));
//     Map data = jsonDecode(_response.body);
//     setState(() {
//       tempToken = data["token"];
//     });
//     // _client = AgoraClient(
//     //     agoraConnectionData: AgoraConnectionData(
//     //       appId: "843077704d2f4d19a7ed336afaa0c2ca",
//     //       tempToken: tempToken,
//     //       channelName: widget.channelName,
//     //     ),
//     //     enabledPermission: [Permission.camera, Permission.microphone]);
//     Future.delayed(Duration(seconds: 1)).then(
//           (value) => setState(() => _loading = false),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: _loading
//             ? Center(
//           child: CircularProgressIndicator(),
//         )
//             : Stack(
//           children: [
//             // AgoraVideoViewer(
//             //   client: _client,
//             // ),
//             // AgoraVideoButtons(client: _client)
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }