import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
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
}
