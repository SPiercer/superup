import 'package:get/get.dart';

import '../controllers/get_camera_image_controller.dart';

class GetCameraImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetCameraImageController>(
        GetCameraImageController(),
    );
  }
}
