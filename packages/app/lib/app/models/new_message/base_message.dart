import 'package:flutter/cupertino.dart';

class BaseMessage {
  final int id;
  final String content;
  @protected
  final Map<String, dynamic>? msgAtt;
  @protected
  final Map<String, dynamic>? replyTo;

//<editor-fold desc="Data Methods">

  const BaseMessage({
    required this.id,
    required this.content,
    this.msgAtt,
    this.replyTo,
  });
  

  BaseMessage copyWith({
    int? id,
    String? content,
    Map<String, dynamic>? msgAtt,
    Map<String, dynamic>? replyTo,
  }) {
    return BaseMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      msgAtt: msgAtt ?? this.msgAtt,
      replyTo: replyTo ?? this.replyTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'content': this.content,
      'msgAtt': this.msgAtt,
      'replyTo': this.replyTo,
    };
  }

  factory BaseMessage.fromMap(Map<String, dynamic> map) {
    return BaseMessage(
      id: map['id'] as int,
      content: map['content'] as String,
      msgAtt: map['msgAtt'] as Map<String, dynamic>,
      replyTo: map['replyTo'] as Map<String, dynamic>,
    );
  }

//</editor-fold>
}
