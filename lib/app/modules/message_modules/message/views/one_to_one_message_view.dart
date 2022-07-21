import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/widgets/get_full.dart';

import '../../../../models/user/user.dart';
import '../controllers/message_controller.dart';
import '../features/message_input/message_input_widget.dart';
import '../widgets/arrow_down.dart';
import '../widgets/message_item.dart';

class OneToOneMessageView extends StatefulWidget {
  const OneToOneMessageView({Key? key}) : super(key: key);

  @override
  State<OneToOneMessageView> createState() => _OneToOneMessageViewState();
}

class _OneToOneMessageViewState
    extends GetFull<OneToOneMessageView, MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneToOneMessageView'),
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
                  Obx(
                    () {
                      return ListView.separated(
                        padding: const EdgeInsets.only(bottom: 10),
                        reverse: true,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) => MessageItem(
                          msg: controller.messages[index],
                          index: index,
                          controller: controller,
                        ),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: controller.messages.length,
                      );
                    },
                  ),
                  PositionedDirectional(
                    bottom: 10,
                    child: Obx(() {
                      final isShown = controller.isDownArrowShown.value;
                      if (!isShown) {
                        return const SizedBox();
                      }

                      return ArrowDown(
                        onPress: () {
                          controller.scrollDown();
                        },
                      );
                    }),
                    end: 20,
                  ),
                ],
              ),
            ),

            /// submit inputs
            SafeArea(
              child: MessageInputWidget(
                myUser: User.myUser,
                rxReplyState: controller.replyMessage,
                onSubmit: (msg) {
                  controller.onSubmitInsertMessage(msg);
                },
                typingType: (typing) {},
                rxRoom: controller.room,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MessageController>();
    super.dispose();
  }
}
