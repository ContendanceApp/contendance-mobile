import 'package:contendance_app/modules/succes_open_presence/controllers/succes_open_presence_controller.dart';
import 'package:get/get.dart';

class SuccesOpenPresenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SuccesOpenPresenceController>(SuccesOpenPresenceController());
  }
}
