import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';
import 'package:get/get.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/routes/app_pages.dart';
import 'package:textless/textless.dart';

import '../controllers/status_tab_controller.dart';

class StatusTabView extends GetView<StatusTabController> {
  const StatusTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: controller.onFlatEditIconPress,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.buttonBackground,
            onPressed: controller.onFlatCameraIconPress,
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.USER_STATUS);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusView(
                    radius: 28,
                    spacing: 15,
                    strokeWidth: 2,
                    indexOfSeenStatus: 2,
                    numberOfStatus: 2,
                    padding: 4,
                    centerImageUrl: "https://picsum.photos/200/300",
                    seenColor: Colors.grey,
                    unSeenColor: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      User.myUser.fullName.h6,
                      const SizedBox(
                        height: 2,
                      ),
                      "1 minute ago".s1.color(Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.USER_STATUS);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusView(
                    radius: 28,
                    spacing: 15,
                    strokeWidth: 2,
                    indexOfSeenStatus: 2,
                    numberOfStatus: 2,
                    padding: 4,
                    centerImageUrl: "https://picsum.photos/200/300",
                    seenColor: Colors.grey,
                    unSeenColor: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      User.myUser.fullName.h6,
                      const SizedBox(
                        height: 2,
                      ),
                      "1 minute ago".s1.color(Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
