import '../../core/enums/room_typing_type.dart';

class VChatRoomStatusModel {
  RoomTypingType status;
  String roomId;
  String userId;
  String name;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  VChatRoomStatusModel({
    required this.status,
    required this.roomId,
    required this.name,
    required this.userId,
  });

  @override
  String toString() {
    return 'RoomTyping{status: $status, roomId: $roomId, name: $name userId:$userId}';
  }

  factory VChatRoomStatusModel.fromMap(Map<String, dynamic> map) {
    const t = RoomTypingType.stop;
    return VChatRoomStatusModel(
      status: t.enumType(map['status'] as String),
      name: map['name'] as String,
      userId: map['userId'] as String,
      roomId: map['roomId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status.name,
      'name': name,
      'roomId': roomId,
      'userId': userId
    };
  }

//</editor-fold>

}
