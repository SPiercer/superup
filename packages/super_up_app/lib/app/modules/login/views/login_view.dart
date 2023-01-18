import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: context.height / 3,
              color: context.isDark ? const Color(0xff575353) : Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 90,
                    width: 90,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SConstants.appName.h3.color(Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: context.height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  STextFiled(
                    controller: controller.emailController,
                    textHint: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  STextFiled(
                    controller: controller.passwordController,
                    textHint: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FORGET_PASSWORD);
                      },
                      child: "Forget password".text.color(Colors.blue).black),
                  const SizedBox(
                    height: 40,
                  ),
                  SElevatedButton(
                    title: 'Login',
                    onPress: controller.login,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      const SizedBox(
                        width: 10,
                      ),
                      "or login with".s2.color(Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                        onTap: controller.facebook,
                        buttonType: ButtonType.facebook,
                        mini: true,
                      ),
                      FlutterSocialButton(
                        onTap: controller.apple,
                        mini: true,
                        buttonType: ButtonType.apple,
                      ),
                      FlutterSocialButton(
                        onTap: controller.google,
                        mini: true,
                        buttonType: ButtonType.google,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Need new account?".text,
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: "Register".text.color(Colors.blue).black,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}