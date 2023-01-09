import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/enums/room_type.dart';
import 'package:superup/app/models/room/room.dart';

import '../../../../core/constants/colors.dart';
import '../../../../routes/app_pages.dart';

class ViewImagePage extends StatelessWidget {
  final Room room;

  const ViewImagePage(this.room, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.black38,
        child: Hero(
            tag: 'imageHero${room.hashCode}',
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                //height: 300.0,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          SizedBox(
                            height: 300,
                            child: Center(
                                child: CachedNetworkImage(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              imageUrl: room.thumbImage,
                              fit: BoxFit.cover,
                            )),
                          ),
                          Container(
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
                            color: Colors.black.withOpacity(0.4),
                            child: Text(
                              room.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                      height: 0.05,
                    ),
                    room.roomType == RoomType.broadcast
                        ? _buildButtonsForBroadcast()
                        : _buildButtons()
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.message,
                color: AppColors.textFieldBorderColor,
              ),
              onPressed: () {
                if (room.roomType == RoomType.broadcast) {
                  Get.toNamed(Routes.BROADCAST_MESSAGE_SCREEN, arguments: room);
                } else if (room.roomType == RoomType.groupChat) {
                  Get.toNamed(Routes.GROUP_MESSAGE_SCREEN, arguments: room);
                } else {
                  Get.toNamed(Routes.ONE_TO_ONE_MESSAGE, arguments: room);
                }
              },
            ),
          ),
          Flexible(
            child: IconButton(
                icon: const Icon(
                  Icons.call,
                  color: AppColors.textFieldBorderColor,
                ),
                onPressed: () {}),
          ),
          Flexible(
            child: IconButton(
                icon: const Icon(
                  Icons.videocam,
                  color: AppColors.textFieldBorderColor,
                ),
                onPressed: () {}),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.info_outline,
                color: AppColors.textFieldBorderColor,
              ),
              onPressed: () {
                Get.back();
                if (room.roomType == RoomType.single) {
                  Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
                } else if (room.roomType == RoomType.groupChat) {
                  Get.toNamed(Routes.GROUP_ROOM_SETTINGS, arguments: room);
                } else {
                  Get.toNamed(Routes.BROADCAST_ROOM_SETTINGS, arguments: room);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonsForBroadcast() {
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.message,
                color: AppColors.textFieldBorderColor,
              ),
              onPressed: () {
                if (room.roomType == RoomType.broadcast) {
                  Get.toNamed(Routes.BROADCAST_MESSAGE_SCREEN, arguments: room);
                } else if (room.roomType == RoomType.groupChat) {
                  Get.toNamed(Routes.GROUP_MESSAGE_SCREEN, arguments: room);
                } else {
                  Get.toNamed(Routes.ONE_TO_ONE_MESSAGE, arguments: room);
                }
              },
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.info_outline,
                color: AppColors.textFieldBorderColor,
              ),
              onPressed: () {
                Get.back();
                if (room.roomType == RoomType.single) {
                  Get.toNamed(Routes.SINGLE_ROOM_SETTINGS, arguments: room);
                } else if (room.roomType == RoomType.groupChat) {
                  Get.toNamed(Routes.GROUP_ROOM_SETTINGS, arguments: room);
                } else {
                  Get.toNamed(Routes.BROADCAST_ROOM_SETTINGS, arguments: room);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
