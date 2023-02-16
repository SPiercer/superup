import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:super_up_core/super_up_core.dart';

import '../../../../routes/app_pages.dart';

class StatusTabController extends GetxController {
  final controller = StoryController();
  final statuses = Status.dummyStatus;

  void onFlatEditIconPress() {
    Get.toNamed(Routes.CREATE_TEXT_STATUS);
  }

  void onFlatCameraIconPress() async {
    // final imagePath = await Get.toNamed(Routes.GET_CAMERA_IMAGE);
  }

  void onMyStatusClicked() {
    Get.toNamed(Routes.USER_STATUS, arguments: statuses.first);
  }
}
