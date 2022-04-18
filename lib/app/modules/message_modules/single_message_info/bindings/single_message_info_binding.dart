import 'package:get/get.dart';

import '../controllers/single_message_info_controller.dart';

class SingleMessageInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleMessageInfoController>(
      () => SingleMessageInfoController(),
    );
  }
}
