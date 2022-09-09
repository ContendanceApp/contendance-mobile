import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

import '../constant/theme.dart';
import '../data/models/presence_history.dart';
import '../widgets/screen_wrapper/stack_screen.dart';
import '../widgets/subject_card.dart';

class SubjectSchedule extends StatefulWidget {
  const SubjectSchedule({Key? key}) : super(key: key);

  @override
  State<SubjectSchedule> createState() => _SubjectScheduleState();
}

class _SubjectScheduleState extends State<SubjectSchedule> {
  String? selectedValue;

  List<List<PresenceHistory>> histories = [
    [
      PresenceHistory(
        subject: "Kecerdasan Komputasional",
        acronym: "KK",
        lab: "R. Virtual M8",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistory(
        subject: "Praktikum Kecerdasan Komputasional",
        acronym: "PKK",
        lab: "Lab C-206",
        presenceTime: "12:20 - 14:50",
        isExpanded: false,
      )
    ],
    [
      PresenceHistory(
        subject: "Sistem Pendukung Keputusan",
        acronym: "SPK",
        lab: "R. Virtual M14",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistory(
        subject: "Workshop Pemograman Perangkat Bergerak",
        acronym: "WPPB",
        lab: "Lab C-203",
        presenceTime: "10:30 - 13:50",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistory(
        subject: "Workshop Pemodelan Perangkat Lunak",
        acronym: "WPPL",
        lab: "Lab C-105",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistory(
        subject: "Desain Pengalaman Pengguna",
        acronym: "DPP",
        lab: "Lab C-307",
        presenceTime: "14:00 - 15:40",
        isExpanded: false,
      ),
      PresenceHistory(
        subject: "Matematika 4",
        acronym: "M4",
        lab: "Lab C-307",
        presenceTime: "15:40 - 17:20",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistory(
        subject: "Administrasi & Manajemen Jaringan",
        acronym: "AMJ",
        lab: "Lab C-307",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistory(
        subject: "Praktikum Pengolahan Citra",
        acronym: "PPC",
        lab: "Lab C-303",
        presenceTime: "14:00 - 16:30",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistory(
        subject: "Pengolahan Citra",
        acronym: "PC",
        lab: "R. Virtual M6",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistory(
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

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Jadwal Matkul",
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.none,
            child: Column(
              children: histories
                  .asMap()
                  .entries
                  .map(
                    (history) => ExpandablePanel(
                      header: Text(
                        days[history.key],
                        style: fontInter.copyWith(
                          color: colorPrimaryBlack,
                          fontWeight: fwBold,
                          fontSize: 24,
                        ),
                      ),
                      collapsed: const SizedBox(height: 16),
                      expanded: Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: paddingBase),
                        child: Column(
                          children: (histories[history.key])
                              .map((history) => SubjectCard(history: history))
                              .toList(),
                        ),
                      ),
                      builder: (_, collapsed, expanded) => Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                      ),
                      theme: ExpandableThemeData(
                        hasIcon: true,
                        iconPadding: const EdgeInsets.all(0),
                        animationDuration: const Duration(milliseconds: 300),
                        iconSize: 24,
                        iconColor: colorPrimaryBlack,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
