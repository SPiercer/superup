import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_tab_controller.dart';

class CameraTabView extends GetView<CameraTabController> {
  const CameraTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    return Scaffold(
      body: Obx(() {
        final isReady = controller.isCameraReady.value;
        if (!isReady) {
          return const SizedBox();
        }
        return AspectRatio(
          aspectRatio: controller.controller.value.aspectRatio,
          child: CameraPreview(controller.controller),
        );
      }),
    );
  }
}
