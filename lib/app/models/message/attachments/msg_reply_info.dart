import '../message.dart';

class MsgReplyInfo {
  final String parentMessageId;
  final String parentSenderId;
  final Message messageData;

//<editor-fold desc="Data Methods">

  const MsgReplyInfo({
    required this.parentMessageId,
    required this.parentSenderId,
    required this.messageData,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgReplyInfo &&
          runtimeType == other.runtimeType &&
          parentMessageId == other.parentMessageId &&
          parentSenderId == other.parentSenderId &&
          messageData == other.messageData);

  @override
  int get hashCode =>
      parentMessageId.hashCode ^ parentSenderId.hashCode ^ messageData.hashCode;

  @override
  String toString() {
    return 'MsgReplyInfo{' +
        ' parentMessageId: $parentMessageId,' +
        ' parentSenderId: $parentSenderId,' +
        ' messageData: $messageData,' +
        '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'parentMessageId': parentMessageId,
      'parentSenderId': parentSenderId,
      'messageData': messageData.toMap(),
    };
  }

  factory MsgReplyInfo.fromMap(Map<String, dynamic> map) {
    return MsgReplyInfo(
        parentMessageId: map['parentMessageId'] as String,
        parentSenderId: map['parentSenderId'] as String,
        messageData: Message.fromMap(map['messageData']));
  }

//</editor-fold>
}
