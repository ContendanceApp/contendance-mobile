import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/components/subject_schedule_list.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';

class SubjectSchedule extends StatefulWidget {
  const SubjectSchedule({Key? key}) : super(key: key);

  @override
  State<SubjectSchedule> createState() => _SubjectScheduleState();
}

class _SubjectScheduleState extends State<SubjectSchedule> {
  String? selectedValue;
  final bool _isVisible = true;

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
          SubjectScheduleList(
            isVisible: _isVisible ? true : false,
            index: 1,
          ),
        ],
      ),
    );
  }
}
