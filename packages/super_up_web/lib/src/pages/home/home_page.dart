import 'package:flutter/material.dart';
import 'package:super_up_web/src/pages/home/Home_controller.dart';
import 'package:super_up_web/src/pages/home/web_chat_scaffold.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: isMobile ? 85 : 300,
            child: VChatPage(
              appBar: AppBar(
                title: const Text("start chat"),
              ),
              controller: controller.vRoomController,
              useIconForRoomItem: isMobile,
              onRoomItemPress: (room) {
                controller.onRoomItemPress(room);
              },
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: context.isDark ? Colors.black12 : null,
          ),
          Flexible(
            child: Navigator(
              key: vWebChatNavigation.key,
              onGenerateRoute: vWebChatNavigation.onGenerateRoute,
              initialRoute: IdleRoute.route,
            ),
          )
        ],
      ),
    );
  }

  bool get isMobile {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600;
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
