

class UserImage {
  final String fullImage;
  final String chatImage;
  final String smallImage;

//<editor-fold desc="Data Methods">

  const UserImage({
    required this.fullImage,
    required this.chatImage,
    required this.smallImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserImage &&
          runtimeType == other.runtimeType &&
          fullImage == other.fullImage &&
          chatImage == other.chatImage &&
          smallImage == other.smallImage);

  @override
  int get hashCode =>
      fullImage.hashCode ^ chatImage.hashCode ^ smallImage.hashCode;

  @override
  String toString() {
    return 'UserImage{' +
        ' fullImage: $fullImage,' +
        ' chatImage: $chatImage,' +
        ' smallImage: $smallImage,' +
        '}';
  }

  UserImage copyWith({
    String? fullImage,
    String? chatImage,
    String? smallImage,
  }) {
    return UserImage(
      fullImage: fullImage ?? this.fullImage,
      chatImage: chatImage ?? this.chatImage,
      smallImage: smallImage ?? this.smallImage,
    );
  }

  // String get fullImageUrl => ApiConstants.s3BucketBaseUrl + fullImage;
  //
  // String get chatImageUrl => ApiConstants.s3BucketBaseUrl + chatImage;
  //
  // String get smallImageUrl => ApiConstants.s3BucketBaseUrl + smallImage;

  Map<String, dynamic> toMap() {
    return {
      'fullImage': this.fullImage,
      'chatImage': this.chatImage,
      'smallImage': this.smallImage,
    };
  }

  factory UserImage.fromMap(Map<String, dynamic> map) {
    return UserImage(
      fullImage: map['fullImage'] as String,
      chatImage: map['chatImage'] as String,
      smallImage: map['smallImage'] as String,
    );
  }

//</editor-fold>
}
