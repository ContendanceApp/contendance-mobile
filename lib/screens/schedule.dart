import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SubjectSchedule extends StatefulWidget {
  const SubjectSchedule({Key? key}) : super(key: key);

  @override
  State<SubjectSchedule> createState() => _SubjectScheduleState();
}

class _SubjectScheduleState extends State<SubjectSchedule> {
  double _height = 50;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff145ae3),
                    Color(0xff15aeef),
                  ],
                ),
              ),
              height: 119,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Icon(
                          IconlyLight.arrow_left,
                          color: Colors.white,
                        )),
                  ),
                  const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Jadwal Matkul',
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: 600,
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
                  scheduleList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget scheduleList() {
    return InkWell(
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: _height,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: OverflowBox(
          minHeight: 10,
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            width: double.infinity,
            height: 114,
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 25, right: 16, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WPPL",
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
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Workshop Pemrograman Perangkat Lunak',
                          style: cInter.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cSubText,
                          ),
                        ),
                        Text(
                          'Lab C-102',
                          style: cInter.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: cPrimaryBlue,
                          ),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ],
            ),
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const Text(
          //       "Senin",
          //       style: TextStyle(
          //         fontFamily: 'inter',
          //         fontSize: 24,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),

          //   ],
          // ),
        ),
      ),
      onTap: () {
        setState(
          () {
            if (_height == 400) {
              _height = 20;
            } else {
              _height = 400;
            }
          },
        );
      },
    );
  }
}
