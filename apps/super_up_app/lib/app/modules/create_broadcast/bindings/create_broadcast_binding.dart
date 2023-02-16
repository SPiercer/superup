import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/create_broadcast_controller.dart';

class CreateBroadcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateBroadcastController>(
      CreateBroadcastController(Get.arguments as List<SBaseUser>),
    );
  }
}
