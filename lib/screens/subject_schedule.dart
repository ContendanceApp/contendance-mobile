import 'package:contendance_app/controllers/subject_schedule_controller.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';

import '../widgets/screen_wrapper/stack_screen.dart';
import '../widgets/subject_card.dart';

class SubjectSchedule extends StatelessWidget {
  final controller = Get.put(SubjectScheduleController());
  SubjectSchedule({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Jadwal Matkul",
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.none,
            child: Column(
              children: controller.histories
                  .asMap()
                  .entries
                  .map(
                    (history) => ExpandablePanel(
                      header: Text(
                        controller.days[history.key],
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
                          children: (controller.histories[history.key])
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
