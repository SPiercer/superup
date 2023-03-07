import 'dart:ui';

import '../../../super_up_core.dart';

class SMyProfile {
  final SBaseUser baseUser;
  final RegisterStatus registerStatus;
  final Locale language;

//<editor-fold desc="Data Methods">

  const SMyProfile({
    required this.baseUser,
    required this.registerStatus,
    required this.language,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SMyProfile &&
          runtimeType == other.runtimeType &&
          baseUser == other.baseUser &&
          registerStatus == other.registerStatus);

  @override
  int get hashCode => baseUser.hashCode ^ registerStatus.hashCode;

  @override
  String toString() {
    return 'MyProfile{ baseUser: $baseUser, language: $language, registerStatus: $registerStatus,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'me': baseUser.toMap(),
      'registerStatus': registerStatus.name,
      'currentDevice': {"language": language.toString()},
    };
  }

  factory SMyProfile.fromMap(Map<String, dynamic> map) {
    return SMyProfile(
      baseUser: SBaseUser.fromMap(map['me'] as Map<String, dynamic>),
      language: Locale(
        (map['currentDevice'] as Map<String, dynamic>)['language'] as String,
      ),
      registerStatus:
          RegisterStatus.values.byName(map['registerStatus'] as String),
    );
  }

//</editor-fold>
}
