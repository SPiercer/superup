import 'package:get/get.dart';

import '../controllers/star_messages_controller.dart';

class StarMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StarMessagesController>(
      StarMessagesController(),
    );
  }
}
