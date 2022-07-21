import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/core/enums/room_type.dart';
import 'package:superup/app/models/message/attachments/message_attachment.dart';
import 'package:superup/app/models/message/attachments/msg_voice_info.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/routes/app_pages.dart';
import '../../../../core/enums/load_more_type.dart';
import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';
import 'down_arrow_model.dart';

class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;
  final myModel = User.myUser;
  final replyMessage = ReplyMessageState().obs;
  final isDownArrowShown = false.obs;
  int? currentPlayVoiceIndex;

  final messages = <Message>[
    Message.buildMessage(
      content: "content voice",
      roomId: "roomId",
      type: MessageType.voice,
      myId: User.myUser.id,
      attachments: MessageAttachment(
        msgVoiceInfo: MsgVoiceInfo(
          playUrl:
              "https://weellu-chat.s3.us-east-2.amazonaws.com/62163081e2aad4f4a908d89a/cv503-a304ed2a-62d9-43f7-b410-befd94417904.m4a",
          voiceDuration: "1:00",
          voiceSize: "11 MB",
        ),
      ),
    ),
    Message.buildMessage(
      content: "content 1",
      roomId: "roomId",
      type: MessageType.text,
      myId: User.myUser.id,
    ),
    Message.buildMessage(
      content: "content 2",
      roomId: "roomId",
      type: MessageType.text,
      myId: User.myUser.id,
    ),
    Message.buildMessage(
      content: "content 3",
      roomId: "roomId",
      type: MessageType.text,
      myId: User.myUser.id,
    ),
  ].obs;

  /// list view scroll
  final scrollController = ScrollController();

  /// message list view loadMore status
  LoadMoreStatus loadingStatus = LoadMoreStatus.loaded;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
  }

  void _scrollListener() {
    final maxScrollExtent = scrollController.position.maxScrollExtent / 2;
    if (scrollController.offset > 150.0) {
      isDownArrowShown.value = true;
    } else {
      isDownArrowShown.value = false;
    }

    if (scrollController.offset > maxScrollExtent &&
        loadingStatus != LoadMoreStatus.loading &&
        loadingStatus != LoadMoreStatus.completed) {
      loadMoreMessages();
    }
  }

  void onSubmitInsertMessage(Message msg) {
    msg.roomId = room.value.id;
    msg.senderId = myModel.id;
    msg.broadcastId =
        (room.value.roomType == RoomType.broadcast) ? room.value.id : null;
    // only for testing
    msg.content = msg.toString();
    messages.insert(0, msg);
  }

  void addFake() async {}

  void onRightSwipe(Message msg) {
    replyMessage.value.replyMessage = msg;
    replyMessage.refresh();
  }

  Future loadMoreMessages() async {}

  Future playVoice(int index) async {
    currentPlayVoiceIndex = index;
    messages[currentPlayVoiceIndex!]
        .messageAttachment!
        .msgVoiceInfo!
        .playDuration = 10;
    update([index]);
  }

  void scrollDown() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
