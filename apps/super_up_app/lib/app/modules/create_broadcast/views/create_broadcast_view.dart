import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/create_broadcast_controller.dart';

class CreateBroadcastView extends GetView<CreateBroadcastController> {
  const CreateBroadcastView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: controller.createGroup,
      ),
      appBar: AppBar(
        title: const Text('Create Broadcast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CreateBroadcastController>(
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
                  const SizedBox(
                    height: 30,
                  ),
                  STextFiled(
                    controller: controller.txtController,
                    textHint: 'Broadcast name',
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
