import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/room/room.dart';

class SingleRoomSettingsController extends GetxController {
  final Room room = Get.arguments as Room;

  void onShareClicked() {}

  void onEditClicked() {}

  void onViewInAddressBookClicked() {}

  void onSearchClicked() {
    Get.toNamed(Routes.MESSAGE_SEARCH, arguments: room);
  }

  void onShowMediaClicked() {
    Get.toNamed(Routes.CHAT_MEDIA, arguments: room);
  }

  void onShowGroupsClicked() {
    Get.toNamed(Routes.CHAT_COMMON_GROUPS, arguments: room);
  }

  void onBlockUserClicked() {}

  void onReportUserClicked() {}

  void onChangeNotificationsClicked() async {}

  void onStartVoiceCallClicked() async {}

  void onStartVideoCallClicked() async {}
}
