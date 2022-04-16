import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/alerts_widgets/permistion_alerts/permission_asker.dart';
import 'package:superup/app/core/enums/permission_type.dart';
import 'package:superup/app/core/widgets/app_state.dart';
import 'package:superup/app/modules/home_modules/home/controllers/home_controller.dart';
import '../../../../core/alerts_widgets/permistion_alerts/contacts_alert.dart';
import '../../../../models/room/room.dart';
import '../../../../routes/app_pages.dart';

class RoomsTabController extends GetxController {
  final state = CustomState().obs;
  final rooms = <Room>[];
  final _homeController = Get.find<HomeController>();
  final _roomUpdaterStream = StreamController<Room>.broadcast(sync: false);
  final scrollView = ScrollController();

  Stream<Room> get roomUpdaterStream => _roomUpdaterStream.stream;

  @override
  void onInit() {
    super.onInit();
    getRoomFromApis();
    //  addFakeRoom();
  }

  void addFakeRoom() async {
    await Future.delayed(const Duration(seconds: 4));

    rooms.insert(0, Room.roomToAdd);

    final fRoom = rooms.first;
    fRoom.lastMessage.content =
        "------------------------------------------------";
    fRoom.unReadCount = 0;
    await Future.delayed(const Duration(seconds: 2));
    final rRoom = rooms.last;
    rRoom.lastMessage.content = "2222222222222222222222222222222222222222";
    rRoom.unReadCount = 0;
    _roomUpdaterStream.add(rRoom);
    state.refresh();
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

  void getRoomFromApis() async {
    state.value = CustomLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    rooms.addAll(Room.dummyRooms);
    state.value = CustomLoadedState();
    // addFakeRoom();
  }

  void onFlatMessageIconPress() async {
    final res =
        await PermissionAsker.askPermission(permission: PermissionType.contacts);
    if (res == 1) {
      Get.toNamed(Routes.START_CHAT);
    }
  }
}
