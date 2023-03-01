import 'package:flutter/material.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class CallItem extends StatelessWidget {
  final VCallHistory callHistory;
  final VoidCallback onPress;

  const CallItem({
    Key? key,
    required this.callHistory,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      horizontalTitleGap: 10,
      leading: VCircleAvatar(
        fullUrl: callHistory.peerUser.baseUser.userImages.chatImage,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: callHistory.withVideo
            ? const Icon(
                Icons.videocam_rounded,
                color: Colors.white,
              )
            : const Icon(
                Icons.call,
                color: Colors.white,
              ),
      ),
      contentPadding: EdgeInsets.zero,
      title: callHistory.peerUser.baseUser.fullName.text,
      subtitle: callHistory.callStatus.tr(context).text,
    );
  }
}
