import 'package:flutter/material.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';
import 'package:textless/textless.dart';

class ReplyItem extends StatelessWidget {
  final MessageController controller;
  const ReplyItem({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius:
        const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: [
              "xxxx".text,
              InkWell(
                onTap: controller
                    .dismissReply,
                child: const Icon(
                    Icons.clear),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
