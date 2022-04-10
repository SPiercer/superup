class MsgCallInfo {
 final String  callDuration;
 final String  callType;

//<editor-fold desc="Data Methods">

  const MsgCallInfo({
    required this.callDuration,
    required this.callType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgCallInfo &&
          runtimeType == other.runtimeType &&
          callDuration == other.callDuration &&
          callType == other.callType);

  @override
  int get hashCode => callDuration.hashCode ^ callType.hashCode;

  @override
  String toString() {
    return 'MsgCallInfo{' +
        ' callDuration: $callDuration,' +
        ' callType: $callType,' +
        '}';
  }

  MsgCallInfo copyWith({
    String? callDuration,
    String? callType,
  }) {
    return MsgCallInfo(
      callDuration: callDuration ?? this.callDuration,
      callType: callType ?? this.callType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'callDuration': this.callDuration,
      'callType': this.callType,
    };
  }

  factory MsgCallInfo.fromMap(Map<String, dynamic> map) {
    return MsgCallInfo(
      callDuration: map['callDuration'] as String,
      callType: map['callType'] as String,
    );
  }

//</editor-fold>
}