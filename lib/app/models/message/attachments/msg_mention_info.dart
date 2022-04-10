class MsgMentionInfo {
 final String userId;
 final String userName;

//<editor-fold desc="Data Methods">

  const MsgMentionInfo({
    required this.userId,
    required this.userName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgMentionInfo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userName == other.userName);

  @override
  int get hashCode => userId.hashCode ^ userName.hashCode;

  @override
  String toString() {
    return 'MsgMentionInfo{' +
        ' userId: $userId,' +
        ' userName: $userName,' +
        '}';
  }

  MsgMentionInfo copyWith({
    String? userId,
    String? userName,
  }) {
    return MsgMentionInfo(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'userName': this.userName,
    };
  }

  factory MsgMentionInfo.fromMap(Map<String, dynamic> map) {
    return MsgMentionInfo(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
    );
  }

//</editor-fold>
}