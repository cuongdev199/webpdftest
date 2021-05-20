import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';



class PdfRender extends StatefulWidget {
  @override
  _PdfRenderState createState() => _PdfRenderState();
}

class _PdfRenderState extends State<PdfRender> {
  final controller = PdfViewerController();
var header =   {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Credentials": true,
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS"
  };
var url = 'https://firebasestorage.googleapis.com/v0/b/sunshine-super-app.appspot.com/o/scrm%2F34298.GD_2021_00102.pdf?alt=media&token=1a4d793d-7539-4d7e-aa9d-97a2f8167b57';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init()async{
    var file = await DefaultCacheManager().getSingleFile(url);
    print('CUONGNV${file}');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: ValueListenableBuilder<Object>(
            // The controller is compatible with ValueListenable<Matrix4> and you can receive notifications on scrolling and zooming of the view.
              valueListenable: controller,
              builder: (context, _, child) =>
                  Text(controller.isReady ? 'Page #${controller.currentPageNumber}' : 'Page -')),
        ),
        backgroundColor: Colors.grey,
        body: PdfViewer.openFutureFile(
          // Accepting function that returns Future<String> of PDF file path
              () async => (await DefaultCacheManager().getSingleFile(
                  url))
              .path,
          viewerController: controller,
          onError: (err) => print(err),
          params: PdfViewerParams(
            padding: 10,
            minScale: 1.0,
          ),
        )
           ,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.first_page),
              onPressed: () => controller.ready?.goToPage(pageNumber: 1),
            ),
            FloatingActionButton(
              child: Icon(Icons.last_page),
              onPressed: () => controller.ready?.goToPage(pageNumber: controller.pageCount),
            ),
          ],
        ),
      )
    ;
  }
}