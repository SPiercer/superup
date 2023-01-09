import 'package:get/get.dart';

import '../controllers/add_users_to_broadcast_controller.dart';

class AddUsersToBroadcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUsersToBroadcastController>(
      () => AddUsersToBroadcastController(),
    );
  }
}
