import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/create_group_controller.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: controller.createGroup,
      ),
      appBar: AppBar(
        title: const Text('Create Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CreateGroupController>(
          assignId: true,
          builder: (logic) {
            return Center(
              child: Column(
                children: [
                  VImagePicker(
                    onDone: (VPlatformFileSource file) {
                      controller.image =file;
                    },
                    initImage: VPlatformFileSource.fromAssets(
                      assetsPath: "assets/ss.png",
                    ),
                    withCrop: true,
                    size: 120,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  STextFiled(
                    controller: controller.txtController,
                    textHint: 'group name',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
