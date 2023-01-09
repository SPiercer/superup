import 'package:get/get.dart';

import '../controllers/new_group_confirm_creation_controller.dart';

class NewGroupConfirmCreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewGroupConfirmCreationController>(
      () => NewGroupConfirmCreationController(),
    );
  }
}
