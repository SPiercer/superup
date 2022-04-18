import 'package:get/get.dart';

import '../controllers/video_editor_controller.dart';

class VideoEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoEditorController>(
      () => VideoEditorController(),
    );
  }
}
