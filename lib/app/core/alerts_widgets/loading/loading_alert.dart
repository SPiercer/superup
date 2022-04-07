import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_widget.dart';

class LoadingAlert {
  dynamic show({String text = "connecting..."}) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (c) => CupertinoAlertDialog(
          content: LoadingWidget(
            text: text,
          ),
        ),
      );
    }

    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (x) {
        return AlertDialog(
          content: LoadingWidget(
            text: text,
          ),
        );
      },
    );
  }
}
