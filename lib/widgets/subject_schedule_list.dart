import 'package:flutter/material.dart';

import '../constant/theme.dart';
import '../data/models/presence_history.dart';

class SubjectScheduleList extends StatefulWidget {
  const SubjectScheduleList({
    Key? key,
    required this.isVisible,
    required this.index,
  }) : super(key: key);

  final bool isVisible;
  final int index;

  @override
  State<SubjectScheduleList> createState() => _SubjectScheduleListState();
}

class _SubjectScheduleListState extends State<SubjectScheduleList> {
  bool show = false;

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
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Senin",
                style: fontInter.copyWith(
                  color: colorPrimaryBlack,
                  fontWeight: fwBold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Column(
              //   verticalDirection: VerticalDirection.up,
              //   children: show
              //       ? (histories)
              //           .map((history) => PresenceHistoryCard(history: history))
              //           .toList()
              //       : [],
              // ),
            ],
          ),
        ),
      ),
      onTap: () {
        setState(
          () {
            if (widget.isVisible) {
              show = true;
            } else {
              show = false;
            }

            // if (_height == 500) {
            //   _height = 50;
            // } else {
            //   _height = 500;
            // }
          },
        );
      },
    );
  }
}
