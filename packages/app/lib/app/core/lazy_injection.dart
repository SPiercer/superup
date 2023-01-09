import 'package:get/get.dart';
import 'package:superup/app/core/alerts_widgets/permistion_alerts/permission_asker.dart';

import 'manager/media_manager.dart';
import 'manager/permission_manager.dart';

class LazyInjection extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<PermissionManager>(() => PermissionManager(),fenix: true);
    Get.lazyPut<MediaManager>(() => MediaManager(),fenix: true);
  }
}
