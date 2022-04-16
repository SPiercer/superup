import 'package:get/get.dart';

import '../controllers/new_broadcast_confirm_creation_controller.dart';

class NewBroadcastConfirmCreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewBroadcastConfirmCreationController>(
      () => NewBroadcastConfirmCreationController(),
    );
  }
}
