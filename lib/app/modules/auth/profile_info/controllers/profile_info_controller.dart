import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

class ProfileInfoController extends GetxController {
  void nextPress() {
    Get.offAllNamed(Routes.HOME);
  }
}
