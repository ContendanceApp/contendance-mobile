import 'dart:async';

import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

class SplashController extends GetxController {
  late AppUpdateInfo updateInfo;

  @override
  void onInit() {
    checkForUpdate();
    splashscreenStart();
    super.onInit();
  }

  Future<void> splashscreenStart() async {
    var duration = const Duration(seconds: 2);
    Timer(
      duration,
      () => Get.offAllNamed('/login'),
    );
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              Get.offAllNamed('/login');
            } else {
              Get.offAllNamed('/update-notice');
            }
          });
        }
      }
    });
  }
}
