import 'package:contendance_app/components/presence_history_card.dart';
import 'package:contendance_app/components/stack_screen.dart';
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

  List histories = [
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Lunak",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Bergerak",
      acronym: "WPPB",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
  ];

  List days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Jadwal Matkul",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Buka Semua',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 14,
                    fontWeight: bold,
                    color: cPrimaryBlue,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Tutup Semua',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 14,
                    fontWeight: bold,
                    color: cPrimaryBlue.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          Container(
            clipBehavior: Clip.none,
            child: ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 300),
              elevation: 0,
              dividerColor: Colors.white,
              expandedHeaderPadding: const EdgeInsets.all(0),
              children: histories.map<ExpansionPanel>(
                (dynamic item) {
                  return ExpansionPanel(
                    hasIcon: false,
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            days[1],
                            style: cInter.copyWith(
                              color: cPrimaryBlack,
                              fontWeight: bold,
                              fontSize: 24,
                            ),
                          ),
                          item.isExpanded
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
                      children: (histories)
                          .map((history) =>
                              PresenceHistoryCard(history: history))
                          .toList(),
                    ),
                    isExpanded: item.isExpanded,
                  );
                },
              ).toList(),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  histories[index].isExpanded = !isExpanded;
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
