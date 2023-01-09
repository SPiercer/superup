import 'package:get/get.dart';

import '../controllers/create_text_status_controller.dart';

class CreateTextStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTextStatusController>(
      () => CreateTextStatusController(),
    );
  }
}
