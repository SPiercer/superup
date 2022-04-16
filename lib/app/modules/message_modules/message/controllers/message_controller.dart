import 'package:get/get.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../models/room/room.dart';


class MessageController extends GetxController {
  final room = (Get.arguments as Room).obs;

  void onTitlePress() {
    Get.toNamed(Routes.SINGLE_ROOM_SETTINGS,arguments: room);
  }
}
