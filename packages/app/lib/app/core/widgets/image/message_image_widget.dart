import 'dart:io';

import 'package:flutter/material.dart';
import 'package:superup/app/core/widgets/image/cache_image_widget.dart';
import 'package:superup/app/models/message/message.dart';

class MessageImageWidget extends StatelessWidget {
  final Message msg;
  final Size size;

  const MessageImageWidget({Key? key, required this.msg, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (msg.isLocalSend) {
      return Image.file(
        File(msg.imageUrl),
        fit: BoxFit.cover,
        width: size.width,
        height: size.height,
      );
    }
    return CacheImageWidget(url: msg.imageUrl, size: size);
  }
}
