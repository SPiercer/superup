import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_constants.dart';
import 'package:superup/app/core/constants/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      defaultTransition: Transition.cupertino,
      title: AppConstants.appName,
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      enableLog: !kReleaseMode,
      getPages: AppPages.routes,
    );
  }
}
