import 'package:get/get.dart';

import '../controllers/group_room_settings_controller.dart';

class GroupRoomSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GroupRoomSettingsController>(
        GroupRoomSettingsController(),
    );
  }
}
