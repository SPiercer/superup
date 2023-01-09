import 'group_msg_info.dart';
import 'msg_bot_info.dart';
import 'msg_call_info.dart';
import 'msg_file_info.dart';
import 'msg_image_info.dart';
import 'msg_link_info.dart';
import 'msg_location_info.dart';
import 'msg_mention_info.dart';
import 'msg_reply_info.dart';
import 'msg_video_info.dart';
import 'msg_voice_info.dart';

class MessageAttachment {
  final MsgLinkInfo? msgLinkInfo;
  final MsgImageInfo? msgImageInfo;
  final MsgVideoInfo? msgVideoInfo;
  final MsgVoiceInfo? msgVoiceInfo;
  final MsgLocationInfo? msgLocationInfo;
  final MsgFileInfo? msgFileInfo;
  final MsgCallInfo? msgCallInfo;
  MsgReplyInfo? msgReplyInfo;
  final List<MsgMentionInfo>? msgMentionInfo;
  final GroupMsgInfo? groupMsgInfo;
  final MsgBotInfo? msgBotInfo;

//<editor-fold desc="Data Methods">

    MessageAttachment({
    this.msgLinkInfo,
    this.msgImageInfo,
    this.msgVideoInfo,
    this.msgVoiceInfo,
    this.msgLocationInfo,
    this.msgFileInfo,
    this.msgCallInfo,
    this.msgReplyInfo,
    this.msgMentionInfo,
    this.groupMsgInfo,
    this.msgBotInfo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageAttachment &&
          runtimeType == other.runtimeType &&
          msgLinkInfo == other.msgLinkInfo &&
          msgImageInfo == other.msgImageInfo &&
          msgVideoInfo == other.msgVideoInfo &&
          msgVoiceInfo == other.msgVoiceInfo &&
          msgLocationInfo == other.msgLocationInfo &&
          msgFileInfo == other.msgFileInfo &&
          msgCallInfo == other.msgCallInfo &&
          msgReplyInfo == other.msgReplyInfo &&
          msgMentionInfo == other.msgMentionInfo &&
          groupMsgInfo == other.groupMsgInfo &&
          msgBotInfo == other.msgBotInfo);

  @override
  int get hashCode =>
      msgLinkInfo.hashCode ^
      msgImageInfo.hashCode ^
      msgVideoInfo.hashCode ^
      msgVoiceInfo.hashCode ^
      msgLocationInfo.hashCode ^
      msgFileInfo.hashCode ^
      msgCallInfo.hashCode ^
      msgReplyInfo.hashCode ^
      msgMentionInfo.hashCode ^
      groupMsgInfo.hashCode ^
      msgBotInfo.hashCode;

  @override
  String toString() {
    return 'MessageAttachment{' ' msgLinkInfo: $msgLinkInfo,' ' msgImageInfo: $msgImageInfo,' ' msgVideoInfo: $msgVideoInfo,' ' msgVoiceInfo: $msgVoiceInfo,' +
        ' msgLocationInfo: $msgLocationInfo,' +
        ' msgFileInfo: $msgFileInfo,' +
        ' msgCallInfo: $msgCallInfo,' +
        ' msgReplyInfo: $msgReplyInfo,' +
        ' msgMentionInfo: $msgMentionInfo,' +
        ' groupMsgInfo: $groupMsgInfo,' +
        ' msgBotInfo: $msgBotInfo,' +
        '}';
  }

  MessageAttachment copyWith({
    MsgLinkInfo? msgLinkInfo,
    MsgImageInfo? msgImageInfo,
    MsgVideoInfo? msgVideoInfo,
    MsgVoiceInfo? msgVoiceInfo,
    MsgLocationInfo? msgLocationInfo,
    MsgFileInfo? msgFileInfo,
    MsgCallInfo? msgCallInfo,
    MsgReplyInfo? msgReplyInfo,
    List<MsgMentionInfo>? msgMentionInfo,
    GroupMsgInfo? groupMsgInfo,
    MsgBotInfo? msgBotInfo,
  }) {
    return MessageAttachment(
      msgLinkInfo: msgLinkInfo ?? this.msgLinkInfo,
      msgImageInfo: msgImageInfo ?? this.msgImageInfo,
      msgVideoInfo: msgVideoInfo ?? this.msgVideoInfo,
      msgVoiceInfo: msgVoiceInfo ?? this.msgVoiceInfo,
      msgLocationInfo: msgLocationInfo ?? this.msgLocationInfo,
      msgFileInfo: msgFileInfo ?? this.msgFileInfo,
      msgCallInfo: msgCallInfo ?? this.msgCallInfo,
      msgReplyInfo: msgReplyInfo ?? this.msgReplyInfo,
      msgMentionInfo: msgMentionInfo ?? this.msgMentionInfo,
      groupMsgInfo: groupMsgInfo ?? this.groupMsgInfo,
      msgBotInfo: msgBotInfo ?? this.msgBotInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msgLinkInfo': msgLinkInfo == null ? null : null,
      'msgImageInfo': msgImageInfo == null ? null : msgImageInfo!.toMap(),
      'msgVideoInfo': msgVideoInfo == null ? null : msgVideoInfo!.toMap(),
      'msgVoiceInfo': msgVoiceInfo == null ? null : msgVoiceInfo!.toMap(),
      'msgFileInfo': msgFileInfo == null ? null : msgFileInfo!.toMap(),
      'msgLocationInfo': msgLocationInfo == null ? null : null,
      'msgCallInfo': msgCallInfo == null ? null : null,
      'msgReplyInfo': msgReplyInfo == null ? null : msgReplyInfo!.toMap(),
      'msgMentionInfo': msgMentionInfo == null ? null : msgMentionInfo!,
      'groupMsgInfo': groupMsgInfo == null ? null : null,
      'msgBotInfo': msgBotInfo == null ? null : null,
    };
  }

  factory MessageAttachment.fromMap(Map<String, dynamic> map) {
    return MessageAttachment(
      msgLinkInfo: map['msgLinkInfo'] == null
          ? null
          : MsgLinkInfo.fromMap(map['msgLinkInfo']),
      msgImageInfo: map['msgImageInfo'] == null
          ? null
          : MsgImageInfo.fromMap(map['msgImageInfo']),
      msgVideoInfo: map['msgVideoInfo'] == null
          ? null
          : MsgVideoInfo.fromMap(map['msgVideoInfo']),
      msgVoiceInfo: map['msgVoiceInfo'] == null
          ? null
          : MsgVoiceInfo.fromMap(map['msgVoiceInfo']),
      msgLocationInfo: map['msgLocationInfo'] == null
          ? null
          : MsgLocationInfo.fromMap(map['msgLocationInfo']),
      msgFileInfo: map['msgFileInfo'] == null
          ? null
          : MsgFileInfo.fromMap(map['msgFileInfo']),
      msgCallInfo: map['msgCallInfo'] == null
          ? null
          : MsgCallInfo.fromMap(map['msgCallInfo']),
      msgReplyInfo: map['msgReplyInfo'] == null
          ? null
          : MsgReplyInfo.fromMap(map['msgReplyInfo']),
      msgMentionInfo: map['msgMentionInfo'] == null
          ? null
          : (map['msgMentionInfo'] as List)
              .map((e) => MsgMentionInfo.fromMap(e))
              .toList(),
      groupMsgInfo: map['groupMsgInfo'] == null
          ? null
          : GroupMsgInfo.fromMap(map['groupMsgInfo']),
      msgBotInfo: map['msgBotInfo'] == null
          ? null
          : MsgBotInfo.fromMap(map['msgBotInfo']),
    );
  }

//</editor-fold>
}
