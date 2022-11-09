import 'package:get/get.dart';

class DetailClassController extends GetxController {
  int get presenceId => 1;

  @override
  void onState() {
    getDetailClassData(presenceId);
    super.onInit();
  }

  getDetailClassData(int presenceId) async {
    try {
      var args;
      getDetailClassData(args.data.presenceId);
    } catch (e) {
      print(e);
    }
  }
}
