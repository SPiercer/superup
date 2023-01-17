import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';

class RoomsTabController extends GetxController {
  void onFlatMessageIconPress() {
    Get.toNamed(Routes.APP_MEMBERS);
  }
}
