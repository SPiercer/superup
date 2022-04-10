class MsgBotInfo {
  final String type;
  final List<String> botMsgReplays;

//<editor-fold desc="Data Methods">

  const MsgBotInfo({
    required this.type,
    required this.botMsgReplays,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgBotInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          botMsgReplays == other.botMsgReplays);

  @override
  int get hashCode => type.hashCode ^ botMsgReplays.hashCode;

  @override
  String toString() {
    return 'MsgBotInfo{' + ' type: $type,' + ' options: $botMsgReplays,' + '}';
  }

  MsgBotInfo copyWith({
    String? type,
    List<String>? options,
  }) {
    return MsgBotInfo(
      type: type ?? this.type,
      botMsgReplays: options ?? this.botMsgReplays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'botMsgReplays': this.botMsgReplays,
    };
  }

  factory MsgBotInfo.fromMap(Map<String, dynamic> map) {
    return MsgBotInfo(
      type: map['type'] as String,
      botMsgReplays: (map['botMsgReplays'] as List).map((e) => e.toString()).toList() ,
    );
  }

//</editor-fold>
}
