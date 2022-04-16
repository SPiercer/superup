import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

import '../controllers/user_status_controller.dart';

class UserStatusView extends GetView<UserStatusController> {
  const UserStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserStatusView'),

        centerTitle: true,
      ),
      body: StoryView(
        storyItems: controller.storyItems,
        controller: controller.controller,
        inline: false,
        repeat: false,
        onComplete: () {
          Navigator.pop(context);
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
