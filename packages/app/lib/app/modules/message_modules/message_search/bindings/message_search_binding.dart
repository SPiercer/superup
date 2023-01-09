import 'package:get/get.dart';

import '../controllers/message_search_controller.dart';

class MessageSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageSearchController>(
      () => MessageSearchController(),
    );
  }
}
