
class MsgImageInfo {
  String imageUrl;
  final String smallImageUrl;
  final int width;
  final int height;
  final String imageSize;

//<editor-fold desc="Data Methods">

  MsgImageInfo({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.width,
    required this.height,
    required this.imageSize,
  });

  //String get imageUrlS3 => "${ApiConstants.s3BucketBaseUrl}$imageUrl";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgImageInfo &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          smallImageUrl == other.smallImageUrl &&
          width == other.width &&
          height == other.height &&
          imageSize == other.imageSize);

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      smallImageUrl.hashCode ^
      width.hashCode ^
      height.hashCode ^
      imageSize.hashCode;

  @override
  String toString() {
    return 'MsgImageInfo{' ' imageUrl: $imageUrl,' ' smallImageUrl: $smallImageUrl,' ' width: $width,' ' height: $height,' +
        ' imageSize: $imageSize,' +
        '}';
  }

  MsgImageInfo copyWith({
    String? imageUrl,
    String? smallImageUrl,
    int? width,
    int? height,
    String? imageSize,
  }) {
    return MsgImageInfo(
      imageUrl: imageUrl ?? this.imageUrl,
      smallImageUrl: smallImageUrl ?? this.smallImageUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      imageSize: imageSize ?? this.imageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'smallImageUrl': smallImageUrl,
      'width': width,
      'height': height,
      'imageSize': imageSize,
    };
  }

  factory MsgImageInfo.fromMap(Map<String, dynamic> map) {
    return MsgImageInfo(
      imageUrl: map['imageUrl'] as String,
      smallImageUrl: map['smallImageUrl'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      imageSize: map['imageSize'] as String,
    );
  }

//</editor-fold>
}
