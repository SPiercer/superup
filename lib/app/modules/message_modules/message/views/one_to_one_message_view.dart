import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:measured_size/measured_size.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/core/widgets/get_full.dart';
import 'package:textless/textless.dart';

import '../controllers/message_controller.dart';
import '../features/message_input/message_input_widget.dart';
import '../widgets/arrow_down.dart';
import '../features/message_input/widgets/emoji_keyborad.dart';
import '../widgets/message_item.dart';
import '../features/message_input/widgets/message_send_btn.dart';
import '../features/message_input/widgets/message_text_filed.dart';
import '../features/message_input/widgets/reply_item.dart';

class OneToOneMessageView extends StatefulWidget {
  const OneToOneMessageView({Key? key}) : super(key: key);

  @override
  State<OneToOneMessageView> createState() => _OneToOneMessageViewState();
}

class _OneToOneMessageViewState
    extends GetFull<OneToOneMessageView, MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneToOneMessageView'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/message/default_wallpaper.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            /// list view
            Expanded(
              child: Stack(
                children: [
                  Obx(() {
                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 10),
                      reverse: true,
                      itemBuilder: (context, index) => MessageItem(
                        msg: controller.messages[index],
                        controller: controller,
                      ),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: controller.messages.length,
                    );
                  }),
                  const PositionedDirectional(
                    bottom: 10,
                    child: ArrowDown(),
                    end: 10,
                  ),
                ],
              ),
            ),

            /// submit inputs
            Obx(
              () {
                final reply = controller.downArrow.value.replyMessage;
                final leaverId = controller.room.value.leaverId;
                return MessageInputWidget(
                  onSubmit: (msg) {
                    controller.insertMessage(msg);
                  },
                  typingType: (typing) {},
                  leaverId: leaverId,
                  replyMessage: reply,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
