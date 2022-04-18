import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class MessageSendBtn extends StatelessWidget {
  final VoidCallback onInsert;
  const MessageSendBtn({Key? key,required this.onInsert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onInsert,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.accentColor),
      ),
    );
  }
}
