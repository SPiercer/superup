import 'package:get/get.dart';

import '../controllers/link_web_controller.dart';

class LinkWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinkWebController>(
      () => LinkWebController(),
    );
  }
}
