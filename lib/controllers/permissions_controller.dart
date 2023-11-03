import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class GrantPermissions extends GetxController {
  static GrantPermissions get instance => Get.find();

  Future<bool> isCameraGranted() async {
    bool isGranted = await Permission.camera.request().isGranted;
    if (!isGranted) {
      await Permission.camera.request();
    }
    return isGranted;
  }

  Future<bool> isMediaGranted() async {
    bool isGranted = await Permission.mediaLibrary.request().isGranted;
    if (!isGranted) {
      await Permission.mediaLibrary.request();
    }
    return isGranted;
  }
}
