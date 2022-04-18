import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/photos_editor_controller.dart';

class PhotosEditorView extends GetView<PhotosEditorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhotosEditorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PhotosEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
