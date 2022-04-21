import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';
import 'down_arrow_model.dart';

class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;
  final messages = <Message>[
    Message.buildMessage(
      content: "content 1",
      roomId: "roomId",
      type: MessageType.text,
      myUser: User.myUser,
    ),
    Message.buildMessage(
      content: "content 2",
      roomId: "roomId",
      type: MessageType.text,
      myUser: User.myUser,
    ),
    Message.buildMessage(
      content: "content 3",
      roomId: "roomId",
      type: MessageType.text,
      myUser: User.myUser,
    )
  ].obs;
  final downArrow = ReplyMessageState().obs;

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
  }

  final emojiShowing = false.obs;

  void onSubmitInsertMessage(Message msg) {
    msg.content = msg.toString();
    messages.insert(0, msg);
  }

  void addFake() async {}

  void onRightSwipe(Message msg) {
    downArrow.value.replyMessage = msg;
    downArrow.value.isReplyEnable = true;
    downArrow.refresh();
  }
}
