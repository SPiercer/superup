import 'package:flutter/material.dart';
import 'package:install/src/home_page.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VAppPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VUtilsWrapper(
      builder: (context, locale, themeMode) => MaterialApp(
        title: 'Install',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        themeMode: themeMode,
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
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
            maxWidth: 2000,
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
      ),
    );
  }
}
