class SBaseUser {
  final String id;
  final String userImage;
  final String fullName;

//<editor-fold desc="Data Methods">

  const SBaseUser({
    required this.id,
    required this.fullName,
    required this.userImage,
  });

  @override
  String toString() {
    return 'User{'
        ' id: $id,'
        ' fullName: $fullName,'
        ' userImages: $userImage,'
        '}';
  }

  static const myUser = SBaseUser(
    id: "1",
    fullName: "user 1",
    userImage:
        "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
  );

  SBaseUser copyWith({
    String? id,
    String? email,
    String? fullName,
    String? userImage,
  }) {
    return SBaseUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      userImage: userImage ?? this.userImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'fullName': fullName,
      'userImage': userImage,
    };
  }

  factory SBaseUser.fromMap(Map<String, dynamic> map) {
    return SBaseUser(
      id: map['_id'] as String,
      fullName: map['fullName'] as String,
      userImage: map['userImage'] as String,
    );
  }

//</editor-fold>
}
class SSearchUser{
  final SBaseUser baseUser;
  final String bio;
  final String createdAt;

//<editor-fold desc="Data Methods">

  const SSearchUser({
    required this.baseUser,
    required this.bio,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SSearchUser &&
          runtimeType == other.runtimeType &&
          baseUser == other.baseUser &&
          bio == other.bio &&
          createdAt == other.createdAt);

  @override
  int get hashCode => baseUser.hashCode ^ bio.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'SSearchUser{' +
        ' baseUser: $baseUser,' +
        ' bio: $bio,' +
        ' createdAt: $createdAt,' +
        '}';
  }

  SSearchUser copyWith({
    SBaseUser? baseUser,
    String? bio,
    String? createdAt,
  }) {
    return SSearchUser(
      baseUser: baseUser ?? this.baseUser,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ... this.baseUser.toMap(),
      'bio': this.bio,
      'createdAt': this.createdAt,
    };
  }

  factory SSearchUser.fromMap(Map<String, dynamic> map) {
    return SSearchUser(
      baseUser: SBaseUser.fromMap(map),
      bio: map['bio'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

//</editor-fold>
}