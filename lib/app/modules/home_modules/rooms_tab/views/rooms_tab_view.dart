import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/widgets/app_state.dart';
import 'package:superup/app/modules/home_modules/rooms_tab/views/room_item.dart';
import 'package:textless/textless.dart';

import '../../../../core/constants/colors.dart';
import '../../../../models/user/user.dart';
import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends GetView<RoomsTabController> {
  const RoomsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackground,
        onPressed: controller.onFlatMessageIconPress,
        child: const Icon(Icons.message,color: Colors.white,),
      ),
      body: Obx(() {
        final state = controller.state.value;
        if (state is CustomLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scrollbar(
          child: ListView.builder(
            key: UniqueKey(),
            controller: controller.scrollView,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, left: 10, right: 7),
            itemBuilder: (context, index) {
              return RoomItem(
                controller.rooms[index],
                User.myUser,
              );
            },
            itemCount: controller.rooms.length,
          ),
        );
      }),
    );
  }
}
