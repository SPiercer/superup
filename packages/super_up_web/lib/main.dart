import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/home/home_page.dart';
import 'package:super_up_web/src/pages/login/login_page.dart';
import 'package:v_chat_message_page/v_chat_message_page.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _inject();
  await VAppPref.init();
  await VChatController.init(
    vChatConfig: VChatConfig(
      encryptHashKey: "V_CHAT_SDK_V2_VERY_STRONG_KEY",
      baseUrl: SConstants.vChatBaseUrl,
    ),
    vNavigator: VNavigator(
      roomNavigator: roomDefaultNavigator,
      messageNavigator: messageDefaultNavigator,
    ),
    vMessagePageConfig: VMessagePageConfig(
      onMentionPress: (context, id) {},
      onMentionRequireSearch: (context, roomType, query) async {
        return [];
      },
    ),
  );
  runApp(const MyApp());
}

void _inject() {
  GetIt.I.registerSingleton<AuthApiService>(AuthApiService.init());
  GetIt.I.registerSingleton<ProfileApiService>(ProfileApiService.init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(
              context,
              isLogin ? const HomePage() : child!,
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
        home: const LoginPage(),
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
