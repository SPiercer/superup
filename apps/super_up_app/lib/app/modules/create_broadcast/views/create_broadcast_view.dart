import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/create_broadcast_controller.dart';

class CreateBroadcastView extends StatefulWidget {
  const CreateBroadcastView({Key? key, required this.users}) : super(key: key);
  final List<SBaseUser> users;
  @override
  State<CreateBroadcastView> createState() => _CreateBroadcastViewState();
}

class _CreateBroadcastViewState extends State<CreateBroadcastView> {
  late final CreateBroadcastController controller;

  @override
  void initState() {
    super.initState();
    controller = CreateBroadcastController(widget.users, context);
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createGroup,
        child: const Icon(Icons.done),
      ),
      appBar: AppBar(
        title: const Text('Create Broadcast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, __, ___) {
            return Center(
              child: Column(
                children: [
                  VImagePicker(
                    onDone: (VPlatformFileSource file) {
                      controller.image = file;
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
