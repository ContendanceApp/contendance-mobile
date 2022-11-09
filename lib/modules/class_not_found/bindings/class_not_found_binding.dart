import 'package:contendance_app/modules/class_not_found/controllers/class_not_found_controller.dart';
import 'package:get/get.dart';

class ClassNotFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClassNotFoundController>(ClassNotFoundController());
  }
}
