import 'package:get/get.dart';

import '../controllers/video_viewer_controller.dart';

class VideoViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoViewerController>(
      () => VideoViewerController(),
    );
  }
}
