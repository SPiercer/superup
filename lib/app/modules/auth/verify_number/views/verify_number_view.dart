import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:textless/textless.dart';

import '../controllers/verify_number_controller.dart';

class VerifyNumberView extends GetView<VerifyNumberController> {
  const VerifyNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 'Verifying your number'.h4.size(22),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            "Waiting to automatically detect an SMS send to ".b2.alignCenter,
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "+20 1123455456. ".text.black,
                InkWell(
                    onTap: Get.back,
                    child: "Wrong number?".text.color(AppColors.linkColor)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    cursorHeight: 25,
                    controller: controller.txtController,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: "— — —    — — —",
                      alignLabelWithHint: true,
                    ),
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  "Enter 6 digital code".text.color(AppColors.accentColor),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                // enabled: controller.isResendSmsEnabled.value,
                enabled: false,
                trailing: CountdownTimer(
                  endTime: controller.endTime,
                  onEnd: controller.onOtpTimeEnd,
                  endWidget: const SizedBox(),
                ),
                leading: const Icon(Icons.message),
                title: "Resend SMS".text,
              ),
            )
          ],
        ),
      ),
    );
  }
}
