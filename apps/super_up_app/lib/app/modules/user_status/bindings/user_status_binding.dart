import 'package:get/get.dart';

import '../controllers/user_status_controller.dart';

class UserStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserStatusController>(
      UserStatusController(),
    );
  }
}
