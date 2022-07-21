import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';
import 'package:textless/textless.dart';

class VoiceWidget extends StatelessWidget {
  final Message message;
  final int index;

  const VoiceWidget({Key? key, required this.message, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = [1,2,3];
    l[1] = 5;
    return InkWell(
      onTap: () {
        Get.find<MessageController>().playVoice(index);
      },
      child: Container(
        child:
            "Voice Message ${message.messageAttachment!.msgVoiceInfo!.playDuration}"
                .text,
      ),
    );
  }
}
