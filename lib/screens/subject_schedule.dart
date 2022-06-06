import 'package:contendance_app/components/presence_history_card.dart';
import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/components/subject_card.dart';
import 'package:contendance_app/components/subject_schedule_list.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence_history.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SubjectSchedule extends StatefulWidget {
  const SubjectSchedule({Key? key}) : super(key: key);

  @override
  State<SubjectSchedule> createState() => _SubjectScheduleState();
}

class _SubjectScheduleState extends State<SubjectSchedule> {
  String? selectedValue;
  final bool _isVisible = true;

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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'Buka Semua',
          //         style: TextStyle(
          //           fontFamily: 'inter',
          //           fontSize: 14,
          //           fontWeight: bold,
          //           color: cPrimaryBlue,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 25,
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'Tutup Semua',
          //         style: TextStyle(
          //           fontFamily: 'inter',
          //           fontSize: 14,
          //           fontWeight: bold,
          //           color: cPrimaryBlue.withOpacity(0.5),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            clipBehavior: Clip.none,
            child: ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 300),
              elevation: 0,
              dividerColor: Colors.white,
              expandedHeaderPadding: const EdgeInsets.all(0),
              children: histories.asMap().entries.map<ExpansionPanel>(
                (dynamic item) {
                  return ExpansionPanel(
                    // hasIcon: false,
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            days[item.key],
                            style: cInter.copyWith(
                              color: cPrimaryBlack,
                              fontWeight: bold,
                              fontSize: 24,
                            ),
                          ),
                          item.value[0].isExpanded
                              ? Icon(
                                  IconlyLight.arrow_up_2,
                                  color: cPrimaryBlack,
                                )
                              : Icon(
                                  IconlyLight.arrow_down_2,
                                  color: cPrimaryBlack,
                                )
                        ],
                      );
                    },
                    body: Column(
                      children: (histories[item.key])
                          .map((history) => SubjectCard(history: history))
                          .toList(),
                    ),
                    isExpanded: item.value[0].isExpanded,
                  );
                },
              ).toList(),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  histories[index][0].isExpanded = !isExpanded;
                });
              },
            ),
          ),
          // SubjectScheduleList(
          //   isVisible: _isVisible ? true : false,
          //   index: 1,
          // ),
        ],
      ),
    );
  }
}
