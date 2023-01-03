import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence_history_lecturer_model.dart';
import 'package:contendance_app/data/models/presence_history_student_model.dart';
import 'package:contendance_app/widgets/presence_history_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PresenceHistoryGroup extends StatelessWidget {
  PresenceHistoryGroup({
    Key? key,
    required this.presenceDate,
    this.historyStudent,
    this.historyLecturer,
  }) : super(key: key);

  String presenceDate;
  List<PresenceHistoryStudentData>? historyStudent;
  List<PresenceHistoryLecturerData>? historyLecturer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat("EEEE", "id_ID")
              .format(DateTime.parse(presenceDate).toLocal())
              .toString(),
          style: fontInter.copyWith(
            fontWeight: fwBold,
            fontSize: 24,
            color: colorPrimaryBlack,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat("EEEE, dd MMMM yyyy", "id_ID")
              .format(DateTime.parse(presenceDate).toLocal())
              .toString(),
          style: fontInter.copyWith(
            fontWeight: fwMedium,
            fontSize: 15,
            color: colorSubText,
          ),
        ),
        const SizedBox(height: paddingBase),
        Column(
          children: historyLecturer != null
              ? historyLecturer!.map(
                  (presenceHistory) {
                    return Column(
                      children: [
                        PresenceHistoryCard(
                          historyLecturer: presenceHistory,
                        )
                      ],
                    );
                  },
                ).toList()
              : historyStudent!.map(
                  (presenceHistory) {
                    return Column(
                      children: [
                        PresenceHistoryCard(
                          historyStudent: presenceHistory,
                        )
                      ],
                    );
                  },
                ).toList(),
        ),
      ],
    );
  }
}
