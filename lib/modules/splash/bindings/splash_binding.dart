import 'package:contendance_app/modules/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
