class GroupMsgInfo {
  final String adminName;
  final String type;

//<editor-fold desc="Data Methods">

  const GroupMsgInfo({
    required this.adminName,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupMsgInfo &&
          runtimeType == other.runtimeType &&
          adminName == other.adminName &&
          type == other.type);

  @override
  int get hashCode => adminName.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'GroupMsgInfo{' ' adminName: $adminName,' ' type: $type,' '}';
  }

  GroupMsgInfo copyWith({
    String? adminName,
    String? type,
  }) {
    return GroupMsgInfo(
      adminName: adminName ?? this.adminName,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminName': adminName,
      'type': type,
    };
  }

  factory GroupMsgInfo.fromMap(Map<String, dynamic> map) {
    return GroupMsgInfo(
      adminName: map['adminName'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}
