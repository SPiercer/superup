import 'package:camera/camera.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_one_signal/v_chat_one_signal.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'app/core/app_service.dart';
import 'app/core/lazy_injection.dart';
import 'app/routes/app_pages.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<AppService>(AppService());
  await VChatController.init(
    vChatConfig: VChatConfig(
        encryptHashKey: "V_CHAT_SDK_V2_VERY_STRONG_KEY",
        baseUrl: SConstants.vChatBaseUrl,
        oneSignalPushProvider: VPlatforms.isWeb
            ? null
            : VChatOneSignalProver(
                appId: "609f7bcb-96ae-4a9c-a96f-f1005c26a2dc",
                enableForegroundNotification: true,
              )),
    vMessagePageConfig: VMessagePageConfig(
      onMentionPress: (context, id) {},
      onMentionRequireSearch: (context, roomType, query) async {
        return [];
      },
    ),
    vNavigator: VNavigator(
      roomNavigator: roomDefaultNavigator,
      messageNavigator: messageDefaultNavigator,
    ),
  );
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  runApp(
    OverlaySupport.global(
      child: GetBuilder<AppService>(
        assignId: true,
        builder: (appService) {
          return GetMaterialApp(
            title: SConstants.appName,
            opaqueRoute: Get.isOpaqueRouteDefault,
            popGesture: Get.isPopGestureEnable,
            themeMode: appService.themeMode,
            initialRoute: AppPages.INITIAL,
            builder: (context, child) {
              return ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(
                  context,
                  child!,
                ),
                maxWidth: 1000,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
              );
            },
            initialBinding: LazyInjection(),
            fallbackLocale: const Locale("en"),
            debugShowCheckedModeBanner: false,
            theme: FlexThemeData.light(
              scheme: FlexScheme.gold,
              useMaterial3: true,
              useMaterial3ErrorColors: true,
              transparentStatusBar: true,
              appBarBackground: Colors.yellow.shade400,
              scaffoldBackground: const Color(0xffdaf5e0),
              extensions: [
                VMessageTheme.dark().copyWith(
                  scaffoldDecoration: sMessageBackground(isDark: false),
                )
              ],
            ),
            // The Mandy red, dark theme.
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.green,
              useMaterial3: true,
              scaffoldBackground: const Color(0xff252323),
              useMaterial3ErrorColors: true,
              appBarBackground: const Color(0xff3b3737),
              transparentStatusBar: true,
              extensions: [
                VMessageTheme.dark().copyWith(
                  scaffoldDecoration: sMessageBackground(isDark: true),
                )
              ],
            ),
            getPages: AppPages.routes,
            defaultTransition: Transition.leftToRight,
            enableLog: !kReleaseMode,
          );
        },
      ),
    ),
  );
}
