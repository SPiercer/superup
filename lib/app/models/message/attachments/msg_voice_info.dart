

class MsgVoiceInfo {
  String playUrl;
  final String voiceSize;
  final String voiceDuration;

//<editor-fold desc="Data Methods">

  MsgVoiceInfo({
    required this.playUrl,
    required this.voiceSize,
    required this.voiceDuration,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgVoiceInfo &&
          runtimeType == other.runtimeType &&
          playUrl == other.playUrl &&
          voiceSize == other.voiceSize &&
          voiceDuration == other.voiceDuration);

  @override
  int get hashCode =>
      playUrl.hashCode ^ voiceSize.hashCode ^ voiceDuration.hashCode;

  @override
  String toString() {
    return 'MsgVoiceInfo{' ' playUrl: $playUrl,' ' voiceSize: $voiceSize,' ' voiceDuration: $voiceDuration,' '}';
  }

  // String get playUrlS3 => ApiConstants.s3BucketBaseUrl + playUrl;

  MsgVoiceInfo copyWith({
    String? playUrl,
    String? voiceSize,
    String? voiceDuration,
  }) {
    return MsgVoiceInfo(
      playUrl: playUrl ?? this.playUrl,
      voiceSize: voiceSize ?? this.voiceSize,
      voiceDuration: voiceDuration ?? this.voiceDuration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playUrl': playUrl,
      'voiceSize': voiceSize,
      'voiceDuration': voiceDuration,
    };
  }

  factory MsgVoiceInfo.fromMap(Map<String, dynamic> map) {
    return MsgVoiceInfo(
      playUrl: map['playUrl'] as String,
      voiceSize: map['voiceSize'] as String,
      voiceDuration: map['voiceDuration'] as String,
    );
  }

//</editor-fold>
}
