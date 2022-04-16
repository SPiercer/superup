import 'package:get/get.dart';

import '../controllers/new_group_select_users_controller.dart';

class NewGroupSelectUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewGroupSelectUsersController>(
      () => NewGroupSelectUsersController(),
    );
  }
}
