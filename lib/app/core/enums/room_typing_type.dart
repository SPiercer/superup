import 'package:flutter/foundation.dart';

enum RoomTypingType { stop, typing, recording }

extension RoomTypingTypeEnum on RoomTypingType {

  RoomTypingType enumType(String type) {
    return RoomTypingType.values.firstWhere((e) => e.name == type);
  }
}
