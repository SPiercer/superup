import 'package:get/get.dart';

import '../controllers/new_broadcast_select_users_controller.dart';

class NewBroadcastSelectUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewBroadcastSelectUsersController>(
      () => NewBroadcastSelectUsersController(),
    );
  }
}
