import 'package:get/get.dart';
import 'package:super_up_core/super_up_core.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(
        Get.find<AuthApiService>(),
        Get.find<ProfileApiService>(),
      ),
    );
  }
}
