import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {

  RxBool cameraPermissionGranted = false.obs;

  Future<void> checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      cameraPermissionGranted.value = true;
    } else {
      cameraPermissionGranted.value = false;
    }
  }



  Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      cameraPermissionGranted.value = true;
    } else {
      cameraPermissionGranted.value = false;
    }
  }
}