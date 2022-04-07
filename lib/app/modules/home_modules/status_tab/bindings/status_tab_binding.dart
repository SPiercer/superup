import 'package:get/get.dart';

import '../controllers/status_tab_controller.dart';

class StatusTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusTabController>(
      () => StatusTabController(),
    );
  }
}
