import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Pdf extends StatefulWidget {
  static const String routeName='pdf';
  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  PlatformFile? PickedFile;
  UploadTask? uploadTask;
  Future uploadFile() async {
    final path = 'files/${PickedFile!.name}';
    final file = File(PickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    String Imageurl = await ref.getDownloadURL();
    print(Imageurl);
    print("=====================");

    // final snapshot = await uploadTask!.whenComplete(() {});
    // final urlDownload = await snapshot.ref.getDownloadURL();
    // print("Download link is :$urlDownload");
  }

  Future SelectFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      PickedFile = result!.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Two'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (PickedFile != null)
                Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(PickedFile!.name),
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: SelectFile, child: Text("Select")),
              ElevatedButton(onPressed: uploadFile, child: Text("Upload")),
            ],
            ));
    }
}