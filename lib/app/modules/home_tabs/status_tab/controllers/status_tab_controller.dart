import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/status/status.dart';

class StatusTabController extends GetxController {
  final controller = StoryController();
  final statuses = Status.dummyStatus;

  void onFlatEditIconPress() {
    Get.toNamed(Routes.CREATE_TEXT_STATUS);
  }

  void onFlatCameraIconPress() async {
    final imagePath = await Get.toNamed(Routes.GET_CAMERA_IMAGE);
  }

  void onMyStatusClicked() {
    Get.toNamed(Routes.USER_STATUS, arguments: statuses.first);
  }
}
