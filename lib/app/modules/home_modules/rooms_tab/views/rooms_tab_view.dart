import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/views/room_item.dart';

import '../../../../models/user/user.dart';
import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends GetView<RoomsTabController> {
  const RoomsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          key: const PageStorageKey<String>('RoomsTabView'),
          padding: const EdgeInsets.only(top: 10, left: 10, right: 7),
          itemBuilder: (context, index) {
            return RoomItem(
              controller.rooms[index],
              User.myUser,
            );
          },
          itemCount: controller.rooms.length,
        ),
      ),
    );
  }
}
