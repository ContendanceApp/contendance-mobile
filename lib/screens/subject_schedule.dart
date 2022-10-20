import 'package:contendance_app/controllers/subject_schedule_controller.dart';
import 'package:contendance_app/data/models/subjects_schedules_model.dart';
import 'package:contendance_app/services/schedule_service.dart';
import 'package:contendance_app/widgets/presence_history_card.dart';
import 'package:contendance_app/widgets/subject_schedule_card.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/theme.dart';

import '../widgets/screen_wrapper/stack_screen.dart';
import '../widgets/subject_card.dart';

class SubjectSchedule extends StatelessWidget {
  final controller = Get.put(SubjectScheduleController());
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
                    child: const Center(
                      child: CircularProgressIndicator(),
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
                          return ExpandablePanel(
                            header: Text(
                              subjects!.days.day,
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
                                children: [
                                  SubjectScheduleCard(subjects: subjects)
                                ],
                              ),
                            ),
                            builder: (_, collapsed, expanded) => Expandable(
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
                          );
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
