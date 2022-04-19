import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';

import '../../../../../core/enums/room_typing_type.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';

class MessageInputController {
  final Function(Message message) onSubmit;
  final Function(RoomTypingType typingType) typingType;
  final updateScreen = false.obs;
  var isEmojiShowing = false;

  String text = "";

  MessageInputController({
    required this.onSubmit,
    required this.typingType,
  }) {
    textEditingController.addListener(_textEditListener);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiShowing = false;
        updateScreen.refresh();
      }
    });
  }

  void close() {
    textEditingController.removeListener(_textEditListener);
    textEditingController.dispose();
  }

  void _textEditListener() {
    text = textEditingController.text;
  }

  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  Future showEmoji() async {
    focusNode.unfocus();
    focusNode.canRequestFocus = true;
    await Future.delayed(const Duration(milliseconds: 50));
    isEmojiShowing = !isEmojiShowing;
    updateScreen.refresh();
  }

  void onBackspacePressed() {
    textEditingController
      ..text = textEditingController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
  }

  void insertTextMessage() {
    onSubmit(Message.buildMessage(
      content: textEditingController.text,
      roomId: "roomId",
      type: MessageType.text,
      myUser: User.myUser,
    ));
    textEditingController.clear();
  }

  void onEmojiSelected(Emoji emoji) {
    textEditingController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textEditingController.text.length,
        ),
      );
  }
}
