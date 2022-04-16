import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraTabController extends GetxController {
  late CameraController controller;
  late List<CameraDescription> cameras;
  final isCameraReady = false.obs;

  @override
  void onReady() {
    super.onReady();
 //   setUpCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setUpCamera() async {
    controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await controller.initialize();
    isCameraReady.value = true;
  }
}
