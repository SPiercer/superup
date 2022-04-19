import 'package:flutter/material.dart';

class MessageTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final VoidCallback onShowEmoji;

  const MessageTextFiled({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onShowEmoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: onShowEmoji,
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
              focusNode: focusNode,
              controller: textEditingController,
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
