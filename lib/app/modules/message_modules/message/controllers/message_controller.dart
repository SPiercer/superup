import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';

class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;
  final messages = <String>[].obs;

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addFake();
  }

  void handleSubmitted(String text) {
    // final ct = _buildChatThread(Thread(
    //   fromSelf: true,
    //   message: text,
    // ));
    //
    // setState(() {
    //   _chatThreads.add(ct);
    // });
    //
    // ct.animationController.forward();
  }

  void insertMessage(String v) {
    messages.insert(0, v.toString());
  }

  void addFake() async {}
}
