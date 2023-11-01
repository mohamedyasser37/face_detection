



import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/main.dart';
import 'package:tflite/tflite.dart';

class TestReal extends StatefulWidget {
static const String routeName='realtime';
  @override
  State<TestReal> createState() => _TestRealState();
}

class _TestRealState extends State<TestReal> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() {
    cameraController = CameraController(camera![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel(); // runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plan) {
            return plan.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: .1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
          print(output);
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/models/model3.tflite',
        labels: 'assets/models/labels2.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test real'),),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .7,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!)),
              ),
            ),
            Text(
              output,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ]),
    );
  }}
























// import 'package:flutter/material.dart';
//
// class ListScreen extends StatelessWidget {
//   static const String routeName='list';
//
//   const ListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(backgroundColor: Colors.blue,title: Text("ListScreen")),
//     );
//   }
// }
