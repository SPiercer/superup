import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/splash.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import 'package:v_chat_web_rtc/v_chat_web_rtc.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  _inject();
  await dotenv.load(fileName: ".env");
  await VChatController.init(
    navigatorKey: _navigatorKey,
    vChatConfig: VChatConfig(
      vPush: VPush(
          enableVForegroundNotification: true,
          vPushConfig: const VLocalNotificationPushConfig()),
      encryptHashKey: kDebugMode
          ? "V_CHAT_SDK_V2_VERY_STRONG_KEY"
          : dotenv.env['encryptHashKey']!,
      baseUrl: SConstants.vChatBaseUrl,
    ),
    vNavigator: VNavigator(
      callNavigator: vDefaultCallNavigator,
      roomNavigator: vDefaultRoomNavigator,
      messageNavigator: vDefaultMessageNavigator,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: SConstants.appName,
        navigatorKey: _navigatorKey,
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
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(
              context,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: context.isDark ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: context.isDark ? Colors.blueGrey : Colors.grey,
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: child!,
              ),
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
            background: Container(
              decoration: sMessageBackground(isDark: context.isDark),
            ),
          );
        },
        home: const SplashPage(),
        theme: FlexThemeData.light(
          scheme: FlexScheme.gold,
          useMaterial3: true,
          extensions: [
            VMessageTheme.light().copyWith(
              scaffoldDecoration: sMessageBackground(isDark: false),
            )
          ],
          useMaterial3ErrorColors: true,
          transparentStatusBar: true,
          appBarElevation: 0,
          appBarBackground: Colors.yellow.shade400,
          scaffoldBackground: const Color(0xffdaf5e0),
        ),
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
      ),
    );
  }
}

void _inject() {
  GetIt.I.registerSingleton<AuthApiService>(AuthApiService.init());
  GetIt.I.registerSingleton<ProfileApiService>(ProfileApiService.init());
}
