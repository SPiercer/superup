import 'package:get/get.dart';

import '../controllers/group_invite_link_controller.dart';

class GroupInviteLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupInviteLinkController>(
      () => GroupInviteLinkController(),
    );
  }
}
