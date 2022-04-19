import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

import 'package:get/get.dart';

import '../controllers/photos_editor_controller.dart';

class PhotosEditorView extends GetView<PhotosEditorController> {
  const PhotosEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterPainter.builder(
        controller: controller.controller,
        builder: (context, painter) {
          return SizedBox(width: 300, height: 300, child: painter);
        },
      ),
    );
  }
}
