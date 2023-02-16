import 'package:get/get.dart';

import '../controllers/group_members_controller.dart';

class GroupMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GroupMembersController>(
      GroupMembersController(
        (Get.arguments as Map<String, dynamic>)['roomId'],
        (Get.arguments as Map<String, dynamic>)['groupInfo'],
      ),
    );
  }
}
