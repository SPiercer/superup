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
  final textMessage = "".obs;
  final downArrow = ReplyMessageState().obs;

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
  }

  final emojiShowing = false.obs;

  void showEmoji() async {
    // focusNode.unfocus();
    // focusNode.canRequestFocus = true;
    // await Future.delayed(const Duration(milliseconds: 300));
    // emojiShowing.value = !emojiShowing.value;
  }

  void onEmojiSelected(Emoji emoji) {
    // textEditingController
    //   ..text += emoji.emoji
    //   ..selection = TextSelection.fromPosition(
    //       TextPosition(offset: textEditingController.text.length));
  }

  void onBackspacePressed() {
    // textEditingController
    //   ..text = textEditingController.text.characters.skipLast(1).toString()
    //   ..selection = TextSelection.fromPosition(
    //       TextPosition(offset: textEditingController.text.length));
  }

  @override
  void onInit() {
    super.onInit();
    // textEditingController.addListener(_textEditListener);
    // focusNode.addListener(() {
    //   print("focusNode.hasFocus ${focusNode.hasFocus}");
    //   if (focusNode.hasFocus) {
    //     emojiShowing.value = false;
    //   }
    // });
  }

  void insertMessage(Message msg) {
    messages.insert(0, msg);
  }

  void addFake() async {}

  void onRightSwipe(Message msg) {
    downArrow.value.replyMessage = msg;
    downArrow.value.isReplyEnable = true;
    downArrow.refresh();
  }
}
