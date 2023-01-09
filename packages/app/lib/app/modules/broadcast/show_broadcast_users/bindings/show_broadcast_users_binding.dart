import 'package:get/get.dart';

import '../controllers/show_broadcast_users_controller.dart';

class ShowBroadcastUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowBroadcastUsersController>(
      () => ShowBroadcastUsersController(),
    );
  }
}
