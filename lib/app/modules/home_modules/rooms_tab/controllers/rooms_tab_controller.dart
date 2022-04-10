import 'dart:async';

import 'package:get/get.dart';
import 'package:superup/app/modules/home_modules/home/controllers/home_controller.dart';

import '../../../../models/room/room.dart';
import '../../../../routes/app_pages.dart';

class RoomsTabController extends GetxController {
  final rooms = Room.dummyRooms;
  final _homeController = Get.find<HomeController>();
  final _roomUpdaterStream = StreamController<Room>.broadcast(sync: false);

  Stream<Room> get roomUpdaterStream => _roomUpdaterStream.stream;

  @override
  void onInit() {
    super.onInit();
    updateRoom();
  }

  void onRoomTap(final Room _room) {
    if (_homeController.selectedRooms.isNotEmpty) {
      onRoomLongTap(_room);
      return;
    }
    Get.toNamed(Routes.MESSAGE, arguments: _room);
  }

  void unSelectRoom(final Room _room) {
    _room.isSelected = false;
    _roomUpdaterStream.add(_room);
  }

  void unSelectAllRoom() {
    for (final element in rooms) {
      element.isSelected = false;
      _roomUpdaterStream.add(element);
    }
  }

  void onRoomLongTap(final Room _room) {
    _homeController.selectRoom(_room);
    _room.isSelected = !_room.isSelected;
    _roomUpdaterStream.add(_room);
  }

  void updateRoom() async {
    await Future.delayed(const Duration(seconds: 10));
    final fRoom = Room.dummyRooms.first;
    fRoom.lastMessage.content =
        "------------------------------------------------";
    fRoom.unReadCount = 0;
    _roomUpdaterStream.add(fRoom);

    await Future.delayed(const Duration(seconds: 10));
    final rRoom = Room.dummyRooms.last;
    rRoom.lastMessage.content =
        "------------------------------------------------";
    rRoom.unReadCount = 0;
    _roomUpdaterStream.add(rRoom);
  }
}
