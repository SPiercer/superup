import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';

import '../../../../core/widgets/get_full.dart';
import '../../../../models/user/user.dart';
import '../features/message_input/message_input_widget.dart';
import '../widgets/arrow_down.dart';
import '../widgets/message_item.dart';

class BroadcastMessageScreenView extends StatefulWidget {
  const BroadcastMessageScreenView({Key? key}) : super(key: key);

  @override
  State<BroadcastMessageScreenView> createState() =>
      _BroadcastMessageScreenViewState();
}

class _BroadcastMessageScreenViewState
    extends GetFull<BroadcastMessageScreenView, MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BroadcastMessageScreenView'),
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
                  myUser: User.myUser,
                  onSubmit: (msg) {
                    controller.onSubmitInsertMessage(msg);
                  },
                  typingType: (typing) {},
                  leaverId: leaverId,
                  roomId: controller.room.value.id,
                  replyMessage: reply,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
