import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:get/get.dart';

class PhotosEditorController extends GetxController {
  PainterController controller = PainterController();

  Future<Uint8List?> renderImage(Size size) async {
    final ui.Image renderedImage = await controller.renderImage(size);
    final Uint8List? byteData = await renderedImage.pngBytes;
    return byteData;
  }
}
