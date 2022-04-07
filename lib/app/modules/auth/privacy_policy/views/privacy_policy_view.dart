import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/app_constants.dart';
import 'package:superup/app/routes/app_pages.dart';
import 'package:textless/textless.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Welcome to ${AppConstants.appName}".h4.medium,
              Image.asset("assets/privacy/ill_eula.png",
                  height: 300, width: 300, fit: BoxFit.contain),
              Column(
                children: [
                  "Read our privacy policy. Tap 'Agree and continue' to accept the Terms of Service "
                      .text
                      .alignCenter,
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text(
                      'Agree and continue'.toUpperCase(),
                    ),
                    onPressed: () {
                      Get.offAndToNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
