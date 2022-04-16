import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../core/widgets/single_rename.dart';
import '../../../../models/room/room.dart';

class GroupRoomSettingsController extends GetxController {
  final Room room = Get.arguments as Room;

  void addParticipants() {
    Get.toNamed(Routes.ADD_USERS_TO_GROUP, arguments: room);
  }

  void onChangeSubjectClicked() async {
    final text = await Get.to(
      () => const SingleRename(
        subTitle: ' ',
        appbarTitle: 'Enter new subject',
      ),
    );
  }

  void onGroupSettings() {
    Get.toNamed(Routes.EDIT_GROUP, arguments: room);
  }

  void onStartVoiceCallClicked() {}

  void onStartVideoCallClicked() {}

  void onAddClicked() {
    Get.toNamed(Routes.ADD_USERS_TO_GROUP, arguments: room);
  }

  void onShowMediaClicked() {
    Get.toNamed(Routes.CHAT_MEDIA, arguments: room);
  }

  void onChangeNotificationsClicked() {}

  void onChangeGroupDescriptionClicked() async {
    final text = await Get.to(
      () => const SingleRename(
        subTitle:
            'The group description is visible to participants of this group and people invited to this group ',
        appbarTitle: 'Group description',
      ),
    );
  }

  void onExitClicked() {}

  void onReportUserClicked() {}

  void onShowUsersClicked() {
    Get.toNamed(Routes.SHOW_GROUP_USERS, arguments: room);
  }

  void onLinkInviteClicked() {
    Get.toNamed(Routes.GROUP_INVITE_LINK, arguments: room);
  }
}
