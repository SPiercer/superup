import 'package:get/get.dart';
 import 'package:super_up_core/super_up_core.dart';

class LazyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApiService>(() => AuthApiService.init(), fenix: true);
    Get.lazyPut<ProfileApiService>(() => ProfileApiService.init(), fenix: true);
  }
}
