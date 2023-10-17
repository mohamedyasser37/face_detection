import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/main.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  @override
  void initState() {
    super.initState();
    //loadCamera();
    // loadModel();
  }

  // loadCamera() {
  //   cameraController = CameraController(camera![0], ResolutionPreset.medium);
  //   cameraController!.initialize().then((value) {
  //     if (!mounted) {
  //       return;
  //     } else {
  //       setState(() {
  //         cameraController!.startImageStream((imageStream) {
  //           cameraImage = imageStream;
  //           print("1111111111111111111111");
  //           // runModel();
  //         });
  //       });
  //     }
  //   });
  // }runModel

  // runModel() async {
  //   if (cameraImage != null) {
  //     var predictions = await Tflite.runModelOnFrame(
  //         bytesList: cameraImage!.planes.map((plan) {
  //           return plan.bytes;
  //         }).toList(),
  //         imageHeight: cameraImage!.height,
  //         imageWidth: cameraImage!.width,
  //         imageMean: 127.5,
  //         imageStd: 127.5,
  //         rotation: 90,
  //         numResults: 2,
  //         threshold: .1,
  //         asynch: true);
  //     predictions!.forEach((element) {
  //       setState(() {
  //         output = element['label'];
  //       });
  //     });
  //   }
  // }

  // loadModel() async {
  //   await Tflite.loadModel(model: 'assets/model/testa.model');
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 500, height: 500, child: CameraPreview(cameraController!)),
        Text(output)
      ],
    );
  }
}
