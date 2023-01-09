import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:superup/app/models/status/status.dart';
import 'dart:math' as math;

class UserStatusController extends GetxController {
  final controller = StoryController();
  final status = Get.arguments as Status;
  final List<StoryItem> storyItems = [];

  @override
  void onInit() {
    super.onInit();
    for (final st in status.statusList) {
      storyItems.add(
        StoryItem.text(
          title: st.statusText,
          backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        ),
      );
    }
  }
}
