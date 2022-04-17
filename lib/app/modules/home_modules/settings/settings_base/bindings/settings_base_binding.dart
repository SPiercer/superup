import 'package:get/get.dart';

import '../controllers/settings_base_controller.dart';

class SettingsBaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsBaseController>(
      () => SettingsBaseController(),
    );
  }
}
