import 'package:get/get.dart';

import '../controllers/my_status_details_controller.dart';

class MyStatusDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyStatusDetailsController>(
      MyStatusDetailsController(),
    );
  }
}
