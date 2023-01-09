import 'package:get/get.dart';

import '../controllers/single_room_settings_controller.dart';

class SingleRoomSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SingleRoomSettingsController>(
      SingleRoomSettingsController(),
    );
  }
}
