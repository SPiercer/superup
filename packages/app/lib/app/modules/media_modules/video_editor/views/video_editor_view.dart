import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_editor_controller.dart';

class VideoEditorView extends GetView<VideoEditorController> {
  const VideoEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoEditorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoEditorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
