import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/home/home_controller.dart';
import 'package:super_up_web/src/pages/home/web_chat_scaffold.dart';
import 'package:super_up_web/src/pages/login/login_page.dart';
import 'package:super_up_web/src/pages/splash.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(GetIt.I.get<ProfileApiService>());

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
              context: context,
              appBar: AppBar(
                title: isMobile
                    ? Image.asset(
                        "assets/logo.png",
                        height: 30,
                        width: 30,
                      )
                    : const Text("start chat"),
                actions: [
                  InkWell(
                    onTap: () async {
                      final context = this.context;
                      final res = await VAppAlert.showAskYesNoDialog(
                        context: context,
                        title: "log out",
                        content: "are you sure to logout?",
                      );
                      if (res == 1) {
                        await vSafeApiCall<void>(
                          onLoading: () {
                            VAppAlert.showLoading(
                              context: context,
                              isDismissible: true,
                            );
                          },
                          onError: (exception, trace) {
                            VAppAlert.showOkAlertDialog(
                              context: context,
                              title: "Error",
                              content: exception,
                            );
                          },
                          request: () async {
                            try {
                              await GetIt.I.get<AuthApiService>().logout(
                                    isLogoutFromALl: false,
                                  );
                              await VChatController.I.profileApi.logout();
                            } catch (err) {
                              print(err);
                            }
                            return VAppPref.clear();
                          },
                          onSuccess: (response) {
                            context.toPage(const SplashPage());
                          },
                          ignoreTimeoutAndNoInternet: false,

                        );
                      }
                    },
                    child: Icon(Icons.exit_to_app),
                  )
                ],
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
