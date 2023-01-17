import 'package:get/get.dart';

import '../controllers/create_broadcast_controller.dart';

class CreateBroadcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateBroadcastController>(
      CreateBroadcastController(),
    );
  }
}
