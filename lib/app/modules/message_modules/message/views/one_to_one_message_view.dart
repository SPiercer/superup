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
import '../widgets/message_item.dart';

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
      floatingActionButton: Obx(() {
        final value = controller.downArrow.value.downArrowSpace;
        return Align(
          alignment: Alignment(1.0, value),
          child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: AppColors.iconGrayColor,
              )),
        );
      }),
      appBar: AppBar(
        title: const Text('OneToOneMessageView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/message/default_wallpaper.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              /// list view
              Expanded(
                child: Obx(() {
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
              ),

              /// submit inputs
              Obx(() {
                final isEnable = controller.downArrow.value.isReplyEnable;
                return Padding(
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
                                controller.onTextFieldHeightChange(size.height);
                              },
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: isEnable,
                                    child: Container(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              "xxxx".text,
                                              InkWell(
                                                onTap: controller.dismissReply,
                                                child: const Icon(Icons.clear),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: controller.showEmoji,
                                        child: const Icon(
                                          Icons.emoji_emotions_outlined,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: TextField(
                                            focusNode: controller.focusNode,
                                            controller: controller
                                                .textEditingController,
                                            maxLines: 5,
                                            minLines: 1,
                                            textInputAction:
                                                TextInputAction.newline,
                                            decoration:
                                                const InputDecoration.collapsed(
                                              hintText: 'Type a message...',
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(Icons.attach_file, size: 28),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: controller.insertMessage,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor),
                        ),
                      )
                    ],
                  ),
                );
              }),

              Obx(() {
                return Offstage(
                  offstage: !controller.emojiShowing.value,
                  child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                        onEmojiSelected: (Category category, Emoji emoji) {
                          controller.onEmojiSelected(emoji);
                        },
                        onBackspacePressed: controller.onBackspacePressed,
                        config: Config(
                            columns: 7,
                            // Issue: https://github.com/flutter/flutter/issues/28894
                            emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                            verticalSpacing: 0,
                            horizontalSpacing: 0,
                            initCategory: Category.RECENT,
                            bgColor: const Color(0xFFF2F2F2),
                            indicatorColor: Colors.blue,
                            iconColor: Colors.grey,
                            iconColorSelected: Colors.blue,
                            progressIndicatorColor: Colors.blue,
                            backspaceColor: Colors.blue,
                            skinToneDialogBgColor: Colors.white,
                            skinToneIndicatorColor: Colors.grey,
                            enableSkinTones: true,
                            showRecentsTab: true,
                            recentsLimit: 28,
                            tabIndicatorAnimDuration: kTabScrollDuration,
                            categoryIcons: const CategoryIcons(),
                            buttonMode: ButtonMode.MATERIAL)),
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
