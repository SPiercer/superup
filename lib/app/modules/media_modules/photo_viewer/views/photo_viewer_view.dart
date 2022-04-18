import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/photo_viewer_controller.dart';

class PhotoViewerView extends GetView<PhotoViewerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhotoViewerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PhotoViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
