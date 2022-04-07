import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class ConfirmPhoneAlert {
  dynamic show({required String text}) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        "You entered the phone number:".text,
        const SizedBox(height: 15),
        text.text.black,
        const SizedBox(height: 15),
        "Is this OK, or would you like to edit the number?".text
      ],
    );
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (c) => CupertinoAlertDialog(
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed:   Get.back , child: "Edit".text),
                TextButton(onPressed: () => Get.back(result: 1), child: "OK".text),
              ],
            )
          ],
        ),
      );
    }

    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (x) {
        return AlertDialog(
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: Get.back, child: "Edit".text),
                TextButton(onPressed: () => Get.back(result: 1), child: "OK".text),
              ],
            )
          ],
        );
      },
    );
  }
}
