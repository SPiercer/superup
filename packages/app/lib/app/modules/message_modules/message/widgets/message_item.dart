import 'dart:io';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';
import 'package:superup/app/modules/message_modules/message/widgets/voice_widget.dart';
import 'package:swipe_to/swipe_to.dart';

class MessageItem extends StatelessWidget {
  final Message msg;
  final int index;
  final MessageController controller;

  const MessageItem({
    Key? key,
    required this.msg,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeTo(
      key: UniqueKey(),
      onRightSwipe: () {
        controller.onRightSwipe(msg);
      },
      child: GetBuilder<MessageController>(
        assignId: true,
        id: index,
        builder: (logic) {
          return getMessageItem();
        },
      ),
    );
  }

  Widget getMessageItem() {
    //VoiceWidget
    if (msg.messageType == MessageType.image) {
      return Image.file(File(msg.messageAttachment!.msgImageInfo!.imageUrl));
    } else if (msg.messageType == MessageType.voice) {
      return VoiceWidget(
        message: msg,
        index: index,
      );
    } else {
      return BubbleSpecialThree(
        text: msg.content,
        sent: msg.hashCode % 2 == 0,
        color: msg.hashCode % 2 == 0 ? Colors.greenAccent : Colors.green,
        tail: true,
        isSender: msg.hashCode % 2 == 0,
      );
    }
  }
}
