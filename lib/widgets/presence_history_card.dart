import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence_history_lecturer.dart';
import 'package:contendance_app/data/models/presence_history_student.dart';
import 'package:flutter/material.dart';

class PresenceHistoryCard extends StatelessWidget {
  PresenceHistoryCard({
    Key? key,
    this.historyStudent,
    this.historyLecturer,
  }) : super(key: key);

  late PresenceHistoryStudent? historyStudent;
  late PresenceHistoryLecturer? historyLecturer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ACR",
                    textAlign: TextAlign.center,
                    style: cInter.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: cPrimaryBlue,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF15AEEF).withOpacity(0.15),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      historyLecturer != null
                          ? historyLecturer!.subjectSchedule.subject.name
                          : historyStudent!
                              .presences.subjectSchedule.subject.name,
                      style: cInter.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: cSubText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          historyLecturer != null
                              ? historyLecturer!.room.roomCode
                              : historyStudent!.presences.room.roomCode,
                          style: cInter.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: cPrimaryBlue,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Presensi Pukul',
                              style: cInter.copyWith(
                                color: cPrimaryBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              historyLecturer != null
                                  ? historyLecturer!.openTime
                                  : historyStudent!.presenceTime,
                              style: cInter.copyWith(
                                color: cPrimaryBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: const Color(0xFFF4F4F4),
              width: 1.0,
              style: BorderStyle.solid),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.05),
          //     spreadRadius: 2,
          //     blurRadius: 10,
          //   )
          // ],
        ),
      ),
    );
  }
}