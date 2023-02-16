import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFiled = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 400,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SConstants.appName.h5,
                const Divider(),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PasswordField(
                          color: Colors.green,
                          controller: _passwordFiled,
                          autoFocus: true,
                          errorMessage: "",
                          maxLength: 1,
                          inputDecoration: PasswordDecoration(),
                          hintText: 'Password',
                          border: PasswordBorder(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.red.shade200,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_passwordFiled.text.isEmpty) {
                              return;
                            }
                            VAppAlert.showLoading(
                              context: context,
                              isDismissible: true,
                            );

                            _login();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: "Login".h6,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    await vSafeApiCall(
      request: () async {
        return  await GetIt.I.get<VAdminApiService>().getDashboard();
        return true;
      },
      onSuccess: (response) async {
        print(response.toString());
      },
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(
          context: context,
          msg: exception,
        );
      },
    );
    await vSafeApiCall(
      request: () async {
        await GetIt.I.get<SAdminApiService>().login("password");
        return true;
      },
      onSuccess: (response) async {},
      onError: (exception, trace) {
        VAppAlert.showErrorSnackBar(
          context: context,
          msg: exception,
        );
      },
    );

    context.pop();
  }
}
