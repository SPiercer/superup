import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../views/photos_editor_view.dart';

class PhotosEditorController extends GetxController {
  late File backgroundImage;

  PainterController controller = PainterController();

  Future<Uint8List?> renderImage(Size size) async {
    final ui.Image renderedImage = await controller.renderImage(size);
    final Uint8List? byteData = await renderedImage.pngBytes;
    return byteData;
  }

  @override
  void onInit() {
    super.onInit();
    backgroundImage = Get.arguments;
  }

  void sendImage() {
    _save();
  }

  Future<void> _save() async {
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    //Request permissions if not already granted
    if (!(await Permission.storage.status.isGranted)) {
      await Permission.storage.request();
    }
    final path = (await getApplicationDocumentsDirectory()).path + "/";
    final file = File(path + "${DateTime.now().millisecondsSinceEpoch}.png");
    await file.writeAsBytes(Uint8List.fromList(pngBytes));

    Get.back(result: file.path);
  }
}
