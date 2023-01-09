class MsgLocationInfo {
 final String lat;
 final String long;

//<editor-fold desc="Data Methods">

  const MsgLocationInfo({
    required this.lat,
    required this.long,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgLocationInfo &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          long == other.long);

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;

  @override
  String toString() {
    return 'MsgLocationInfo{' ' lat: $lat,' ' long: $long,' '}';
  }

  MsgLocationInfo copyWith({
    String? lat,
    String? long,
  }) {
    return MsgLocationInfo(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory MsgLocationInfo.fromMap(Map<String, dynamic> map) {
    return MsgLocationInfo(
      lat: map['lat'] as String,
      long: map['long'] as String,
    );
  }

//</editor-fold>
}