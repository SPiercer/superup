import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';
import 'down_arrow_model.dart';

class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;
  final messages = <String>["xxx", "xxx2", "xxx3"].obs;
  final textEditingController = TextEditingController();
  final textMessage = "".obs;
  final downArrow = DownArrowModel().obs;
  final focusNode = FocusNode();

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
  }

  final emojiShowing = false.obs;

  void showEmoji() async {
    focusNode.unfocus();
    focusNode.canRequestFocus= true;
    emojiShowing.value = !emojiShowing.value;
  }

  void onEmojiSelected(Emoji emoji) {
    textEditingController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
  }

  void onBackspacePressed() {
    textEditingController
      ..text = textEditingController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
  }

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(_textEditListener);
    focusNode.addListener(() {
      print("focusNode.hasFocus ${focusNode.hasFocus}");
      if (focusNode.hasFocus) {
        emojiShowing.value = false;
      }
    });
  }

  @override
  void onClose() {
    textEditingController.removeListener(_textEditListener);
    textEditingController.dispose();
    super.onClose();
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

  void insertMessage() {
    messages.insert(0, textEditingController.text.toString());
  }

  void addFake() async {}

  void onRightSwipe(String msg) {
    downArrow.value.replyMessage = msg;
    downArrow.value.isReplyEnable = true;
    downArrow.refresh();
  }

  void _textEditListener() {
    final txt = textEditingController.text;

    if (txt.isNotEmpty) {
      textMessage.value = txt;
    } else {
      textMessage.value = "";
    }
  }

  void onTextFieldHeightChange(double height) {
    print(height);
    if (height > 140) {
      /// reply enable and mutil lines
      downArrow.value.downArrowSpace = 0.42;
      downArrow.refresh();
      return;
    } else if (height > 90) {
      downArrow.value.downArrowSpace = 0.60;
      downArrow.refresh();
      return;
    } else if (height > 50) {
      downArrow.value.downArrowSpace = 0.70;
      downArrow.refresh();
      return;
    } else {
      ///normal
      downArrow.value.downArrowSpace = 0.8;
      downArrow.refresh();
      return;
    }
  }

  void dismissReply() {
    downArrow.value.isReplyEnable = false;
    downArrow.refresh();
  }
}
