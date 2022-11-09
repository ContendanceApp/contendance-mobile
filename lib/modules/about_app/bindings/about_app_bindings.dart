import 'package:contendance_app/modules/about_app/controllers/about_app_controller.dart';
import 'package:get/get.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutAppController>(AboutAppController());
  }
}
