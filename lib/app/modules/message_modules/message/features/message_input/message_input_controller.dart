import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/modules/message_modules/message/features/recorder/record_controller.dart';
import '../../../../../core/enums/room_typing_type.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';

class MessageInputController {
  final Function(Message message) onSubmit;
  final Function(RoomTypingType typingType) onTypingTypeChange;

  bool isEmojiShowing = false;
  final recordController = RecordController();

  String text = "";

  bool isRecording = false;
  bool isSendBottomEnable = false;
  final updateScreen = false.obs;

  RoomTypingType typingType = RoomTypingType.stop;

  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  MessageInputController({
    required this.onSubmit,
    required this.onTypingTypeChange,
  }) {
    textEditingController.addListener(_textEditListener);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiShowing = false;
        updateScreen.refresh();
      }
    });
  }

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
    if (isRecording) {
      isRecording = false;
      recordController.stop();
    }
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

  Future<bool> onWillPop() async {
    if (isEmojiShowing) {
      isEmojiShowing = false;
      updateScreen.refresh();
      return false;
    }
    if (typingType != RoomTypingType.stop) {
      onTypingTypeChange(RoomTypingType.stop);
    }
    if (isRecording) {
      recordController.stop();
    }
    return true;
  }

  void close() {
    textEditingController.removeListener(_textEditListener);
    textEditingController.dispose();
  }

  void _textEditListener() {
    text = textEditingController.text;
    if (text.isNotEmpty && typingType != RoomTypingType.typing) {
      _changeTypingType(RoomTypingType.typing);
    } else if (text.isEmpty && typingType != RoomTypingType.stop) {
      _changeTypingType(RoomTypingType.stop);
    }
    if (text.isNotEmpty) {
      if (!isSendBottomEnable) {
        _updateSendBottom(isTyping: true);
      }
    } else {
      _updateSendBottom(isTyping: false);
    }
  }

  void _changeTypingType(RoomTypingType typingType) {
    this.typingType = typingType;
    onTypingTypeChange(typingType);
  }

  void _updateSendBottom({
    bool isTyping = false,
    bool isRecording = false,
  }) {
    this.isRecording = isRecording;
    isSendBottomEnable = isTyping;
    updateScreen.refresh();
  }

  void onRecordClick() async {
    final isStarted = await recordController.askForRecordPermissionsAndStart();
    if (isStarted) {
      _updateSendBottom(isRecording: true, isTyping: true);
      _changeTypingType(RoomTypingType.recording);
    }
  }

  void onCloseRecordIconPress() {
    recordController.stop();
    _updateSendBottom();
    _changeTypingType(RoomTypingType.stop);
  }
}
