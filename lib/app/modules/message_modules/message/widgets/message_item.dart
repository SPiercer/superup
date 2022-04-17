import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class MessageItem extends StatelessWidget {
  final String msg;

  const MessageItem({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: msg.text.color(Colors.black),
      tileColor: Colors.grey[200],
    );
  }
}
