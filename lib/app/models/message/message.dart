import 'dart:math';

import 'package:intl/intl.dart';

import '../../core/enums/message_status.dart';
import '../../core/enums/message_type.dart';
import '../user/user.dart';
import 'attachments/message_attachment.dart';

class Message implements Comparable {
  String id;
  String senderId;
  final String senderName;
  final String senderImageThumb;
  String roomId;
  String content;
  String? contentTr;
  String platform;
  MessageType messageType;
  MessageAttachment? messageAttachment;
  int seenCount;
  String? seenAt;
  String? deletedAt;
  String? broadcastId;
  String? deliveredAt;
  MessageContains? messageContains;
  String createdAt;
  final String updatedAt;
  MessageStatus messageStatus;
  int percentage = 0;
  int? localId;

//<editor-fold desc="Data Methods">

  Message({
    required this.id,
    required this.content,
    required this.contentTr,
    required this.platform,
    required this.messageType,
    required this.roomId,
    required this.messageContains,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveredAt,
    required this.seenAt,
    required this.deletedAt,
    required this.seenCount,
    required this.senderId,
    required this.senderName,
    required this.senderImageThumb,
    required this.broadcastId,
    required this.messageAttachment,
    required this.messageStatus,
    required this.localId,
  });

  DateTime get createdAtDate => DateTime.parse(createdAt);

  //String get senderImageThumbS3 => ApiConstants.s3BucketBaseUrl + senderImageThumb;

  DateTime get createdAtLocalDate => createdAtDate.toLocal();

  /// if Msg contain image
  bool get isImage => messageType == MessageType.image;

  String get imageUrl => messageAttachment!.msgImageInfo!.imageUrl;

  /// if Msg contain video
  bool get isVideo => messageType == MessageType.video;

  String? get videoImageUrl => messageAttachment!.msgVideoInfo!.imageThumbUrl;

  String get videoUrl => messageAttachment!.msgVideoInfo!.videoUrl;

  String get voiceUrl => messageAttachment!.msgVoiceInfo!.playUrl;

  bool get isVoice => messageType == MessageType.voice;

  bool get isFile => messageType == MessageType.file;

  bool get isLocalSend => messageStatus == MessageStatus.localSend;

  DateTime get updatedAtDate => DateTime.parse(updatedAt);

  static Message _getDefaultMsgObj() {
    return Message(
      id: "99999${DateTime.now().add(const Duration(days: 1200000)).millisecondsSinceEpoch}",
      localId: Random().nextInt(999999990),
      content: "defaultMsgObj",
      messageStatus: MessageStatus.localSend,
      messageType: MessageType.text,
      roomId: "defaultMsgObj",
      messageContains: null,
      contentTr: null,
      platform: "mobile",
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      deliveredAt: null,
      seenAt: null,
      deletedAt: null,
      seenCount: 1,
      senderId: "defaultMsgObj",
      senderName: "defaultMsgObj",
      senderImageThumb: "defaultMsgObj",
      broadcastId: null,
      messageAttachment: null,
    );
  }

  static Message buildMessage({
    required String content,
    String? roomId,
    bool containReply = false,
    required MessageType type,
    String? myId,
    String? broadcastId,
    MessageAttachment? attachments,
  }) {
    final msg = _getDefaultMsgObj();
    // if (roomId == null || myUser == null) {
    //   throw "roomId must not null $roomId or myUser must not null $myUser";
    // }
    msg.content = content;
    msg.messageType = type;
    msg.roomId = roomId ?? "null";
    msg.messageContains = containReply ? MessageContains.reply : null;
    msg.senderId = myId ?? "null";
    msg.broadcastId = broadcastId;
    msg.messageAttachment = attachments;
    return msg;
  }

