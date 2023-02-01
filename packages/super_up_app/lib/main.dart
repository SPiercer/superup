import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up/v_chat_config.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_firebase_fcm/v_chat_firebase_fcm.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_one_signal/v_chat_one_signal.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'app/core/app_service.dart';
import 'app/core/lazy_injection.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

List<CameraDescription>? cameras;
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<AppService>(AppService());
  await initVChat(_navigatorKey);
  FirebaseMessaging.onBackgroundMessage(vFirebaseMessagingBackgroundHandler);
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
            navigatorKey: _navigatorKey,
            title: SConstants.appName,
            opaqueRoute: Get.isOpaqueRouteDefault,
            popGesture: Get.isPopGestureEnable,
            themeMode: appService.themeMode,
            initialRoute: AppPages.INITIAL,
            localizationsDelegates: [
              // S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              VTrans.delegate,
            ],
            supportedLocales: const <Locale>[
              Locale.fromSubtags(languageCode: 'en'),
              Locale.fromSubtags(languageCode: 'ar'),
            ],
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

@pragma('vm:entry-point')
Future<void> vFirebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await VAppPref.init();
  final String? fromVChat = message.data['fromVChat'];
  final String? vMessage = message.data['vMessage'];
  if (fromVChat == null || vMessage == null) return Future<void>.value();
  final msg = MessageFactory.createBaseMessage(
    jsonDecode(vMessage) as Map<String, dynamic>,
  );
  final token = VAppPref.getHashedString(key: VStorageKeys.vAccessToken.name);
  if (token != null) {
    try {
      await _setDeliverForThisRoom(msg.roomId, token);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
  final x = VLocalNativeApi();
  await x.init();
  final insertRes = await x.message.safeInsertMessage(msg);
  if (insertRes == 1) {
    await x.room.updateRoomUnreadCountAddOne(msg.roomId);
  }
  return Future<void>.value();
}

@pragma('vm:entry-point')
Future _setDeliverForThisRoom(String roomId, String token) async {
  if (kDebugMode) {
    final res = await patch(
      Uri.parse(
        "${VAppConstants.emulatorBaseUrl}/channel/$roomId/deliver",
      ),
      headers: {
        'authorization': "Bearer $token",
        "clint-version": VAppConstants.clintVersion,
        "Accept-Language": "en"
      },
    );
    if (res.statusCode != 200) {
      throw "cant deliver the message status in background for ${VPlatforms.currentPlatform}";
    }
  } else {
    final res = await patch(
      Uri.parse("${VAppConstants.baseUri.toString()}/channel/$roomId/deliver"),
      headers: {
        'authorization': "Bearer $token",
        "clint-version": VAppConstants.clintVersion,
        "Accept-Language": "en"
      },
    );
    if (res.statusCode != 200) {
      print(res.body);
      print(res.statusCode);
      throw "cant deliver the message status in background for ${VPlatforms.currentPlatform}";
    }
  }
}
