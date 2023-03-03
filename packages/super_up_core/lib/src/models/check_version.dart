import 'package:version/version.dart';

class CheckVersion {
  final String yourVersion;
  final SVersion lastVersion;

//<editor-fold desc="Data Methods">
  const CheckVersion({
    required this.yourVersion,
    required this.lastVersion,
  });

  bool get isNewVersionAvailable {
    final isNeedUpdate = lastVersion.serverVersion > myVersion;
    final serverBuild = lastVersion.serverVersion.build.trim();
    final myBuild = myVersion.build.trim();
    if (serverBuild.isEmpty || myBuild.isEmpty) {
      return isNeedUpdate;
    }
    if (myBuild.isEmpty && serverBuild.isNotEmpty) {
      return true;
    }
    if (isNeedUpdate) return true;
    if (myBuild.isNotEmpty && serverBuild.isNotEmpty) {
      if (int.parse(serverBuild) > int.parse(myBuild)) {
        return true;
      }
    }
    return isNeedUpdate;
  }

  Version get myVersion => Version.parse(yourVersion);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckVersion &&
          runtimeType == other.runtimeType &&
          yourVersion == other.yourVersion &&
          lastVersion == other.lastVersion);

  @override
  int get hashCode => yourVersion.hashCode ^ lastVersion.hashCode;

  @override
  String toString() {
    return 'CheckVersion{ yourVersion: $yourVersion, lastVersion: $lastVersion,}';
  }

  CheckVersion copyWith({
    String? yourVersion,
    SVersion? lastVersion,
  }) {
    return CheckVersion(
      yourVersion: yourVersion ?? this.yourVersion,
      lastVersion: lastVersion ?? this.lastVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'yourVersion': yourVersion,
      'lastVersion': lastVersion.toMap(),
    };
  }

  factory CheckVersion.fromMap(Map<String, dynamic> map) {
    return CheckVersion(
      yourVersion: map['yourVersion'] as String,
      lastVersion: SVersion.fromMap(map['lastVersion'] as Map<String, dynamic>),
    );
  }

//</editor-fold>
}

class SVersion {
  final String title;
  final String description;
  final String semVer;
  final bool isForce;
  final String createdAt;

//<editor-fold desc="Data Methods">
  const SVersion({
    required this.title,
    required this.description,
    required this.semVer,
    required this.isForce,
    required this.createdAt,
  });

  Version get serverVersion => Version.parse(semVer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SVersion &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          semVer == other.semVer &&
          isForce == other.isForce &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      semVer.hashCode ^
      isForce.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'SVersion{ title: $title, description: $description, semVer: $semVer, isForce: $isForce, createdAt: $createdAt,}';
  }

  SVersion copyWith({
    String? title,
    String? description,
    String? semVer,
    bool? isForce,
    String? createdAt,
  }) {
    return SVersion(
      title: title ?? this.title,
      description: description ?? this.description,
      semVer: semVer ?? this.semVer,
      isForce: isForce ?? this.isForce,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'semVer': semVer,
      'isForce': isForce,
      'createdAt': createdAt,
    };
  }

  factory SVersion.fromMap(Map<String, dynamic> map) {
    return SVersion(
      title: map['title'] as String,
      description: map['description'] as String,
      semVer: map['semVer'] as String,
      isForce: map['isForce'] as bool,
      createdAt: map['createdAt'] as String,
    );
  }

//</editor-fold>
}
