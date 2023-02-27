import 'package:camera/camera.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:super_up/v_chat_config.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_firebase_fcm/v_chat_firebase_fcm.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:window_manager/window_manager.dart';

import 'app/core/app_service.dart';
import 'app/core/lazy_injection.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

List<CameraDescription>? cameras;
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (VPlatforms.isDeskTop) {
    await _setDesktopWindow();
  }

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<AppService>(AppService());
  await initVChat(_navigatorKey);
  // FirebaseMessaging.onBackgroundMessage(vFirebaseMessagingBackgroundHandler);
  try {
    if (VPlatforms.isMobile) {
      cameras = await availableCameras();
    }
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
              return child!;
              // return ResponsiveWrapper.builder(
              //   BouncingScrollWrapper.builder(
              //     context,
              //     child!,
              //   ),
              //   maxWidth: 1000,
              //   minWidth: 450,
              //   defaultScale: true,
              //   breakpoints: [
              //     const ResponsiveBreakpoint.resize(450, name: MOBILE),
              //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              //     const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              //     const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              //     const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              //   ],
              // );
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

Future<void> _setDesktopWindow() async {
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(500, 900),
    size: Size(500, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: SConstants.appName,
    titleBarStyle: TitleBarStyle.normal,
    maximumSize: Size(700, 1500),
    fullScreen: false,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
