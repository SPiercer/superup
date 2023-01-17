import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/rooms_tab_controller.dart';

class RoomsTabView extends GetView<RoomsTabController> {
  const RoomsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: AppColors.buttonBackground,
        onPressed: controller.onFlatMessageIconPress,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: Text("rooms"),
    );
  }
}
