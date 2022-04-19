import 'package:get/get.dart';

import 'manager/permission_manager.dart';

class LazyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionManager>(() => PermissionManager(),fenix: true);
  }
}
