import 'package:get/get.dart';

import '../controllers/chat_common_groups_controller.dart';

class ChatCommonGroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatCommonGroupsController>(
      () => ChatCommonGroupsController(),
    );
  }
}
