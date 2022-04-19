import 'package:flutter/material.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';
import 'package:textless/textless.dart';

class ReplyItem extends StatelessWidget {
  final Message? replyMessage;
  final VoidCallback onDismissReply;

  const ReplyItem(
      {Key? key, required this.replyMessage, required this.onDismissReply})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(replyMessage ==null){
      throw "cant reply to null message !";
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              replyMessage!.content.text,
              InkWell(
                onTap: onDismissReply,
                child: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
