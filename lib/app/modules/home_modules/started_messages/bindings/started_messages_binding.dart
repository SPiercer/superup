import 'package:get/get.dart';

import '../controllers/started_messages_controller.dart';

class StartedMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartedMessagesController>(
      () => StartedMessagesController(),
    );
  }
}
