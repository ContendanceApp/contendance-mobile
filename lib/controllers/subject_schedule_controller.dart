import 'package:get/get.dart';

import '../data/models/presence_history_model.dart';

class SubjectScheduleController extends GetxController {
  String? selectedValue;

  List<List<PresenceHistoryModel>> histories = [
    [
      PresenceHistoryModel(
        subject: "Kecerdasan Komputasional",
        acronym: "KK",
        lab: "R. Virtual M8",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Praktikum Kecerdasan Komputasional",
        acronym: "PKK",
        lab: "Lab C-206",
        presenceTime: "12:20 - 14:50",
        isExpanded: false,
      )
    ],
    [
      PresenceHistoryModel(
        subject: "Sistem Pendukung Keputusan",
        acronym: "SPK",
        lab: "R. Virtual M14",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Workshop Pemograman Perangkat Bergerak",
        acronym: "WPPB",
        lab: "Lab C-203",
        presenceTime: "10:30 - 13:50",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Workshop Pemodelan Perangkat Lunak",
        acronym: "WPPL",
        lab: "Lab C-105",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Desain Pengalaman Pengguna",
        acronym: "DPP",
        lab: "Lab C-307",
        presenceTime: "14:00 - 15:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Matematika 4",
        acronym: "M4",
        lab: "Lab C-307",
        presenceTime: "15:40 - 17:20",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Administrasi & Manajemen Jaringan",
        acronym: "AMJ",
        lab: "Lab C-307",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Praktikum Pengolahan Citra",
        acronym: "PPC",
        lab: "Lab C-303",
        presenceTime: "14:00 - 16:30",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Pengolahan Citra",
        acronym: "PC",
        lab: "R. Virtual M6",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Bahasa Inggris Untuk Professional 2",
        acronym: "BIUP2",
        lab: "R. Virtual M14",
        presenceTime: "09:40 - 11:20",
        isExpanded: false,
      ),
    ],
  ];

  List days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
  ];
}
