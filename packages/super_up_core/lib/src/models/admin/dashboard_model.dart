class DashBoardModel {
  final AdminUsersData usersData;
  final AdminMessagesCounter adminMessagesCounter;
  final AdminRoomCounter adminRoomCounter;

//<editor-fold desc="Data Methods">
  const DashBoardModel({
    required this.usersData,
    required this.adminMessagesCounter,
    required this.adminRoomCounter,
  });

  @override
  String toString() {
    return 'DashBoardModel{ usersData: $usersData, adminMessagesCounter: $adminMessagesCounter, adminRoomCounter: $adminRoomCounter,}';
  }

  DashBoardModel copyWith({
    AdminUsersData? usersData,
    AdminMessagesCounter? adminMessagesCounter,
    AdminRoomCounter? adminRoomCounter,
  }) {
    return DashBoardModel(
      usersData: usersData ?? this.usersData,
      adminMessagesCounter: adminMessagesCounter ?? this.adminMessagesCounter,
      adminRoomCounter: adminRoomCounter ?? this.adminRoomCounter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'usersData': usersData.toMap(),
      'messagesCounter': adminMessagesCounter.toMap(),
      'roomCounter': adminRoomCounter.toMap(),
    };
  }

  factory DashBoardModel.fromMap(Map<String, dynamic> map) {
    return DashBoardModel(
      usersData: AdminUsersData.fromMap(map['usersData']),
      adminMessagesCounter:
          AdminMessagesCounter.fromMap(map['messagesCounter']),
      adminRoomCounter: AdminRoomCounter.fromMap(map['roomCounter']),
    );
  }

//</editor-fold>
}

class AdminUsersData {
  final int totalUsersCount;
  final int deleted;
  final int onlineCount;

//<editor-fold desc="Data Methods">
  const AdminUsersData({
    required this.totalUsersCount,
    required this.deleted,
    required this.onlineCount,
  });

  @override
  String toString() {
    return 'AdminUsersData{ totalUsersCount: $totalUsersCount, deleted: $deleted, onlineCount: $onlineCount,}';
  }

  AdminUsersData copyWith({
    int? totalUsersCount,
    int? deleted,
    int? onlineCount,
  }) {
    return AdminUsersData(
      totalUsersCount: totalUsersCount ?? this.totalUsersCount,
      deleted: deleted ?? this.deleted,
      onlineCount: onlineCount ?? this.onlineCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalUsersCount': totalUsersCount,
      'deleted': deleted,
      'onlineCount': onlineCount,
    };
  }

  factory AdminUsersData.fromMap(Map<String, dynamic> map) {
    return AdminUsersData(
      totalUsersCount: map['totalUsersCount'] as int,
      deleted: map['deleted'] as int,
      onlineCount: map['onlineCount'] as int,
    );
  }

//</editor-fold>
}

class AdminMessagesCounter {
  final int messages;
  final int textMessages;
  final int imageMessages;
  final int videoMessages;
  final int voiceMessages;
  final int fileMessages;
  final int infoMessages;
  final int callMessages;
  final int locationMessages;
  final int allDeletedMessages;

//<editor-fold desc="Data Methods">
  const AdminMessagesCounter({
    required this.messages,
    required this.textMessages,
    required this.imageMessages,
    required this.videoMessages,
    required this.voiceMessages,
    required this.fileMessages,
    required this.infoMessages,
    required this.callMessages,
    required this.locationMessages,
    required this.allDeletedMessages,
  });

  @override
  String toString() {
    return 'AdminMessagesCounter{ messages: $messages, textMessages: $textMessages, imageMessages: $imageMessages, videoMessages: $videoMessages, voiceMessages: $voiceMessages, fileMessages: $fileMessages, infoMessages: $infoMessages, callMessages: $callMessages, locationMessages: $locationMessages, allDeletedMessages: $allDeletedMessages,}';
  }

  AdminMessagesCounter copyWith({
    int? messages,
    int? textMessages,
    int? imageMessages,
    int? videoMessages,
    int? voiceMessages,
    int? fileMessages,
    int? infoMessages,
    int? callMessages,
    int? locationMessages,
    int? allDeletedMessages,
  }) {
    return AdminMessagesCounter(
      messages: messages ?? this.messages,
      textMessages: textMessages ?? this.textMessages,
      imageMessages: imageMessages ?? this.imageMessages,
      videoMessages: videoMessages ?? this.videoMessages,
      voiceMessages: voiceMessages ?? this.voiceMessages,
      fileMessages: fileMessages ?? this.fileMessages,
      infoMessages: infoMessages ?? this.infoMessages,
      callMessages: callMessages ?? this.callMessages,
      locationMessages: locationMessages ?? this.locationMessages,
      allDeletedMessages: allDeletedMessages ?? this.allDeletedMessages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages,
      'textMessages': textMessages,
      'imageMessages': imageMessages,
      'videoMessages': videoMessages,
      'voiceMessages': voiceMessages,
      'fileMessages': fileMessages,
      'infoMessages': infoMessages,
      'callMessages': callMessages,
      'locationMessages': locationMessages,
      'allDeletedMessages': allDeletedMessages,
    };
  }

  factory AdminMessagesCounter.fromMap(Map<String, dynamic> map) {
    return AdminMessagesCounter(
      messages: map['messages'] as int,
      textMessages: map['textMessages'] as int,
      imageMessages: map['imageMessages'] as int,
      videoMessages: map['videoMessages'] as int,
      voiceMessages: map['voiceMessages'] as int,
      fileMessages: map['fileMessages'] as int,
      infoMessages: map['infoMessages'] as int,
      callMessages: map['callMessages'] as int,
      locationMessages: map['locationMessages'] as int,
      allDeletedMessages: map['allDeletedMessages'] as int,
    );
  }

//</editor-fold>
}

class AdminRoomCounter {
  final int single;
  final int order;
  final int group;
  final int broadcast;

//<editor-fold desc="Data Methods">
  const AdminRoomCounter({
    required this.single,
    required this.order,
    required this.group,
    required this.broadcast,
  });

  @override
  String toString() {
    return 'AdminRoomCounter{ single: $single, order: $order, group: $group, broadcast: $broadcast,}';
  }

  AdminRoomCounter copyWith({
    int? single,
    int? order,
    int? group,
    int? broadcast,
  }) {
    return AdminRoomCounter(
      single: single ?? this.single,
      order: order ?? this.order,
      group: group ?? this.group,
      broadcast: broadcast ?? this.broadcast,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'single': single,
      'order': order,
      'group': group,
      'broadcast': broadcast,
    };
  }

  factory AdminRoomCounter.fromMap(Map<String, dynamic> map) {
    return AdminRoomCounter(
      single: map['single'] as int,
      order: map['order'] as int,
      group: map['group'] as int,
      broadcast: map['broadcast'] as int,
    );
  }

//</editor-fold>
}
