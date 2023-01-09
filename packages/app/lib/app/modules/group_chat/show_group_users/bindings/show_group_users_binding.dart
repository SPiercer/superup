import 'package:get/get.dart';

import '../controllers/show_group_users_controller.dart';

class ShowGroupUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowGroupUsersController>(
      () => ShowGroupUsersController(),
    );
  }
}
