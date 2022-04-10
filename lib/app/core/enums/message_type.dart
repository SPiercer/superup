import 'package:flutter/foundation.dart';

enum MessageType {
  text,
  image,
  file,
  video,
  voice,
  location,
  allDeleted,
  link,
  call,
  info,
  bot,
}
extension MessageTypeEnum on MessageType {

  MessageType enumType(String type) {
    return MessageType.values.firstWhere((e) => e.name == type);
  }
}
enum MessageContains {
  reply,
  forwarded,
  mention,
  broadcast,
}

extension X on MessageContains {
  String get inString => describeEnum(this);
  MessageContains enumType(String type) {
    return MessageContains.values.firstWhere((e) => e.name == type);
  }
}
enum GroupMsgInfo {
  gLeave,
  gJoin,
  gUpgrade,
  gDowngrade,
  gKick,
  gDataUpdate,
  bAdd,
  bKick,
  bDeleted,
}
extension GroupMsgInfoEnum on GroupMsgInfo {

  GroupMsgInfo enumType(String type) {
    return GroupMsgInfo.values.firstWhere((e) => e.name == type);
  }
}