  String get lastMessageTimeString =>
      DateFormat.jm().format(createdAtLocalDate);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toSocketMap() {
    return {
      "content": content,
      "messageType": messageType.name,
      "roomId": roomId,
      'messageContains': messageContains == null ? null : messageContains!.name,
      "broadcastId": broadcastId,
      "localId": localId,
      "messageAttachment":
          messageAttachment == null ? null : messageAttachment!.toMap()
    };
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'localId': null,
      'content': content,
      'messageType': messageType.name,
      'roomId': roomId,
      'messageContains': messageContains == null ? null : messageContains!.name,
      'createdAt': createdAt,
      'updatedAt': createdAt,
      'platform': platform,
      'contentTr': contentTr,
      'deletedAt': deletedAt,
      'senderId': senderId,
      'deliveredAt': deliveredAt,
      'seenAt': seenAt,
      'senderName': senderName,
      'broadcastId': broadcastId,
      'senderImageThumb': senderImageThumb,
      'seenCount': seenCount,
      'messageAttachment':
          messageAttachment == null ? null : messageAttachment!.toMap(),
    };
  }

  // Map<String, dynamic> toLocalMap() {
  //   return {
  //     MessageTable.columnId: id,
  //     MessageTable.columnContent: content,
  //     MessageTable.columnMessageType: messageType.name,
  //     MessageTable.columnRoomId: roomId,
  //     MessageTable.columnMessageContains:
  //         messageContains == null ? null : messageContains!.name,
  //     MessageTable.columnCreatedAt: createdAt,
  //     MessageTable.columnDeliveredAt: deliveredAt,
  //     MessageTable.columnSeenAt: seenAt,
  //     MessageTable.columnUpdatedAt: updatedAt,
  //     MessageTable.columnPlatform: platform,
  //     MessageTable.columnMessageStatus: messageStatus.name,
  //     MessageTable.columnDeletedAt: deletedAt,
  //     MessageTable.columnLocalId: localId,
  //     MessageTable.columnBroadcastId: broadcastId,
  //     MessageTable.columnSeenCount: seenCount,
  //     MessageTable.columnSenderId: senderId,
  //     MessageTable.columnSenderName: senderName,
  //     MessageTable.columnSenderImageThumb: senderImageThumb,
  //     MessageTable.columnMessageAttachment: messageAttachment == null
  //         ? null
  //         : jsonEncode(messageAttachment!.toMap()),
  //   };
  // }

  @override
  String toString() {
    return 'Message{id: $id, senderId: $senderId, senderName: $senderName, senderImageThumb: $senderImageThumb, roomId: $roomId, content: $content, contentTr: $contentTr, platform: $platform, messageType: $messageType, messageAttachment: $messageAttachment, seenCount: $seenCount, seenAt: $seenAt, deletedAt: $deletedAt, broadcastId: $broadcastId, deliveredAt: $deliveredAt, messageContains: $messageContains, createdAt: $createdAt, updatedAt: $updatedAt, messageStatus: $messageStatus, percentage: $percentage, localId: $localId}';
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    const MessageType messageType = MessageType.text;
    const MessageContains isMessageContains = MessageContains.broadcast;
    return Message(
      id: map['_id'] as String,
      localId: map['localId'] as int?,
      content: map['content'] as String,
      messageType: messageType.enumType(map['messageType']),
      roomId: map['roomId'] as String,
      messageContains: map['messageContains'] == null
          ? null
          : isMessageContains.enumType(map['messageContains']),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] as String?,
      seenCount: map['seenCount'] as int,
      platform: map['platform'] ?? 'mobile',
      contentTr: null,
      senderId: map['senderId'] as String,
      deliveredAt: map['deliveredAt'] as String?,
      seenAt: map['seenAt'] as String?,
      messageStatus: MessageStatus.serverConfirm,
      senderName: map['senderName'] as String,
      broadcastId: map['broadcastId'] as String?,
      senderImageThumb: map['senderImageThumb'] as String,
      messageAttachment: map['messageAttachment'] == null
          ? null
          : MessageAttachment.fromMap(map['messageAttachment']),
    );
  }

  // factory Message.fromLocalMap(Map<String, dynamic> map) {
  //   const MessageType messageType = MessageType.text;
  //   const MessageStatus messageStatus = MessageStatus.serverConfirm;
  //
  //   const MessageContains isMessageContains = MessageContains.broadcast;
  //   return Message(
  //     id: map[MessageTable.columnId] as String,
  //     localId: map[MessageTable.columnLocalId] as int?,
  //     content: map[MessageTable.columnContent] as String,
  //     messageType: messageType.enumType(map[MessageTable.columnMessageType]),
  //     roomId: map[MessageTable.columnRoomId] as String,
  //     messageContains: map[MessageTable.columnMessageContains] == null
  //         ? null
  //         : isMessageContains.enumType(map[MessageTable.columnMessageContains]),
  //     createdAt: map[MessageTable.columnCreatedAt] as String,
  //     updatedAt: map[MessageTable.columnUpdatedAt] as String,
  //     deletedAt: map[MessageTable.columnDeletedAt] as String?,
  //     platform: map[MessageTable.columnPlatform] ?? 'mobile',
  //     contentTr: map[MessageTable.columnContentTr],
  //     seenCount: map[MessageTable.columnSeenCount] as int,
  //     senderId: map[MessageTable.columnSenderId] as String,
  //     deliveredAt: map[MessageTable.columnDeliveredAt] as String?,
  //     seenAt: map[MessageTable.columnSeenAt] as String?,
  //     messageStatus: messageStatus
  //         .enumType(map[MessageTable.columnMessageStatus] as String),
  //     senderName: map[MessageTable.columnSenderName] as String,
  //     broadcastId: map[MessageTable.columnBroadcastId] as String?,
  //     senderImageThumb: map[MessageTable.columnSenderImageThumb] as String,
  //     messageAttachment: map[MessageTable.columnMessageAttachment] == null
  //         ? null
  //         : MessageAttachment.fromMap(
  //             jsonDecode(map[MessageTable.columnMessageAttachment])),
  //   );
  // }

  @override
  int compareTo(other) {
    return createdAtLocalDate.compareTo(other.createdAtLocalDate);
  }

//</editor-fold>
}
