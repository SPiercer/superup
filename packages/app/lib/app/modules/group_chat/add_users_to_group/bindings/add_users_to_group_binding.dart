import 'package:get/get.dart';

import '../controllers/add_users_to_group_controller.dart';

class AddUsersToGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUsersToGroupController>(
      () => AddUsersToGroupController(),
    );
  }
}
