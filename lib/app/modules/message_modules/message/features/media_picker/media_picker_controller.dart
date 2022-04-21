import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:superup/app/core/alerts_widgets/info/info_alert.dart';
import 'package:superup/app/core/enums/message_type.dart';
import 'package:superup/app/core/enums/permission_type.dart';
import 'package:superup/app/core/manager/permission_manager.dart';
import 'package:superup/app/models/message/attachments/message_attachment.dart';
import 'package:superup/app/models/message/attachments/msg_image_info.dart';
import 'package:superup/app/models/message/attachments/msg_video_info.dart';
import 'package:superup/app/models/user/user.dart';
import 'package:superup/app/routes/app_pages.dart';

import '../../../../../core/alerts_widgets/permistion_alerts/permission_asker.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/manager/media_manager.dart';
import '../../../../../models/message/message.dart';

class MediaPickerController extends ValueNotifier<Message?> {
  final manager = Get.find<MediaManager>();
  final permissionManager = Get.find<PermissionManager>();
  final picker = ImagePicker();
  final User myUser;
  final String roomId;

  MediaPickerController({required this.myUser, required this.roomId})
      : super(null);

  Future<bool> askForCameraPerm() async {
    final isAllow = await permissionManager.isCameraAllwed();
    if (!isAllow) {
      final res = await PermissionAsker.askPermission(
          permission: PermissionType.camera);
      if (res == 1) {
        final isAllowed = await permissionManager.askForCamera();
        if (!isAllowed) {
          InfoAlert()
              .show(text: "you cant process with out camera permission !");
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  void pickImage(ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      if (!await askForCameraPerm()) {
        return;
      }
    } else {
      Get.back();
    }
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      if (file.lengthSync() > AppConstants.maxMediaSize) {
        File(pickedFile.path).deleteSync();
        InfoAlert().show(text: "File is too large");
        return;
      }
      // final compressedImage = await manager.compressImage(file);
      final compressedImage = file;
      final size = manager.getFileSize(compressedImage);
      final imageInfo = await manager.getImageSize(compressedImage);

      final imgMsg = Message.buildMessage(
        content: "this content is photo",
        roomId: roomId,
        type: MessageType.image,
        attachments: MessageAttachment(
          msgImageInfo: MsgImageInfo(
            width: imageInfo.image.width,
            height: imageInfo.image.height,
            smallImageUrl: compressedImage.path,
            imageUrl: compressedImage.path,
            imageSize: size,
          ),
        ),
        myUser: myUser,
      );
      final newPath = await Get.toNamed(Routes.PHOTOS_EDITOR,
          arguments: File(compressedImage.path));
      imgMsg.messageAttachment!.msgImageInfo!.imageUrl = newPath;
      value = imgMsg;
    }
  }

  Future pickVideo(ImageSource gallery) async {
    Get.back();
    final pickedFile = await picker.pickVideo(source: gallery);
    if (pickedFile != null) {
      final videoFile = File(pickedFile.path);
      if (videoFile.lengthSync() > AppConstants.maxMediaSize) {
        File(pickedFile.path).deleteSync();
        InfoAlert().show(text: "File is too large");
        return;
      }
      final videoThumb = await manager.getVideoThumb(videoFile);
      final d = await manager.getVideoDuration(videoFile.path);
      final thumbVideoThumb = await manager.getImageSize(videoThumb);
      final videoFileSize = manager.getFileSize(videoFile);
      final videoMsg = Message.buildMessage(
        content: "this content is video",
        roomId: roomId,
        type: MessageType.video,
        attachments: MessageAttachment(
          msgVideoInfo: MsgVideoInfo(
            videoDuration: d,
            videoSize: videoFileSize,
            videoUrl: videoFile.path,
            width: thumbVideoThumb.image.width,
            height: thumbVideoThumb.image.height,
            imageThumbUrl: videoThumb.path,
          ),
        ),
        myUser: myUser,
      );

      value = videoMsg;
    }
  }

  Future pickFile() async {
    Get.back();
  }
}
