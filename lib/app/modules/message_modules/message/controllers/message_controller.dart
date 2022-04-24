import 'package:get/get.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/core/enums/room_type.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';
import 'down_arrow_model.dart';

class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;
  final myModel = User.myUser;
  final replyMessage = ReplyMessageState().obs;
  final messages = <Message>[
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
    )
  ].obs;

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
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
}
