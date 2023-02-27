import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../../calls_tab/controllers/calls_tab_controller.dart';
import '../../rooms_tab/controllers/rooms_tab_controller.dart';
import '../../status_tab/controllers/status_tab_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
         Get.find<ProfileApiService>()
      ),
    );

    Get.put<CallsTabController>(
      CallsTabController(),
    );
    Get.put<StatusTabController>(
      StatusTabController(),
    );
    Get.put<RoomsTabController>(
      RoomsTabController(),
    );

  }
}
