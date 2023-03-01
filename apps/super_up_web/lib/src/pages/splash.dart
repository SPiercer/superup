import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:super_up_web/src/pages/login/login_page.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void init() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);
    if (isLogin) {
      context.toPageAndRemoveAll(const HomePage());
    } else {
      context.toPageAndRemoveAll(const LoginPage());
    }
  }
}
