import 'package:get/get.dart';

class ChangeScheduleScreenController extends GetxController {
  get child => null;
  String? pickedDate = '';
  String? pickedStart = '';
  String? pickedEnd = '';
  final selectedSubject = "".obs;
  List<String> subjects = [
    "Workshop Pemrograman Perangkat Lunak",
    "Kecerdasan Komputasional",
    "Desain Pengalaman Pengguna",
    "Workshop Administrasi Jaringan",
    "Bahasa Inggris 2",
    "Matematika 4"
  ];
}
