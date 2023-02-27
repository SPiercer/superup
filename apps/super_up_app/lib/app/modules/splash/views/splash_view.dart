import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_chat_utils/v_chat_utils.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

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
              Image.asset(
                "assets/logo.png",
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
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
              const SizedBox(
                height: 4,
              ),
              Obx(() =>controller.version.value.cap )
            ],
          ),
        ),
      ),
    );
  }
}
