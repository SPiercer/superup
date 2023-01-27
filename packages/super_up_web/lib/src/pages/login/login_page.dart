import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController(
    GetIt.I.get<AuthApiService>(),
    GetIt.I.get<ProfileApiService>(),
  );

  @override
  void initState() {
    super.initState();
    _controller.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset("assets/logo.png",height: 150,width: 150,),
            const SizedBox(
              height: 20,
            ),
            STextFiled(
              controller: _controller.emailController,
              textHint: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            STextFiled(
              controller: _controller.passwordController,
              textHint: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.mediaQuerySize.width * .2,
              child: SElevatedButton(
                title: "Login",
                onPress: _controller.login,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
