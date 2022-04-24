import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:textless/textless.dart';

import '../../../../../../core/widgets/image/cache_image_widget.dart';
import '../../../../../../core/widgets/image/message_image_widget.dart';

class ReplyWidget extends StatelessWidget {
  final Message? replyMessage;
  final VoidCallback onDismissReply;

  const ReplyWidget(
      {Key? key, required this.replyMessage, required this.onDismissReply})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (replyMessage == null) {
      throw "cant reply to null message !";
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black54 : Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 4),
                child: replyMessage!.senderName.cap,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  if (replyMessage!.isImage)
                    MessageImageWidget(
                      size: const Size(50, 50),
                      msg: replyMessage!,
                    ),
                  InkWell(
                    onTap: onDismissReply,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                      child: const Icon(
                        Icons.clear,
                        size: 12,
                        color: AppColors.iconGrayColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Flexible(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
            child: replyMessage!.content.text.maxLine(2),
          ))
        ],
      ),
    );
  }
}
