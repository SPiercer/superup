import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_viewer_controller.dart';

class VideoViewerView extends GetView<VideoViewerController> {
  const VideoViewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoViewerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoViewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
