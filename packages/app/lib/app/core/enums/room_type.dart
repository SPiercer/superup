import 'package:flutter/foundation.dart';

enum RoomType { single, groupChat,broadcast }

extension RoomTypeEnum on RoomType {
  RoomType enumType(String type) {
    return RoomType.values.firstWhere((e) => e.name == type);
  }
  String get inString => describeEnum(this);
}

