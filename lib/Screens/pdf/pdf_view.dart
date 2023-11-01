import 'package:flutter/material.dart';
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";


class PdfViewer extends StatefulWidget {
  static const String routeName='pdf2';

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<PdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter PDF Viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ],
        ),
        body: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/app-notes-7cf5e.a',

          key: _pdfViewerKey,
            ),
        );
   }
}