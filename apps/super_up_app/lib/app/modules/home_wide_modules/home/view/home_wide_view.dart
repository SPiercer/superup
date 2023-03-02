import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/modules/home_wide_modules/home/view/web_chat_scaffold.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controller/home_wide_controller.dart';

class HomeWideView extends StatefulWidget {
  const HomeWideView({Key? key}) : super(key: key);

  @override
  State<HomeWideView> createState() => _HomeWideViewState();
}

class _HomeWideViewState extends State<HomeWideView> {
  late final HomeWideController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeWideController(
      GetIt.I.get<ProfileApiService>(),
      context,
      GetIt.I.get<AuthApiService>(),
    );
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1600,
          ),
          child: Row(
            children: [
              SizedBox(
                width: isSmall ? 85 : 300,
                child: VChatPage(
                  context: context,
                  appBar: AppBar(
                    title: isSmall
                        ? Image.asset(
                            "assets/logo.png",
                            height: 30,
                            width: 30,
                          )
                        : const Text("start chat"),
                    actions: [
                      InkWell(
                        onTap: () async {
                          controller.logout(this.context);
                        },
                        child: const Icon(Icons.exit_to_app),
                      )
                    ],
                  ),
                  controller: controller.vRoomController,
                  useIconForRoomItem: isSmall,
                  onRoomItemPress: (room) {
                    controller.onRoomItemPress(room);
                  },
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: context.isDark ? Colors.black12 : Colors.white,
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
        ),
      ),
    );
  }

  bool get isSmall {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600;
  }
}
