import 'package:get/get.dart';

import '../controllers/app_members_controller.dart';

class AppMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppMembersController>(
      AppMembersController(Get.find()),
    );
  }
}
