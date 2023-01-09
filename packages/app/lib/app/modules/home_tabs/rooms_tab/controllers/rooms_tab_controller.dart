import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/alerts_widgets/permistion_alerts/permission_asker.dart';
import 'package:superup/app/core/enums/permission_type.dart';
import '../../../../core/enums/room_type.dart';
import '../../../../core/widgets/app_state.dart';
import '../../../../models/room/room.dart';
import '../../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

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

  void onRoomTap(final Room room) {
    if (_homeController.selectedRooms.isNotEmpty) {
      onRoomLongTap(room);
      return;
    }
    if (room.roomType == RoomType.broadcast) {
      Get.toNamed(Routes.BROADCAST_MESSAGE_SCREEN, arguments: room);
    } else if (room.roomType == RoomType.groupChat) {
      Get.toNamed(Routes.GROUP_MESSAGE_SCREEN, arguments: room);
    } else {
      Get.toNamed(Routes.ONE_TO_ONE_MESSAGE, arguments: room);
    }
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
    final res = await PermissionAsker.askPermission(
        permission: PermissionType.contacts);
    if (res == 1) {
      Get.toNamed(Routes.START_CHAT);
    }
  }
}
