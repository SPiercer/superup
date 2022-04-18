import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_viewer_controller.dart';

class VideoViewerView extends GetView<VideoViewerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoViewerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VideoViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
