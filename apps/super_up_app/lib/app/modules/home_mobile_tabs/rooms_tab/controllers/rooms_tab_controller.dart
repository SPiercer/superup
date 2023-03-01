import 'package:flutter/cupertino.dart';
import 'package:super_up/app/core/s_base_controller.dart';
import 'package:super_up/app/modules/app_members/views/app_members_view.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class RoomsTabController extends ValueNotifier implements SBaseController {
  final vRoomController = VRoomController();

  RoomsTabController() : super(null);

  void onFlatMessageIconPress(BuildContext context) {
    context.toPage(const AppMembersView());
  }

  @override
  void onClose() {
    vRoomController.dispose();
  }

  @override
  void onInit() {}
}
