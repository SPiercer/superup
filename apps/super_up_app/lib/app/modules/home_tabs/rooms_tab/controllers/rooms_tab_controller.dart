import 'package:get/get.dart';
import 'package:super_up/app/routes/app_pages.dart';
import 'package:v_chat_room_page/v_chat_room_page.dart';

class RoomsTabController extends GetxController {
  final vRoomController = VRoomController();
  void onFlatMessageIconPress() {
    Get.toNamed(Routes.APP_MEMBERS);
  }
}
