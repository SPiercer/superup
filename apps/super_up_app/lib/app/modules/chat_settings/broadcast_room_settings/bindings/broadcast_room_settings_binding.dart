import 'package:get/get.dart';

import '../controllers/broadcast_room_settings_controller.dart';

class BroadcastRoomSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BroadcastRoomSettingsController>(
      BroadcastRoomSettingsController(Get.arguments),
    );
  }
}
