import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MediaManager {
  Future<ImageInfo> getImageSize(File file) {
    Image image = Image.file(file);
    final c = Completer<ImageInfo>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
  }

  Future<File> compressImage(File file) async {
    final ImageProperties properties =
        await FlutterNativeImage.getImageProperties(file.path);
    File compressedFile = file;
    if (file.lengthSync() > 150 * 1000) {
      // compress only images bigger than 150 kb
      compressedFile = await FlutterNativeImage.compressImage(
        file.path,
        quality: 100,
        targetWidth: 700,
        targetHeight: (properties.height! * 700 / properties.width!).round(),
      );
    }

    //  final compressFile = await _copyTheCompressImage(compressedFile);
    // file.deleteSync();
    return compressedFile;
  }

  String getFileSize(File file, {int decimals = 2}) {
    final int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    final i = (log(bytes) / log(1000)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<File> getVideoThumb(File file) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: file.path,
      quality: 50,
      maxHeight: 600,
      maxWidth: 800,
      timeMs: 1,
    );
    final t = (await getTemporaryDirectory()).path;
    final String fileName =
        "IMG_THUMB_${DateTime.now().microsecondsSinceEpoch}.png";
    final newFile = File("$t$fileName");
    return newFile.writeAsBytes(uint8list!);
  }

  Future<String> getVideoDuration(String path) async {
    final videoInfo = FlutterVideoInfo();
    final info = await videoInfo.getVideoInfo(path);
    //  final info = await VideoCompress.getMediaInfo(path);
    return _printDuration(Duration(milliseconds: info!.duration!.round()));
  }
}
