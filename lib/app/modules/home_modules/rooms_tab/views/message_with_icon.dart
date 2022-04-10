
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/enums/message_status.dart';
import '../../../../core/helpers.dart';
import '../../../../core/packages/auto_direction.dart';
import '../../../../models/message/message.dart';
import '../../../../models/room/room.dart';
import '../../../../models/user/user.dart';


class MessageWithIcon extends StatelessWidget {
  final Room _room;
  final User _myModel;

  const MessageWithIcon(this._room, this._myModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final   messageContent = Helpers.getMessageBody(_room.lastMessage);

    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: AutoDirection(
            text: messageContent,
            child: getMessageText(context, messageContent),
          ),
        ),
      ],
    );
  }

  Widget getMessageText(BuildContext context, String messageContent) {
    /// i the receiver
    if (_room.lastMessage.senderId != _myModel.id) {
      final _unReadCount = _room.unReadCount;

      /// I read the message
      if (_unReadCount == 0) {
        return messageContent.b1
            .color(Colors.grey)
            .maxLine(1)
            .alignStart
            .overflowEllipsis;
      } else {
        /// I not read  the message yet
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: messageContent.b1.bold.maxLine(1),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: _unReadCount.toString().s2.color(Colors.white),
              ),
            )
          ],
        );
      }
    } else {
      /// i the sender

      return Row(
        children: [
          _room.lastMessage.messageStatus == MessageStatus.localSend
              ? const Icon(
                  Icons.timer_outlined,
                  color: AppColors.sendMessageIcon,
                  size: 20,
                )
              : getServerSendStatus(_room.lastMessage),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: messageContent.b1
                .color(Colors.grey)
                .maxLine(1)
                .alignStart
                .overflowEllipsis,
          ),
        ],
      );
    }
  }

  Icon getServerSendStatus(Message lastMessage) {
    if (lastMessage.seenAt != null) {
      return const Icon(
        Icons.done_all,
        color: AppColors.seenMessageIcon,
        size: 20,
      );
    }
    if (lastMessage.deliveredAt != null) {
      return const Icon(
        Icons.done_all,
        size: 20,
        color: AppColors.deliverMessageIcon,
      );
    }
    return const Icon(
      Icons.done,
      size: 20,
      color: AppColors.sendMessageIcon,
    );
  }
}
