import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/models/room/v_chat_room_status_model.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/models/user/user_image.dart';

import '../../core/enums/room_type.dart';
import '../../core/enums/room_typing_type.dart';
import '../message/message.dart';

class Room {
  final String id;
  final RoomType roomType;
  String title;
  String thumbImage;
  bool isDeleted;
  bool isArchived;
  bool isMuted;
  final String? peerId;
  String? leaverId;
  int unReadCount;
  Message lastMessage;
  bool isSelected = false;
  final String creatorId;

//<editor-fold desc="Data Methods">

  Room({
    required this.id,
    required this.roomType,
    required this.title,
    required this.thumbImage,
    required this.isDeleted,
    required this.isArchived,
    required this.isMuted,
    required this.peerId,
    required this.typingStatus,
    required this.leaverId,
    required this.unReadCount,
    required this.lastMessage,
    required this.creatorId,
  });

  static final dummyRooms = [
    Room(
      id: 'xxx_single_chat_id_1',
      thumbImage:
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      title: 'test user',
      isArchived: false,
      typingStatus: VChatRoomStatusModel(
        name: "peer",
        roomId: "xxx_single_chat_id_1",
        status: RoomTypingType.stop,
        userId: "xxx_peer_id_1",
      ),
      lastMessage: Message.buildMessage(
        content:
            "content content content content content content content content content content content content",
        roomId: "xxx_single_chat_id_1",
        type: MessageType.text,
        myUser: User(
          id: "affa",
          fullName: "peer name",
          email: "dsfsdfdsf",
          userImages: User.myUser.userImages,
        ),
      ),
      creatorId: '',
      leaverId: '',
      unReadCount: 1,
      isDeleted: false,
      roomType: RoomType.single,
      isMuted: false,
      peerId: 'xxx_peer_id_1',
    ),
    Room(
      id: 'xxx_single_chat_id_2',
      thumbImage:
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      title: 'test user',
      isArchived: false,
      typingStatus: VChatRoomStatusModel(
        name: "peer",
        roomId: "xxx_single_chat_id_1",
        status: RoomTypingType.stop,
        userId: "xxx_peer_id_1",
      ),
      lastMessage: Message.buildMessage(
        content:
            "content content content content content content content content content content content content",
        roomId: "xxx_single_chat_id_1",
        type: MessageType.text,
        myUser: User.myUser,
      ),
      creatorId: '',
      leaverId: '',
      unReadCount: 1,
      isDeleted: false,
      roomType: RoomType.single,
      isMuted: false,
      peerId: 'xxx_peer_id_1',
    ),
    Room(
      id: 'xxx_single_chat_id_3',
      thumbImage:
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      title: 'test user',
      isArchived: false,
      typingStatus: VChatRoomStatusModel(
        name: "peer",
        roomId: "xxx_single_chat_id_1",
        status: RoomTypingType.stop,
        userId: "xxx_peer_id_1",
      ),
      lastMessage: Message.buildMessage(
        content:
            "content content content content content content content content content content content content",
        roomId: "xxx_single_chat_id_1",
        type: MessageType.text,
        myUser: User.myUser,
      ),
      creatorId: '',
      leaverId: '',
      unReadCount: 1,
      isDeleted: false,
      roomType: RoomType.single,
      isMuted: false,
      peerId: 'xxx_peer_id_1',
    ),
    Room(
      id: 'xxx_single_chat_id_4',
      thumbImage:
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      title: 'test user',
      isArchived: false,
      typingStatus: VChatRoomStatusModel(
        name: "peer",
        roomId: "xxx_single_chat_id_1",
        status: RoomTypingType.typing,
        userId: "xxx_peer_id_1",
      ),
      lastMessage: Message.buildMessage(
        content:
            "content content content content content content content content content content content content",
        roomId: "xxx_single_chat_id_1",
        type: MessageType.text,
        myUser: User.myUser,
      ),
      creatorId: '',
      leaverId: '',
      unReadCount: 1,
      isDeleted: false,
      roomType: RoomType.single,
      isMuted: false,
      peerId: 'xxx_peer_id_1',
    ),
    Room(
      id: 'xxx_single_chat_id_5',
      thumbImage:
          'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
      title: 'test user',
      isArchived: false,
      typingStatus: VChatRoomStatusModel(
        name: "peer",
        roomId: "xxx_single_chat_id_1",
        status: RoomTypingType.stop,
        userId: "xxx_peer_id_1",
      ),
      lastMessage: Message.buildMessage(
        content:
            "content content content content content content content content content content content content",
        roomId: "xxx_single_chat_id_1",
        type: MessageType.text,
        myUser: User.myUser,
      ),
      creatorId: '',
      leaverId: '',
      unReadCount: 1,
      isDeleted: false,
      roomType: RoomType.single,
      isMuted: false,
      peerId: 'xxx_peer_id_1',
    ),
    ///////////////////////////////////////////////////
    // ...List.generate(
    //     400,
    //     (index) => Room(
    //           id: 'xxx_single_chat_id_${index+20}',
    //           thumbImage:
    //               'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
    //           title: 'test user',
    //           isArchived: false,
    //           typingStatus: VChatRoomStatusModel(
    //             name: "peer",
    //             roomId: "xxx_single_chat_id_1",
    //             status: RoomTypingType.stop,
    //             userId: "xxx_peer_id_1",
    //           ),
    //           lastMessage: Message.buildMessage(
    //             content:
    //                 "content content content content content content content content content content content content",
    //             roomId: "xxx_single_chat_id_1",
    //             type: MessageType.text,
    //             myUser: User.myUser,
    //           ),
    //           creatorId: '',
    //           leaverId: '',
    //           unReadCount: 1,
    //           isDeleted: false,
    //           roomType: RoomType.single,
    //           isMuted: false,
    //           peerId: 'xxx_peer_id_1',
    //         ))
  ];

