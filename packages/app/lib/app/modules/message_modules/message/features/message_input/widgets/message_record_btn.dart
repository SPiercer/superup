import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';

class MessageRecordBtn extends StatelessWidget {
  final VoidCallback onRecordClick;
  const MessageRecordBtn({Key? key,required this.onRecordClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRecordClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: const Icon(
          Icons.mic,
          color: Colors.white,
        ),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.accentColor),
      ),
    );
  }
}
