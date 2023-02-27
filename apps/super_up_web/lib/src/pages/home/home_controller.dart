import 'package:flutter/cupertino.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/home/web_chat_scaffold.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/src/models/v_room/v_room.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

class HomeController {
  final vRoomController = VRoomController(isTesting: false);
  late final BuildContext context;
  final ProfileApiService profileApiService;

  HomeController(this.profileApiService);

  void onInit(BuildContext context) {
    this.context = context;
    vInitCallListener();
    setVisit();
  }

  VRoom? currentRoom;

  void close() {
    vRoomController.dispose();
  }

  void onRoomItemPress(VRoom room) {
    if (currentRoom == room) {
      return;
    }
    currentRoom = room;

    vRoomController.setRoomSelected(room.id);
    vWebChatNavigation.key.currentState!
        .pushReplacementNamed(ChatRoute.route, arguments: room);
  }

  void setVisit() {
    vSafeApiCall(
      request: () async {
        return profileApiService.setVisit();
      },
      onSuccess: (response) {},
      ignoreTimeoutAndNoInternet: true,
    );
  }
}
