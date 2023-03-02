import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:super_up/app/modules/login/views/login_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../core/widgets/wide_constraints.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = RegisterController(GetIt.I.get<AuthApiService>(),
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                      children: [
                        STextFiled(
                          textHint: 'Name',
                          controller: controller.nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                          height: 20,
                        ),
                        STextFiled(
                          controller: controller.confirmController,
                          textHint: 'Confirm password',
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SElevatedButton(
                          title: 'Register',
                          onPress: controller.register,
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
                            "or signup with".s2.color(Colors.grey),
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
                            "Already have an account?".text,
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                context.toPage(const LoginView());
                              },
                              child: "Login".text.color(Colors.blue).black,
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
