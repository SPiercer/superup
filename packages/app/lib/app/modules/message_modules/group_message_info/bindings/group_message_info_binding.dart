import 'package:get/get.dart';

import '../controllers/group_message_info_controller.dart';

class GroupMessageInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMessageInfoController>(
      () => GroupMessageInfoController(),
    );
  }
}
