import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/message/attachments/message_attachment.dart';
import 'package:superup/app/models/message/attachments/msg_reply_info.dart';
import 'package:superup/app/models/message/attachments/msg_voice_info.dart';
import 'package:superup/app/modules/message_modules/message/features/recorder/record_controller.dart';
import '../../../../../core/enums/room_typing_type.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';
import '../../controllers/down_arrow_model.dart';
import '../media_picker/media_picker_controller.dart';
import '../media_picker/media_picker_widget.dart';

class MessageInputController {
  final Function(Message message) onSubmit;
  final Function(RoomTypingType typingType) onTypingTypeChange;

  bool isEmojiShowing = false;

  final recordController = RecordController();
  final mediaPickerController = MediaPickerController();

  String text = "";

  bool isRecording = false;
  bool isSendBottomEnable = false;

  final updateScreen = false.obs;
  Rx<ReplyMessageState> rxReplyMessage;

  Message? get _replyMessage => rxReplyMessage.value.replyMessage;
  RoomTypingType typingType = RoomTypingType.stop;

  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  MessageInputController({
    required this.onSubmit,
    required this.onTypingTypeChange,
    required this.rxReplyMessage,
  }) {
    textEditingController.addListener(_textEditListener);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiShowing = false;
        updateScreen.refresh();
      }
    });
    rxReplyMessage.listen((p0) {
      if (p0.replyMessage != null) {
        if (!isEmojiShowing) {
          focusNode.requestFocus();
        }
      }
    });

    mediaPickerController.addListener(_onMediaMessageReceived);
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
        content: "This content is Voice 🎤",
        type: MessageType.voice,
        attachments: MessageAttachment(
          msgVoiceInfo: MsgVoiceInfo(
            playUrl: info.path,
            voiceDuration: info.duration,
            voiceSize: info.size,
          ),
        ),
      );
    } else {
      msgToSend = Message.buildMessage(
        content: textEditingController.text,
        type: MessageType.text,
      );
    }

    onSubmit(_setReplyIfNotNull(msgToSend));
  }

  void onEmojiSelected(emoji) {
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
    mediaPickerController.removeListener(_onMediaMessageReceived);
    textEditingController.dispose();
    focusNode.dispose();
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
     showModalBottomSheet(
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
  }

  void onCameraPress() async {
    mediaPickerController.pickImage(ImageSource.camera);
  }

  void onDismissReply() {
    rxReplyMessage.value.replyMessage = null;
    updateScreen.refresh();
  }

  void _onMediaMessageReceived() {
    if (mediaPickerController.value == null) {
      throw "mediaPickerController cant reply with null message !";
    }
    final mediaMsg = _setReplyIfNotNull(mediaPickerController.value!);
    onSubmit(_setReplyIfNotNull(mediaMsg));
  }

  Message _setReplyIfNotNull(Message message) {
    if (_replyMessage != null) {
      message.messageContains = MessageContains.reply;
      final reply = MsgReplyInfo(
        parentMessageId: _replyMessage!.id,
        parentSenderId: "null",
        messageData: _replyMessage!,
      );

      if (message.messageAttachment != null) {
        message.messageAttachment!.msgReplyInfo = reply;
      } else {
        message.messageAttachment = MessageAttachment(
          msgReplyInfo: reply,
        );
      }
    }
    onDismissReply();
    textEditingController.clear();
    _updateSendBottom(isRecording: false, isTyping: false);
    return message;
  }
}
