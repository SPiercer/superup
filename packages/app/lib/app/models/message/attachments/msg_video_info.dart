

class MsgVideoInfo {
  String? imageThumbUrl;
  final int width;
  final int height;
  String videoUrl;
  final String videoSize;
  final String videoDuration;

  // String? get imageThumbUrlS3 => imageThumbUrl == null
  //     ? null
  //     : ApiConstants.s3BucketBaseUrl + imageThumbUrl!;
  //
  // String get videoUrlS3 => ApiConstants.s3BucketBaseUrl + videoUrl;

//<editor-fold desc="Data Methods">

  MsgVideoInfo({
    required this.imageThumbUrl,
    required this.width,
    required this.height,
    required this.videoUrl,
    required this.videoSize,
    required this.videoDuration,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgVideoInfo &&
          runtimeType == other.runtimeType &&
          imageThumbUrl == other.imageThumbUrl &&
          width == other.width &&
          height == other.height &&
          videoUrl == other.videoUrl &&
          videoSize == other.videoSize &&
          videoDuration == other.videoDuration);

  @override
  int get hashCode =>
      imageThumbUrl.hashCode ^
      width.hashCode ^
      height.hashCode ^
      videoUrl.hashCode ^
      videoSize.hashCode ^
      videoDuration.hashCode;

  @override
  String toString() {
    return 'MsgVideoInfo{' ' imageThumbUrl: $imageThumbUrl,' ' width: $width,' ' height: $height,' ' videoUrl: $videoUrl,' ' videoSize: $videoSize,' +
        ' videoDuration: $videoDuration,' +
        '}';
  }

  MsgVideoInfo copyWith({
    String? imageThumbUrl,
    int? width,
    int? height,
    String? videoUrl,
    String? videoSize,
    String? videoDuration,
  }) {
    return MsgVideoInfo(
      imageThumbUrl: imageThumbUrl ?? this.imageThumbUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      videoUrl: videoUrl ?? this.videoUrl,
      videoSize: videoSize ?? this.videoSize,
      videoDuration: videoDuration ?? this.videoDuration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageThumbUrl': imageThumbUrl,
      'width': width,
      'height': height,
      'videoUrl': videoUrl,
      'videoSize': videoSize,
      'videoDuration': videoDuration,
    };
  }

  factory MsgVideoInfo.fromMap(Map<String, dynamic> map) {
    return MsgVideoInfo(
      imageThumbUrl: map['imageThumbUrl'] as String?,
      width: map['width'] as int,
      height: map['height'] as int,
      videoUrl: map['videoUrl'] as String,
      videoSize: map['videoSize'] as String,
      videoDuration: map['videoDuration'] as String,
    );
  }

//</editor-fold>
}
