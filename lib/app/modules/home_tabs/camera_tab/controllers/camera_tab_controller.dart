import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../main.dart';

class CameraTabController extends GetxController {
  CameraController? cameraController;

  final isCameraReady = false.obs;
  int _cameraIndex = 0;

  @override
  void onInit() {
    super.onInit();
    checkPermistions();
    setUpCamera();
  }

  @override
  void dispose() {
    if (cameraController != null) {
      cameraController!.dispose();
    }
    super.dispose();
  }

  void setUpCamera() async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    cameraController = CameraController(
      cameras![_cameraIndex],
      ResolutionPreset.medium,
    );
    cameraController!.initialize().then((value) {
      isCameraReady.value = true;
      isCameraReady.refresh();
    });
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void onTakePictureButtonPress() {
    _takePicture().then((filePath) {
      if (filePath != null) {
        print(filePath.toString());
      }
    });
  }

  Future<String?> _takePicture() async {
    if (!cameraController!.value.isInitialized ||
        cameraController!.value.isTakingPicture) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/whatsapp_clone';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${_timestamp()}.jpg';

    try {
      await cameraController!.takePicture();
    } on CameraException catch (e) {
      rethrow;
    }
    return filePath;
  }

  void onSwitchCamera() {
    if (cameraController == null ||
        !cameraController!.value.isInitialized ||
        cameraController!.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras!.length ? 0 : _cameraIndex + 1;
    _cameraIndex = newIndex;
    setUpCamera();
  }

  void checkPermistions() async {}
}
