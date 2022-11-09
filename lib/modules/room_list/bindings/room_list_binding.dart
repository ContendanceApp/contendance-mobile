import 'package:get/get.dart';

class RoomListController extends Bindings {
  @override
  void dependencies() {
    Get.put<RoomListController>(RoomListController());
  }
}
