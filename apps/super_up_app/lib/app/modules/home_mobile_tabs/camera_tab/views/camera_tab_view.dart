import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../../main.dart';
import '../../../../core/states/s_list_loading_state.dart';
import '../controllers/camera_tab_controller.dart';

class CameraTabView extends StatefulWidget {
  const CameraTabView({Key? key}) : super(key: key);

  @override
  State<CameraTabView> createState() => _CameraTabViewState();
}

class _CameraTabViewState extends State<CameraTabView> {
  final CameraTabController controller = CameraTabController();

  @override
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameras == null || cameras!.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
      );
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: ValueListenableBuilder<SLoadingState<bool>>(
            valueListenable: controller,
            builder: (_, value, __) {
              final isReady = controller.isCameraReady;
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
                          //  _buildGalleryBar(),
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
            }));
  }

  ImageProvider randomImageUrl() {
    return NetworkImage(SBaseUser.myUser.userImage);
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
