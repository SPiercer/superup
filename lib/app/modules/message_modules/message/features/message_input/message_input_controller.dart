import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/message/attachments/message_attachment.dart';
import 'package:superup/app/models/message/attachments/msg_reply_info.dart';
import 'package:superup/app/models/message/attachments/msg_voice_info.dart';
import 'package:superup/app/modules/message_modules/message/features/recorder/record_controller.dart';
import 'package:superup/app/routes/app_pages.dart';
import '../../../../../core/enums/room_typing_type.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';
import '../media_picker/media_picker_controller.dart';
import '../media_picker/media_picker_widget.dart';

class MessageInputController {
  final Function(Message message) onSubmit;
  final Function(RoomTypingType typingType) onTypingTypeChange;

  bool isEmojiShowing = false;
  String roomId;

  final recordController = RecordController();
  late MediaPickerController mediaPickerController;

  String text = "";

  bool isRecording = false;
  bool isSendBottomEnable = false;
  User myUser;

  final updateScreen = false.obs;
  Message? replyMessage;

  RoomTypingType typingType = RoomTypingType.stop;

  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  MessageInputController({
    required this.onSubmit,
    required this.myUser,
    required this.onTypingTypeChange,
    required this.replyMessage,
    required this.roomId,
  }) {
    textEditingController.addListener(_textEditListener);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiShowing = false;
        updateScreen.refresh();
      }
    });

    mediaPickerController =
        MediaPickerController(myUser: myUser, roomId: roomId);
    mediaPickerController.addListener(_onMediaMessageRecived);
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

  void insertTextMessage() async {
    late Message msgToSend;
    if (isRecording) {
      final info = await recordController.stop();
      msgToSend = Message.buildMessage(
        content: textEditingController.text,
        roomId: roomId,
        type: MessageType.voice,
        attachments: MessageAttachment(
          msgVoiceInfo: MsgVoiceInfo(
            playUrl: info.path,
            voiceDuration: info.duration,
            voiceSize: info.size,
          ),
        ),
        myUser: User.myUser,
      );
    } else {
      msgToSend = Message.buildMessage(
        content: textEditingController.text,
        roomId: roomId,
        type: MessageType.text,
        myUser: User.myUser,
      );
    }

    onSubmit(_setReplyIfNotNull(msgToSend));
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

  Future close() async {
    textEditingController.removeListener(_textEditListener);
    mediaPickerController.removeListener(_onMediaMessageRecived);
    textEditingController.dispose();
    await recordController.close();
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
      recordController.startCounterUp();
    }
  }

  void onCloseRecordIconPress() {
    recordController.stop();
    _updateSendBottom();
    _changeTypingType(RoomTypingType.stop);
    recordController.stopCounter();
  }

  void onAttachFilePress(BuildContext context) async {
    final res = await showModalBottomSheet(
      context: context,
      elevation: 0,
      enableDrag: true,
      isDismissible: true,
      builder: (context) {
        return MediaPickerWidget(
          mediaPickerController: mediaPickerController,
        );
      },
    );

    /// we need to build media message
  }

  void onCameraPress() async {
    mediaPickerController.pickImage(ImageSource.camera);
    //Get.toNamed(Routes.PHOTOS_EDITOR);
  }

  void onDismissReply() {
    replyMessage = null;
    updateScreen.refresh();
  }

  void _onMediaMessageRecived() {
    if (mediaPickerController.value == null) {
      throw "mediaPickerController cant reply with null message !";
    }
    final mediaMsg = _setReplyIfNotNull(mediaPickerController.value!);
    onSubmit(_setReplyIfNotNull(mediaMsg));
  }

  Message _setReplyIfNotNull(Message message) {
    if (replyMessage != null) {
      message.messageContains = MessageContains.reply;
      message.messageAttachment = MessageAttachment(
        msgReplyInfo: MsgReplyInfo(
          parentMessageId: replyMessage!.id,
          parentSenderId: myUser.id,
          messageData: replyMessage!,
        ),
      );
      replyMessage = null;
    }
    textEditingController.clear();
    _updateSendBottom(isRecording: false, isTyping: false);
    return message;
  }
}
