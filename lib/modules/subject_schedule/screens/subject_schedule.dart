import 'package:contendance_app/modules/subject_schedule/controllers/subject_schedule_controller.dart';
import 'package:contendance_app/data/models/subjects_schedules_model.dart';
import 'package:contendance_app/services/schedule_service.dart';
import 'package:contendance_app/widgets/subject_schedule_card.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../../constant/theme.dart';

import '../../../widgets/screen_wrapper/stack_screen.dart';

// ignore: must_be_immutable
class SubjectSchedule extends StatelessWidget {
  final SubjectScheduleController controller = Get.find();
  SubjectSchedule({Key? key}) : super(key: key);
  ScheduleService scheduleService = ScheduleService();
  late Future<SubjectsScheduleModel> subjectsSchedules;

  Future<SubjectsScheduleModel>? getSchedules() async {
    subjectsSchedules = scheduleService.getSubjectsScheduleByStudyGroup();
    return subjectsSchedules;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Jadwal Matkul",
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.none,
            // child: Text("test"),
            child: FutureBuilder(
              future: getSchedules(),
              builder:
                  (context, AsyncSnapshot<SubjectsScheduleModel> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 100),
                    child: Column(
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                            color: colorPrimaryBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Memuat jadwal...",
                          style: fontInter.copyWith(
                            fontWeight: fwSemiBold,
                            color: colorSubText,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data!.data.isEmpty) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 100),
                          child: Text(
                            'Belum ada presensi',
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 18,
                              color: colorSubText,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        controller: ScrollController(
                          keepScrollOffset: false,
                        ),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (context, index) {
                          var subjects = snapshot.data?.data[index];
                          return subjects!.subjectsSchedules.isNotEmpty
                              ? ExpandablePanel(
                                  header: Text(
                                    subjects.day,
                                    style: fontInter.copyWith(
                                      color: colorPrimaryBlack,
                                      fontWeight: fwBold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  collapsed: const SizedBox(height: 16),
                                  expanded: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: paddingBase),
                                    child: Column(
                                      children: subjects.subjectsSchedules
                                          .map((item) => SubjectScheduleCard(
                                              subjects: item))
                                          .toList(),
                                    ),
                                  ),
                                  builder: (_, collapsed, expanded) =>
                                      Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                  ),
                                  theme: ExpandableThemeData(
                                    hasIcon: true,
                                    iconPadding: const EdgeInsets.all(0),
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    iconSize: 24,
                                    iconColor: colorPrimaryBlack,
                                  ),
                                )
                              : const SizedBox();
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 100),
                        child: Text(
                          'Belum ada presensi',
                          style: fontInter.copyWith(
                            fontWeight: fwBold,
                            fontSize: 18,
                            color: colorSubText,
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
              // Column(
              //   children: controller.histories
              //       .asMap()
              //       .entries
              //       .map(
              //         (history) => ExpandablePanel(
              //           header: Text(
              //             controller.days[history.key],
              //             style: fontInter.copyWith(
              //               color: colorPrimaryBlack,
              //               fontWeight: fwBold,
              //               fontSize: 24,
              //             ),
              //           ),
              //           collapsed: const SizedBox(height: 16),
              //           expanded: Container(
              //             margin:
              //                 const EdgeInsets.symmetric(vertical: paddingBase),
              //             // child: Column(
              //             //   children: (controller.histories[history.key])
              //             //       .map((history) => SubjectCard(schedule: history))
              //             //       .toList(),
              //             // ),
              //             child: FutureBuilder(builder: (context, A)),
              //           ),
              //           builder: (_, collapsed, expanded) => Expandable(
              //             collapsed: collapsed,
              //             expanded: expanded,
              //           ),
              //           theme: ExpandableThemeData(
              //             hasIcon: true,
              //             iconPadding: const EdgeInsets.all(0),
              //             animationDuration: const Duration(milliseconds: 300),
              //             iconSize: 24,
              //             iconColor: colorPrimaryBlack,
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
