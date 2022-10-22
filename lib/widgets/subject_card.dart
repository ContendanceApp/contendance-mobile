import 'package:contendance_app/data/models/schedule_model.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../constant/theme.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final ScheduleData schedule;

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
                    schedule.subjects.acronym,
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
                      "${schedule.subjects.name} - ${schedule.studyGroups.name}",
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
        showModalBottom(context);
      },
    );
  }

  showModalBottom(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * (3 / 4)),
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(roundedBase),
                topRight: Radius.circular(roundedBase),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    child: Column(
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
                                schedule.subjects.acronym,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        const SizedBox(height: paddingBase),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  schedule.subjects.name,
                                  style: fontInter.copyWith(
                                    fontSize: 18,
                                    fontWeight: fwBold,
                                    color: colorPrimaryBlue,
                                  ),
                                ),
                                const SizedBox(height: paddingLg),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Waktu Pelaksanaan',
                                          style: fontInter.copyWith(
                                            color: colorSubText,
                                            fontSize: 16,
                                            fontWeight: fwMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${schedule.startTime} - ${schedule.finishTime}",
                                          style: fontInter.copyWith(
                                            color: colorPrimaryBlack,
                                            fontSize: 16,
                                            fontWeight: fwSemiBold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: paddingBase,
                                        ),
                                        Text(
                                          'Tempat Pelaksanaan',
                                          style: fontInter.copyWith(
                                            color: colorSubText,
                                            fontSize: 16,
                                            fontWeight: fwMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${schedule.rooms.roomCode} - ${schedule.rooms.name}",
                                          style: fontInter.copyWith(
                                            fontSize: 16,
                                            fontWeight: fwBold,
                                            color: colorPrimaryBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: paddingBase,
                                        ),
                                        Text(
                                          'Kelas',
                                          style: fontInter.copyWith(
                                            color: colorSubText,
                                            fontSize: 16,
                                            fontWeight: fwMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${schedule.studyGroups.name} - ${schedule.studyGroups.year}",
                                          style: fontInter.copyWith(
                                            fontSize: 16,
                                            fontWeight: fwBold,
                                            color: colorPrimaryBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: paddingBase,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dosen Pengampu',
                                      style: fontInter.copyWith(
                                        color: colorSubText,
                                        fontSize: 16,
                                        fontWeight: fwMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      schedule.users.fullname,
                                      style: fontInter.copyWith(
                                        fontSize: 16,
                                        fontWeight: fwSemiBold,
                                        color: colorPrimaryBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingBase),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          text: "Tutup",
                          primary: true,
                          secondary: false,
                          callback: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
