import 'package:get/get.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';

import '../controllers/group_room_settings_controller.dart';


class GroupRoomSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GroupRoomSettingsController>(
      GroupRoomSettingsController(
        Get.arguments as VToChatSettingsModel,
      ),
    );
  }
}
