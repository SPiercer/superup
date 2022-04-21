import 'dart:io';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:textless/textless.dart';

class MessageItem extends StatelessWidget {
  final Message msg;
  final MessageController controller;

  const MessageItem({Key? key, required this.msg, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(msg.messageType == MessageType.image){
      return Image.file(File(msg.messageAttachment!.msgImageInfo!.imageUrl));
    }
    return SwipeTo(
      key: UniqueKey(),
      onRightSwipe: () {
        controller.onRightSwipe(msg);
      },
      child: BubbleSpecialThree(
        text: msg.content,
        sent: msg.hashCode % 2 == 0,
        color: msg.hashCode % 2 == 0 ? Colors.greenAccent : Colors.green,
        tail: true,
        isSender: msg.hashCode % 2 == 0,
      ),
    );

  }
}
