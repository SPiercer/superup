import 'package:get/get.dart';

import '../controllers/rooms_tab_controller.dart';

class RoomsTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RoomsTabController>(
        RoomsTabController(),
    );
  }
}
