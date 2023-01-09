import 'package:get/get.dart';

import '../controllers/photos_editor_controller.dart';

class PhotosEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PhotosEditorController>(
       PhotosEditorController(),
    );
  }
}
