import 'package:contendance_app/data/models/subjects_schedules_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/theme.dart';

// ignore: must_be_immutable
class SubjectScheduleCard extends StatelessWidget {
  SubjectScheduleCard({
    Key? key,
    this.subjects,
  }) : super(key: key);

  late SubjectsScheduleDataGroup? subjects;

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
                    subjects!.subjects.acronym,
                    textAlign: TextAlign.center,
                    style: fontInter.copyWith(
                      fontSize: 14,
                      fontWeight: fwBold,
                      color: colorPrimaryBlue,
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
                      subjects!.subjects.name,
                      style: fontInter.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: colorSubText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjects!.rooms.roomCode,
                          style: fontInter.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colorPrimaryBlue,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Waktu Pelaksanaan',
                              style: fontInter.copyWith(
                                color: colorPrimaryBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              DateFormat("HH:mm")
                                  .format(subjects!.startTime)
                                  .toString(),
                              style: fontInter.copyWith(
                                color: colorPrimaryBlue,
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
