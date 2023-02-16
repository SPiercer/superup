import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class ChatIconWithText extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const ChatIconWithText({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          title.text
        ],
      ),
    );
  }
}
