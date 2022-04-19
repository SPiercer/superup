import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/room_typing_type.dart';
import 'package:superup/app/models/message/message.dart';
import 'package:superup/app/modules/message_modules/message/features/message_input/widgets/message_record_btn.dart';
import '../recorder/record_widget.dart';
import 'widgets/emoji_keyborad.dart';
import 'message_input_controller.dart';
import 'widgets/message_send_btn.dart';
import 'widgets/message_text_filed.dart';
import 'widgets/reply_item.dart';

class MessageInputWidget extends StatefulWidget {
  Message? replyMessage;
  final String? leaverId;
  final Function(Message message) onSubmit;
  final Function(RoomTypingType typingType) typingType;

  MessageInputWidget({
    Key? key,
    this.replyMessage,
    this.leaverId,
    required this.onSubmit,
    required this.typingType,
  }) : super(key: key);

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  late MessageInputController controller;

  @override
  void initState() {
    super.initState();
    controller = MessageInputController(
      onSubmit: (v) {
        widget.onSubmit(v);
        setState(() {
          widget.replyMessage = null;
        });
      },
      onTypingTypeChange: widget.typingType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () {
          final isSendBottomEnable = controller.isSendBottomEnable;
          final isRecording = controller.isRecording;
          controller.updateScreen.value;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: widget.replyMessage != null,
                              child: ReplyItem(
                                onDismissReply: () {
                                  setState(() {
                                    widget.replyMessage = null;
                                  });
                                },
                                replyMessage: widget.replyMessage,
                              ),
                            ),
                            if (isRecording)
                              RecordWidget(
                                controller: controller.recordController,
                                onClose: controller.onCloseRecordIconPress,
                              )
                            else
                              MessageTextFiled(
                                focusNode: controller.focusNode,
                                textEditingController:
                                    controller.textEditingController,
                                onShowEmoji: () {
                                  controller.showEmoji();
                                },
                              )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (isSendBottomEnable)
                      MessageSendBtn(
                        onInsert: controller.insertTextMessage,
                      )
                    else
                      MessageRecordBtn(
                        onRecordClick: controller.onRecordClick,
                      )
                  ],
                ),
              ),
              EmojiKeyboard(
                onBackspacePressed: controller.onBackspacePressed,
                onEmojiSelected: (e) {
                  controller.onEmojiSelected(e);
                },
                isEmojiShowing: controller.isEmojiShowing,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
