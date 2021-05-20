import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PdfViewerController _pdfViewerController = PdfViewerController();
  var url = 'https://firebasestorage.googleapis.com/v0/b/sunshine-super-app.appspot.com/o/scrm%2F01.%20BM01A%20-%20Ca%20nhan%20-%20Giay%20dang%20ky%20The%20chinh%252c%20NH%C4%90T%20va%20TKTT-2018-12-19.pdf?alt=media&token=2d909b22-25ec-42a4-a9c0-746389a3d3d1';
  @override
  void initState() {
    super.initState();
  print("");
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(primaryColor: Colors.white),
    home: Scaffold(
      appBar: AppBar(
        title: Text('PdfView example'),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,
        enableDocumentLinkAnnotation: false,
        enableDoubleTapZooming: false,
        canShowScrollHead: false,
        canShowScrollStatus: false,
        canShowPaginationDialog: false,
        pageSpacing: 10,
        interactionMode: PdfInteractionMode.pan,
      ),
    ),
  );
}