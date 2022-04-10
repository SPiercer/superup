import 'package:superup/app/models/user/user_image.dart';

class User {
  final String id;
  final UserImage userImages;
  final String email;
  final String fullName;

//<editor-fold desc="Data Methods">

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.userImages,
  });

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' email: $email,' +
        ' fullName: $fullName,' +
        ' userImages: $userImages,' +
        '}';
  }

  static const myUser = User(
    id: "1",
    email: "user1@gmail.com",
    fullName: "user 1",
    userImages: UserImage(
      chatImage:
          "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
      fullImage:
          "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
      smallImage:
          "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png",
    ),
  );

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    UserImage? userImages,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      userImages: userImages ?? this.userImages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'email': email,
      'fullName': fullName,
      'userImages': userImages.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      userImages: UserImage.fromMap(map['userImages']),
    );
  }

//</editor-fold>
}
