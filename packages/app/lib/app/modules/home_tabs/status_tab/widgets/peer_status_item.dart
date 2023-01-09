import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_view/status_view.dart';
import 'package:superup/app/models/status/status.dart';
import 'package:textless/textless.dart';

import '../../../../models/user/user.dart';
import '../../../../routes/app_pages.dart';

class PeerStatusItem extends StatelessWidget {
  final Status status;

  const PeerStatusItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.USER_STATUS, arguments: status);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatusView(
            radius: 28,
            spacing: 15,
            strokeWidth: 2,
            indexOfSeenStatus: 2,
            numberOfStatus: status.statusList.length,
            padding: 4,
            centerImageUrl: "https://picsum.photos/200/${Random().nextInt(
                400)}",
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
              User.myUser.fullName.text.bold,
              const SizedBox(
                height: 2,
              ),
              "1 minute ago".s1.color(Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
