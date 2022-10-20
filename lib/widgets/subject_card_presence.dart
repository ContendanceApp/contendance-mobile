import 'package:contendance_app/data/models/find_classes_model.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';
import '../screens/open_presence.dart';

class SubjectCardPresence extends StatelessWidget {
  SubjectCardPresence({
    Key? key,
    required this.schedule,
    required this.beacon,
  }) : super(key: key);

  PresenceService presenceService = PresenceService();
  final FindClassesData schedule;
  final dynamic beacon;

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
                    "SQA",
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
                      "${schedule.subjects.name} (${schedule.studyGroups.name})",
                      style: fontInter.copyWith(
                        fontSize: 16,
                        fontWeight: fwMedium,
                        color: colorSubText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${schedule.startTime} - ${schedule.finishTime}",
                              style: fontInter.copyWith(
                                color: colorPrimaryBlack,
                                fontSize: 14,
                                fontWeight: fwBold,
                              ),
                            ),
                            Text(
                              "${schedule.rooms.roomCode} - ${schedule.rooms.name}",
                              style: fontInter.copyWith(
                                fontSize: 14,
                                fontWeight: fwBold,
                                color: colorPrimaryBlue,
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
        ),
      ),
      onTap: () {
        presence(schedule.subjectScheduleId, schedule.roomId, beacon);
      },
    );
  }

  presence(int subjectScheduleId, int roomId, dynamic beacon) async {
    Map<String, int> body = {
      'subject_schedule_id': subjectScheduleId,
      'room_id': roomId,
    };

    await presenceService.openPresence(body).then((value) => Get.offNamed(
        "/open-presence",
        arguments: BeaconArgs(beacon: beacon, schedule: value)));
  }
}