  //String get thumbImageS3 => ApiConstants.s3BucketBaseUrl + thumbImage;

  DateTime get lastMessageTime => lastMessage.createdAtDate;

  bool get isRoomUnread => unReadCount != 0;

  String get lastMessageTimeString =>
      DateFormat.jm().format(lastMessage.createdAtLocalDate);
  VChatRoomStatusModel typingStatus;

  bool isOnline = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Room{' +
        ' id: $id,' +
        ' roomType: $roomType,' +
        ' title: $title,' +
        ' thumbImage: $thumbImage,' +
        ' isDeleted: $isDeleted,' +
        ' isArchived: $isArchived,' +
        ' isMute: $isMuted,' +
        ' peerId: $peerId,' +
        ' leaverId: $leaverId,' +
        ' unReadCount: $unReadCount,' +
        ' lastMessage: $lastMessage,' +
        ' creatorId: $creatorId,' +
        '}';
  }

  // Map<String, dynamic> toLocalMap() {
  //   return {
  //     RoomTable.columnId: id,
  //     RoomTable.columnRoomType: roomType.name,
  //     RoomTable.columnTitle: title,
  //     RoomTable.columnThumbImage: thumbImage,
  //     RoomTable.columnIsDeleted: isDeleted ? 1 : 0,
  //     RoomTable.columnIsArchived: isArchived ? 1 : 0,
  //     RoomTable.columnIsMuted: isMuted ? 1 : 0,
  //     RoomTable.columnPeerId: peerId,
  //     RoomTable.columnTransTo: transTo,
  //     RoomTable.columnLeaverId: leaverId,
  //     RoomTable.columnUnReadCount: unReadCount,
  //     RoomTable.columnLastMessage: jsonEncode(lastMessage.toLocalMap()),
  //     RoomTable.columnCreatorId: creatorId,
  //   };
  // }

  Map<String, dynamic> toMap() {
    return {
      '_id': this.id,
      'roomType': this.roomType,
      'title': this.title,
      'thumbImage': this.thumbImage,
      'isDeleted': this.isDeleted,
      'isArchived': this.isArchived,
      'isMuted': this.isMuted,
      'peerId': this.peerId,
      'leaverId': this.leaverId,
      'unReadCount': this.unReadCount,
      'lastMessage': this.lastMessage,
      'creatorId': this.creatorId,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    const RoomType roomType = RoomType.broadcast;
    return Room(
      id: map['roomId'] as String,
      roomType: roomType.enumType(map['roomType']),
      title: map['title'] as String,
      thumbImage: map['thumbImage'] as String,
      isDeleted: map['isDeleted'] as bool,
      isArchived: map['isArchived'] as bool,
      isMuted: map['isMuted'] as bool,
      peerId: map['peerId'] as String?,
      leaverId: map['leaverId'] as String?,
      creatorId: map['creatorId'] as String,
      unReadCount: map['unReadCount'] as int,
      typingStatus: VChatRoomStatusModel(
          name: "-1", roomId: "", status: RoomTypingType.stop, userId: "xxx"),
      lastMessage: Message.fromMap(map['lastMessage']),
    );
  }

// factory Room.fromLocalMap(Map<String, dynamic> map) {
//   const RoomType roomType = RoomType.broadcast;
//   return Room(
//     id: map[RoomTable.columnId] as String,
//     roomType: roomType.enumType(map[RoomTable.columnRoomType]),
//     title: map[RoomTable.columnTitle] as String,
//     thumbImage: map[RoomTable.columnThumbImage] as String,
//     isDeleted: (map[RoomTable.columnIsDeleted] as int) == 1,
//     isArchived: (map[RoomTable.columnIsArchived] as int) == 1,
//     isMuted: (map[RoomTable.columnIsMuted] as int) == 1,
//     peerId: map[RoomTable.columnPeerId] as String?,
//     transTo: map[RoomTable.columnTransTo] as String?,
//     leaverId: map[RoomTable.columnLeaverId] as String?,
//     creatorId: map[RoomTable.columnCreatorId] as String,
//     unReadCount: map[RoomTable.columnUnReadCount] as int,
//     typingStatus: VChatRoomStatusModel(
//         name: "-1", roomId: "", status: RoomTypingType.stop, userId: "xxx"),
//     lastMessage:
//         Message.fromLocalMap(jsonDecode(map[RoomTable.columnLastMessage])),
//   );
// }

//</editor-fold>
}
