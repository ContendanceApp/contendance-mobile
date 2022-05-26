import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/components/subject_schedule_list.dart';
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
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Buka Semua',
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Tutup Semua',
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
              ],
            ),
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
