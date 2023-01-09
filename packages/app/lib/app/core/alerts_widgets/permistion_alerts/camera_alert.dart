import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';


class CameraDialog extends StatelessWidget {
  const CameraDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.iconGrayColor,
          width: double.infinity,
          height: 150,
          child: const Icon(
            Icons.camera,
            color: Colors.white,
            size: 45,
          ),
        ),
        Container(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          width: double.infinity,
          height: 100,
          child: const Padding(
            padding: EdgeInsets.only(top: 20, right: 15, left: 15),
            child: Text(
                "to send image we need to access your camera",
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Get.back(result: -1);
                },
                child: const Text("NOT NOW"),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Get.back(result: 1);
                },
                child: const Text("CONTINUE"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
