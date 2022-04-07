import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';


class InfoAlert {
  dynamic show({required String text}) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (c) => CupertinoAlertDialog(
          content: Text(text),
          actions: [TextButton(onPressed: Get.back, child: "OK".text)],
        ),
      );
    }

    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (x) {
        return AlertDialog(
          content: Text(text),
          actions: [TextButton(onPressed: Get.back, child: "OK".text)],
        );
      },
    );
  }
}
