import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';

class MessageTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final bool isTyping;
  final VoidCallback onShowEmoji;
  final VoidCallback onCameraPress;
  final VoidCallback onAttachFilePress;

  const MessageTextFiled({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onShowEmoji,
    required this.onCameraPress,
    required this.onAttachFilePress,
    required this.isTyping,
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
            color: AppColors.iconGrayColor,
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
        Visibility(
          visible: !isTyping,
          child: Row(
            children: [
              InkWell(
                onTap: onCameraPress,
                child: const Icon(
                  Icons.camera_alt_sharp,
                  size: 25,
                  color: AppColors.iconGrayColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onAttachFilePress,
          child: const Icon(
            Icons.attach_file,
            size: 25,
            color: AppColors.iconGrayColor,
          ),
        ),
      ],
    );
  }
}
