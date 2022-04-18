import 'package:flutter/material.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';

class MessageTextFiled extends StatelessWidget {
  final MessageController controller;
  const MessageTextFiled({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: controller.showEmoji,
          child: const Icon(
            Icons.emoji_emotions_outlined,
            size: 28,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: TextField(
              focusNode: controller.focusNode,
              controller: controller.textEditingController,
              maxLines: 5,
              minLines: 1,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type a message...',
              ),
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(Icons.attach_file, size: 28),
      ],
    );
  }
}
