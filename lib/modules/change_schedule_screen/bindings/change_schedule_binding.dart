import 'package:contendance_app/modules/change_schedule_screen/controllers/change_schedule_screen_controller.dart';
import 'package:contendance_app/modules/change_schedule_screen/screens/change_schedule.dart';
import 'package:get/get.dart';

class ChangeScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangeScheduleScreenController>(ChangeScheduleScreenController());
  }
}
