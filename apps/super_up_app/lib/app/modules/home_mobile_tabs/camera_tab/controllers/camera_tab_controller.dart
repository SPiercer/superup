import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:super_up_core/super_up_core.dart';

import '../../../../../main.dart';
import '../../../../core/s_base_controller.dart';

class CameraTabController extends SLoadingController<bool> {
  CameraController? cameraController;

  bool get isCameraReady => value.data;
  int _cameraIndex = 0;

  CameraTabController() : super(SLoadingState(false));

  @override
  void onInit() {
    checkPermistions();
    setUpCamera();
  }

  @override
  void onClose() {
    if (cameraController != null) {
      cameraController!.dispose();
    }
  }

  void setUpCamera() async {
    if (cameras == null || cameras!.isEmpty) return;
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    cameraController = CameraController(
      cameras![_cameraIndex],
      ResolutionPreset.medium,
    );
    await cameraController!.initialize();
    value.data = true;
    setStateSuccess();
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void onTakePictureButtonPress() {
    _takePicture().then((filePath) {
      if (filePath != null) {}
    });
  }

  Future<String?> _takePicture() async {
    if (!cameraController!.value.isInitialized ||
        cameraController!.value.isTakingPicture) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final dirPath = '${extDir.path}/Pictures/${SConstants.appName}';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${_timestamp()}.jpg';

    try {
      await cameraController!.takePicture();
    } on CameraException {
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
