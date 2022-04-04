import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    startNavigate();
  }

  void startNavigate() async {
    await Future.delayed(const Duration(milliseconds: 700));
    Get.offAndToNamed(Routes.PRIVACY_POLICY);
  }
}
