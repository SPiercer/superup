import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:textless/textless.dart';

import '../../../../models/user/user.dart';
import '../controllers/get_camera_image_controller.dart';

class GetCameraImageView extends GetView<GetCameraImageController> {
  const GetCameraImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
            () {
          final isReady = controller.isCameraReady.value;
          if (!isReady) {
            return const SizedBox();
          }
          return SafeArea(
            child: Center(
              child: Stack(
                children: [
                  SizedBox(
                    child: CameraPreview(
                      controller.cameraController!,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _buildGalleryBar(),
                      _buildControlBar(),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: 'Tap for photo'.text.color(Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGalleryBar() {
    const barHeight = 90.0;
    const vertPadding = 10.0;

    return SizedBox(
      height: barHeight,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int _) {
          return Container(
            padding: const EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: randomImageUrl(),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  ImageProvider randomImageUrl() {
    return NetworkImage(User.myUser.userImages.chatImage);
  }

  Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.flash_auto),
          onPressed: () {},
        ),
        GestureDetector(
          onTap: controller.onTakePictureButtonPress,
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
        ),
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.switch_camera),
          onPressed: controller.onSwitchCamera,
        ),
      ],
    );
  }
}
