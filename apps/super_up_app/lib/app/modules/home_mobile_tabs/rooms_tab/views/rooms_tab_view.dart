import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';

import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends StatefulWidget {
  const RoomsTabView({Key? key}) : super(key: key);

  @override
  State<RoomsTabView> createState() => _RoomsTabViewState();
}

class _RoomsTabViewState extends State<RoomsTabView> {
  late final RoomsTabController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<RoomsTabController>();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return VChatPage(
      context: context,
      appBar: null,
      controller: controller.vRoomController,
    );
  }
}
