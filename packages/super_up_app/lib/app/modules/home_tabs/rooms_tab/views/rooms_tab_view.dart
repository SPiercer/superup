import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';

import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends GetView<RoomsTabController> {
  const RoomsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChatPage(
      context: context,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: AppColors.buttonBackground,
        onPressed: controller.onFlatMessageIconPress,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      appBar: null,
      controller: controller.vRoomController,
    );
  }
}
