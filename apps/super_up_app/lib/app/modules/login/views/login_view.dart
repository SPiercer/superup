import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:super_up/app/modules/forget_password/views/forget_password_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/widgets/wide_constraints.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController(GetIt.I.get<AuthApiService>(),
        GetIt.I.get<ProfileApiService>(), context);
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
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return WideConstraints(
            enable: sizingInformation.isDesktop,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: context.mediaQuerySize.height / 3,
                    color:
                        context.isDark ? const Color(0xff575353) : Colors.amber,
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
                    height: context.mediaQuerySize.height * .02,
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
                              context.toPage(const ForgetPasswordView());
                            },
                            child: "Forget password"
                                .text
                                .color(Colors.blue)
                                .black),
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     FlutterSocialButton(
                        //       onTap: controller.facebook,
                        //       buttonType: ButtonType.facebook,
                        //       mini: true,
                        //     ),
                        //     FlutterSocialButton(
                        //       onTap: controller.apple,
                        //       mini: true,
                        //       buttonType: ButtonType.apple,
                        //     ),
                        //     FlutterSocialButton(
                        //       onTap: controller.google,
                        //       mini: true,
                        //       buttonType: ButtonType.google,
                        //     ),
                        //   ],
                        // ),
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
                                context.pop();
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
        },
      ),
    );
  }
}
