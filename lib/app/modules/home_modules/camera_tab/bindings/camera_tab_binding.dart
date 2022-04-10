import 'package:get/get.dart';

import '../controllers/camera_tab_controller.dart';

class CameraTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraTabController>(
      () => CameraTabController(),
    );
  }
}
