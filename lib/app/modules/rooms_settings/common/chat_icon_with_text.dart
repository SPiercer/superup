import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:textless/textless.dart';

class ChatIconWithText extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const ChatIconWithText(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.seenMessageIcon,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          title.text.color(AppColors.seenMessageIcon)
        ],
      ),
    );
  }
}
