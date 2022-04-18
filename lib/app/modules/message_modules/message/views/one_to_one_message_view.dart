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
import '../widgets/arrow_down.dart';
import '../widgets/emoji_keyborad.dart';
import '../widgets/message_item.dart';
import '../widgets/message_send_btn.dart';
import '../widgets/message_text_filed.dart';
import '../widgets/reply_item.dart';

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
                  const PositionedDirectional(bottom: 10,child: ArrowDown(),end: 10),
                ],
              ),
            ),

            /// submit inputs
            Obx(
                  () {
                final isReplyEnable =
                    controller.downArrow.value.isReplyEnable;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                    ///MessageTextFiled
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Obx(() {
                                controller.textMessage.value;
                                return MeasuredSize(
                                  onChange: (size) {
                                    controller
                                        .onTextFieldHeightChange(size.height);
                                  },
                                  child: Column(
                                    children: [
                                      Visibility(
                                        visible: isReplyEnable,
                                        child: ReplyItem(
                                          controller: controller,
                                        ),
                                      ),
                                      MessageTextFiled(
                                        controller: controller,
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MessageSendBtn(
                            onInsert: controller.insertMessage,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            EmojiKeyboard(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
