import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/widgets/get_full.dart';
import 'package:superup/app/modules/message_modules/message/widgets/message_item.dart';

import '../controllers/message_controller.dart';

class GroupMessageScreenView extends StatefulWidget {
  const GroupMessageScreenView({Key? key}) : super(key: key);

  @override
  State<GroupMessageScreenView> createState() => _GroupMessageScreenViewState();
}

class _GroupMessageScreenViewState
    extends GetFull<GroupMessageScreenView, MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupMessageScreenView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/message/default_wallpaper.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    reverse: true,
                    itemBuilder: (context, index) => MessageItem(
                      msg: controller.messages[index],
                      controller: controller,
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: controller.messages.length,
                  );
                }),
              ),
              const CupertinoTextField(),
            ],
          )
        ],
      ),
    );
  }
}
