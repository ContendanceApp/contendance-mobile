import 'package:contendance_app/modules/subject_schedule/controllers/subject_schedule_controller.dart';
import 'package:get/get.dart';

class SubjectScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SubjectScheduleController>(SubjectScheduleController());
  }
}
