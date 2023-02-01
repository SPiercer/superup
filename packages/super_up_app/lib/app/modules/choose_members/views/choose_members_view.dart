import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/choose_members_controller.dart';

class ChooseMembersView extends GetView<ChooseMembersController> {
  const ChooseMembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onNext,
        child: Icon(Icons.send),
      ),
      appBar: AppBar(
        title: const Text('ChooseMembersView'),
      ),
      body: GetBuilder<ChooseMembersController>(
        assignId: true,
        builder: (logic) {
          return VAsyncWidgetsBuilder(
            loadingState: logic.loadingState,
            onRefresh: controller.getData,
            loadingWidget: () => const SLoadingWidget(),
            errorWidget: () => const SErrorWidget(),
            emptyWidget: () => const SEmptyWidget(),
            successWidget: () {
              return ListView.builder(
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  final item = logic.data[index];
                  return CheckboxListTile(
                    onChanged:(value) =>  controller.onSelectUser(item,value??false),
                    value: item.isSelected,

                    title: Row(
                      children: [
                        VCircleAvatar(fullUrl: item.baseUser.userImage),
                        SizedBox(width: 15,),
                        item.baseUser.fullName.text,
                      ],
                    ),
                  );
                },
                itemCount: logic.data.length,
              );
            },
          );
        },
      ),
    );
  }
}
