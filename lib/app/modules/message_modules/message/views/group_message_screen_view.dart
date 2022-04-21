import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/widgets/get_full.dart';
import 'package:superup/app/modules/message_modules/message/widgets/message_item.dart';

import '../../../../models/user/user.dart';
import '../controllers/message_controller.dart';
import '../features/message_input/message_input_widget.dart';
import '../widgets/arrow_down.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/message/default_wallpaper.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            /// list view
            Expanded(
              child: Stack(
                children: [
                  Obx(() {
                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 10),
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
                  const PositionedDirectional(
                    bottom: 10,
                    child: ArrowDown(),
                    end: 10,
                  ),
                ],
              ),
            ),

            /// submit inputs
            Obx(
                  () {
                final reply = controller.downArrow.value.replyMessage;
                final leaverId = controller.room.value.leaverId;
                return MessageInputWidget(
                  onSubmit: (msg) {
                    controller.onSubmitInsertMessage(msg);
                  },
                  myUser: User.myUser,
                  typingType: (typing) {},
                  leaverId: leaverId,
                  replyMessage: reply,
                  roomId: controller.room.value.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
