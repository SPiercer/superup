import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/modules/message_modules/message/widgets/message_item.dart';
import 'package:textless/textless.dart';

import '../controllers/message_controller.dart';
import '../widgets/round_input.dart';
import '../widgets/send_message_bar.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView>
    with TickerProviderStateMixin {
  final controller = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: controller.onTitlePress,
            child: Text(controller.room.value.title)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(

                reverse: true,
                itemBuilder: (context, index) =>
                    MessageItem(
                      msg: controller.messages[index],
                    ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: controller.messages.length,
              );
            }),
          ),
          SendMessageBar(
                (v) {
              controller.insertMessage(v);
            },
          ),
        ],
      ),
    );
  }
}
