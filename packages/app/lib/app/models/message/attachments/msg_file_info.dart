class MsgFileInfo {
  String fileUrl;
  final String fileSize;
  final String fileTitle;
  final String mimeType;

//<editor-fold desc="Data Methods">

  MsgFileInfo({
    required this.fileUrl,
    required this.fileSize,
    required this.fileTitle,
    required this.mimeType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgFileInfo &&
          runtimeType == other.runtimeType &&
          fileUrl == other.fileUrl &&
          fileSize == other.fileSize &&
          fileTitle == other.fileTitle &&
          mimeType == other.mimeType);

  @override
  int get hashCode =>
      fileUrl.hashCode ^
      fileSize.hashCode ^
      fileTitle.hashCode ^
      mimeType.hashCode;

  //String get fileUrlS3 => ApiConstants.s3BucketBaseUrl + fileUrl;

  @override
  String toString() {
    return 'MsgFileInfo{' ' fileUrl: $fileUrl,' ' fileSize: $fileSize,' ' fileTitle: $fileTitle,' ' mimeType: $mimeType,' +
        '}';
  }

  MsgFileInfo copyWith({
    String? fileUrl,
    String? fileSize,
    String? fileTitle,
    String? mimeType,
  }) {
    return MsgFileInfo(
      fileUrl: fileUrl ?? this.fileUrl,
      fileSize: fileSize ?? this.fileSize,
      fileTitle: fileTitle ?? this.fileTitle,
      mimeType: mimeType ?? this.mimeType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'fileTitle': fileTitle,
      'mimeType': mimeType,
    };
  }

  factory MsgFileInfo.fromMap(Map<String, dynamic> map) {
    return MsgFileInfo(
      fileUrl: map['fileUrl'] as String,
      fileSize: map['fileSize'] as String,
      fileTitle: map['fileTitle'] as String,
      mimeType: map['mimeType'] as String,
    );
  }

//</editor-fold>
}
