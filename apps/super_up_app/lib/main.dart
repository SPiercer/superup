import 'package:camera/camera.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up/app/modules/splash/views/splash_view.dart';
import 'package:super_up/v_chat_config.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:v_chat_firebase_fcm/v_chat_firebase_fcm.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:window_manager/window_manager.dart';

import 'app/core/lazy_injection.dart';
import 'firebase_options.dart';

List<CameraDescription>? cameras;
final _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (VPlatforms.isDeskTop) {
    await _setDesktopWindow();
  }
  if (VPlatforms.isWeb) {
    //remove # from web url
    setPathUrlStrategy();
  }
  registerSingletons();
  await dotenv.load(fileName: ".env");
  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

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
      child: VUtilsWrapper(
        builder: (_, local, theme) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            title: SConstants.appName,
            themeMode: theme,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: child!,
                  ),
                ),
                // maxWidth: 1600,
                // minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
                breakpointsLandscape: [
                  const ResponsiveBreakpoint.resize(560, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(812, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1024, name: TABLET),
                  const ResponsiveBreakpoint.resize(1120, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(1600, name: "4K"),
                ],
              );
            },
            locale: local,
            home: const SplashView(),
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
          );
        },
      ),
    ),
  );
}

Future<void> _setDesktopWindow() async {
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    // minimumSize: Size(500, 900),
    // size: Size(500, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: SConstants.appName,
    titleBarStyle: TitleBarStyle.normal,
    // maximumSize: Size(700, 1500),
    fullScreen: false,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
