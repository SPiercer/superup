import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:textless/textless.dart';

class ReplyWidget extends StatelessWidget {
  final Message? replyMessage;
  final VoidCallback onDismissReply;

  const ReplyWidget(
      {Key? key, required this.replyMessage, required this.onDismissReply})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(replyMessage ==null){
      throw "cant reply to null message !";
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(7),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              replyMessage!.senderName.cap,
              InkWell(
                onTap: onDismissReply,
                child: const Icon(
                  Icons.clear,
                  size: 22,
                  color: AppColors.iconGrayColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Flexible(child: replyMessage!.content.text.maxLine(2))
        ],
      ),
    );
  }
}
