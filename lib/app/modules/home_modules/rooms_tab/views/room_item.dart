import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightbox/lightbox.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/core/enums/message_status.dart';
import 'package:superup/app/core/enums/room_type.dart';
import 'package:superup/app/core/enums/room_typing_type.dart';
import 'package:superup/app/models/room/room.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/controllers/rooms_tab_controller.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/views/view_image_page.dart';
import 'package:textless/textless.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/colored_circle_container.dart';
import '../../../../models/user/user.dart';

class RoomItem extends GetWidget<RoomsTabController> {
  final Room _room;
  final User _myModel;

  const RoomItem(
    this._room,
    this._myModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Room>(
      stream: controller.roomUpdaterStream
          .skipWhile((element) => _room.id != element.id),
      initialData: _room,
      builder: (context, snapshot) {
        // if (snapshot.data != null && snapshot.data! == _room) {
        //   _room = snapshot.data!;
        // }
        return Container(
          color: _room.isSelected
              ? Colors.grey.withOpacity(.2)
              : Colors.transparent,
          child: ListTile(
            onLongPress: () {
              controller.onRoomLongTap(_room);
            },
            onTap: () {
              controller.onRoomTap(_room);
            },
            leading: Hero(
              tag: "imageHero${_room.hashCode}",
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return ViewImagePage(_room);
                      },
                    ),
                  );
                },
                child: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.transparent,
                  radius: 35,
                  backgroundImage: NetworkImage(_room.thumbImage),
                ),
              ),
            ),
            isThreeLine: false,
            contentPadding: EdgeInsets.zero,
            style: ListTileStyle.list,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _room.title.h6.maxLine(1).alignStart.overflowEllipsis,
                ),
                getMessageTime()
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getTypingOrMessage(),
                Row(
                  children: [getIsMuted(), getRoomUnreadCount()],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getMessageTime() {
    return _room.lastMessageTimeString.h6.size(14).regular.color(
          _room.isRoomUnread
              ? AppColors.unreadMessageColor
              : AppColors.readMessageColor,
        );
  }

  Widget getRoomUnreadCount() {
    return _room.isRoomUnread
        ? ColoredCircleContainer(
            text: _room.unReadCount.toString(),
            padding: const EdgeInsets.all(6),
            backgroundColor: AppColors.unreadMessageColor,
          )
        : Padding(
            padding: const EdgeInsets.all(6),
            child: "".text,
          );
  }

  Widget getIsMuted() {
    return AppIcons.muteIcon;
  }

  Widget getMessageStatusIfSender() {
    final isSender = _room.lastMessage.senderId == User.myUser.id;
    Widget icon = AppIcons.sendMessage;
    if (isSender) {
      if (_room.lastMessage.messageStatus == MessageStatus.localSend) {
        icon = AppIcons.pendingMessage;
      } else if (_room.lastMessage.seenAt != null) {
        icon = AppIcons.deliverMessageStatus;
      } else if (_room.lastMessage.deliveredAt != null) {
        icon = AppIcons.seenMessageStatus;
      }
      return Padding(
        padding: const EdgeInsets.only(right: 3),
        child: icon,
      );
    }
    return const SizedBox.shrink();
  }

  Widget getTypingOrMessage() {
    final _roomStatus = _room.typingStatus.status;
    if (_roomStatus != RoomTypingType.stop) {
      if (_room.roomType == RoomType.single) {
        return "${_roomStatus.name} ...".text.color(AppColors.typingColor);
      } else if (_room.roomType == RoomType.groupChat) {
        return "${_room.typingStatus.name} is ${_roomStatus.name} ..."
            .text
            .color(AppColors.typingColor);
      } else {
        print(
            "Exception here room_item.dart in getTypingOrMessage() method the type of this room not support change room status ! $_room");
        const SizedBox.shrink();
      }
    }
    return Flexible(
      child: Row(
        children: [
          getMessageStatusIfSender(),
          _room.isRoomUnread
              ? Flexible(
                  child: _room.lastMessage.content.text.medium.color(Colors.black)
                      .maxLine(1)
                      .overflowEllipsis,
                )
              : Flexible(
                  child: _room.lastMessage.content.text
                      .maxLine(1)
                      .overflowEllipsis,
                ),
        ],
      ),
    );
  }
}
