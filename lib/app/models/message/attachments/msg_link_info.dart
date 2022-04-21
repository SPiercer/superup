class MsgLinkInfo {
 final String url;
 final String imageUrl;
 final String title;
 final String description;

//<editor-fold desc="Data Methods">

  const MsgLinkInfo({
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MsgLinkInfo &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          imageUrl == other.imageUrl &&
          title == other.title &&
          description == other.description);

  @override
  int get hashCode =>
      url.hashCode ^ imageUrl.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'MsgLinkInfo{' ' url: $url,' ' imageUrl: $imageUrl,' ' title: $title,' ' description: $description,' +
        '}';
  }

  MsgLinkInfo copyWith({
    String? url,
    String? imageUrl,
    String? title,
    String? description,
  }) {
    return MsgLinkInfo(
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
    };
  }

  factory MsgLinkInfo.fromMap(Map<String, dynamic> map) {
    return MsgLinkInfo(
      url: map['url'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}