import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
