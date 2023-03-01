import 'package:flutter/material.dart';
import 'package:super_up/app/modules/splash/controllers/splash_controller.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashController controller;

  @override
  void initState() {
    super.initState();
    controller = SplashController(context);
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? null : const Color(0xffddf1cb),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SConstants.appName.h6
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        "From".text,
                        const SizedBox(
                          height: 5,
                        ),
                        "v chat".h6.color(Colors.green).black
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, child) {
                      return controller.version.cap;
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
