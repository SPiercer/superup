import 'package:get/get.dart';

import '../controllers/verify_number_controller.dart';

class VerifyNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyNumberController>(
      () => VerifyNumberController(),
    );
  }
}
