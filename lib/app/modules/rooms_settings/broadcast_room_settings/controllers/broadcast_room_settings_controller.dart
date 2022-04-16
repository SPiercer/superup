import 'package:get/get.dart';

import '../../../../core/widgets/single_rename.dart';
import '../../../../models/room/room.dart';
import '../../../../routes/app_pages.dart';

class BroadcastRoomSettingsController extends GetxController {
  final Room room = Get.arguments as Room;

  void editParticipants() {
    Get.toNamed(Routes.SHOW_BROADCAST_USERS, arguments: room);
  }

  void addParticipants() {
    Get.toNamed(Routes.ADD_USERS_TO_BROADCAST, arguments: room);
  }

  void onChangeNameClicked()async {
    final text = await Get.to(
          () => const SingleRename(
        subTitle:
        'Enter new subject for the broadcast room.\n\nNote: This will not be visible to all participants.',
        appbarTitle: 'Broadcast name',
      ),
    );
  }
}
