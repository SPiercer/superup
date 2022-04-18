import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_editor_controller.dart';

class VideoEditorView extends GetView<VideoEditorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoEditorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VideoEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
