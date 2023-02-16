import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:super_up_admin/src/modules/home/home_page.dart';
import 'package:super_up_admin/src/modules/home/widgets/slider_colors.dart';
import 'package:super_up_admin/src/modules/login/login_screen.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VAppPref.init();
  _inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: VUtilsWrapper(
        builder: (context, locale, themeMode) => MaterialApp(
          title: "Admin",
          home: const HomePage(),
          theme: FlexThemeData.light(
            scheme: FlexScheme.gold,
            useMaterial3: true,
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
          ),
          themeMode: themeMode,
          locale: locale,
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
                    color: Colors.black,
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
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              backgroundColor: Colors.black,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            );
          },
        ),
      ),
    );
  }
}

void _inject() {
  GetIt.I.registerSingleton<VAdminApiService>(VAdminApiService.init());
  GetIt.I.registerSingleton<SAdminApiService>(SAdminApiService.init());
}
