import 'package:flutter/cupertino.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:super_up/app/modules/create_text_status/views/create_text_status_view.dart';
import 'package:super_up/app/modules/user_status/views/user_status_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/s_base_controller.dart';

class StatusTabController extends ValueNotifier implements SBaseController {
  final controller = StoryController();
  final statuses = Status.dummyStatus;

  StatusTabController() : super(null);

  void onFlatEditIconPress(BuildContext context) {
    context.toPage(const CreateTextStatusView());
  }

  void onFlatCameraIconPress() async {
    // final imagePath = await context.toPage(Routes.GET_CAMERA_IMAGE);
  }

  void onMyStatusClicked(BuildContext context) {
    context.toPage(const UserStatusView());
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }
}
