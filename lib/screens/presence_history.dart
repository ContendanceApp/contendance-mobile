import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:contendance_app/components/presence_history_card.dart';
import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/login.dart';
import 'package:contendance_app/data/models/presence_history.dart';
import 'package:contendance_app/data/models/presence_history_lecturer.dart';
import 'package:contendance_app/data/models/presence_history_student.dart';
import 'package:contendance_app/services/login_service.dart';
import 'package:contendance_app/services/presence_history_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresenceHistoryScreen extends StatefulWidget {
  const PresenceHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PresenceHistoryScreen> createState() => _PresenceHistoryStateScreen();
}

class _PresenceHistoryStateScreen extends State<PresenceHistoryScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  LoginService login = LoginService();
  String? _token;

  late Future<PresenceHistoryLecturers> _historyLecturer;
  late Future<PresenceHistoryStudents> _historyStudent;
  PresenceHistoryService presenceHistory = PresenceHistoryService();

  String dayNow =
      DateFormat("EEEEE, d MMMM yyyy", "id_ID").format(DateTime.now());

  List histories = [
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Lunak",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Bergerak",
      acronym: "WPPB",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
  ];

  UserInfo userInfo = UserInfo(
    userId: 0,
    fullname: "",
    email: "",
    emailVerifiedAt: DateTime.now(),
    sidEid: 0,
    gender: "",
    roleId: 0,
    studyGroupId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    studyGroup: StudyGroup(
      studyGroupId: 0,
      name: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );

  @override
  void initState() {
    super.initState();
    checkAuth();
    _historyStudent = PresenceHistoryService().getPresenceHistoryStudent();
    _historyLecturer = PresenceHistoryService().getPresenceHistoryLecturer();

    // getPresenceHistory();
  }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      setState(() {
        _token = prefs.getString("token");
      });
      getUserInfo();
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  getUserInfo() async {
    var res = await login.loggedUser(_token.toString()).then((value) => value);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
      if (mounted) {
        setState(() {
          userInfo = resBody;
        });
      }
    } else {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove('token');
      if (success) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, "/login");
        }
      }
    }
  }

  getPresenceHistoryData() async {
    print("sini bang");
    print(userInfo.roleId);
    if (userInfo.roleId == 1) {
      print("student");
      // if student
    } else if (userInfo.roleId == 2) {
      print("dosen");
      // if lecturer
    }
  }

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Riwayat Presensi",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Cari Berdasarkan Tanggal",
          //   textAlign: TextAlign.left,
          //   style: cInter.copyWith(
          //     fontSize: 14,
          //     fontWeight: bold,
          //     color: cPrimaryBlack,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 12),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: DropdownButtonHideUnderline(
          //           child: DropdownButton2(
          //             dropdownMaxHeight: 300,
          //             hint: Text(
          //               'Tgl',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: medium,
          //                 color: cSubText,
          //               ),
          //             ),
          //             items: day
          //                 .map(
          //                   (item) => DropdownMenuItem<String>(
          //                     value: item,
          //                     child: Text(
          //                       item,
          //                       style: const TextStyle(
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //                 .toList(),
          //             value: selectedDay,
          //             onChanged: (value) {
          //               setState(() {
          //                 selectedDay = value as String;
          //               });
          //             },
          //             icon: const Icon(IconlyLight.arrow_down_2),
          //             buttonWidth: 140,
          //             itemHeight: 40,
          //             buttonElevation: 10,
          //             buttonPadding: const EdgeInsets.symmetric(
          //                 horizontal: 10, vertical: 6),
          //             buttonDecoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color(0xFFF4F4F4),
          //                 width: 1,
          //               ),
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: const Color(0xFF000000).withOpacity(0.05),
          //                   blurRadius: 10,
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: Container(
          //           margin: const EdgeInsets.symmetric(horizontal: 10),
          //           child: DropdownButtonHideUnderline(
          //             child: DropdownButton2(
          //               dropdownMaxHeight: 300,
          //               hint: Text(
          //                 'Bulan',
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: medium,
          //                   color: cSubText,
          //                 ),
          //               ),
          //               items: month
          //                   .map(
          //                     (item) => DropdownMenuItem<String>(
          //                       value: item,
          //                       child: Text(
          //                         item,
          //                         style: const TextStyle(
          //                           fontSize: 16,
          //                         ),
          //                       ),
          //                     ),
          //                   )
          //                   .toList(),
          //               value: selectedMonth,
          //               onChanged: (value) {
          //                 setState(() {
          //                   selectedMonth = value as String;
          //                 });
          //               },
          //               icon: const Icon(IconlyLight.arrow_down_2),
          //               buttonWidth: 140,
          //               itemHeight: 40,
          //               buttonElevation: 10,
          //               buttonPadding: const EdgeInsets.symmetric(
          //                   horizontal: 10, vertical: 6),
          //               buttonDecoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: const Color(0xFFF4F4F4),
          //                   width: 1,
          //                 ),
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.white,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: const Color(0xFF000000).withOpacity(0.05),
          //                     blurRadius: 10,
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: DropdownButtonHideUnderline(
          //           child: DropdownButton2(
          //             dropdownMaxHeight: 300,
          //             hint: Text(
          //               'Tahun',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: medium,
          //                 color: cSubText,
          //               ),
          //             ),
          //             items: year
          //                 .map(
          //                   (item) => DropdownMenuItem<String>(
          //                     value: item,
          //                     child: Text(
          //                       item,
          //                       style: const TextStyle(
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //                 .toList(),
          //             value: selectedYear,
          //             onChanged: (value) {
          //               setState(() {
          //                 selectedYear = value as String;
          //               });
          //             },
          //             icon: const Icon(IconlyLight.arrow_down_2),
          //             buttonWidth: 140,
          //             itemHeight: 40,
          //             buttonElevation: 10,
          //             buttonPadding: const EdgeInsets.symmetric(
          //                 horizontal: 10, vertical: 6),
          //             buttonDecoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color(0xFFF4F4F4),
          //                 width: 1,
          //               ),
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: const Color(0xFF000000).withOpacity(0.05),
          //                   blurRadius: 10,
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            // padding: const EdgeInsets.only(top: 40, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hari Ini', //need improve
                  style: cInter.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                    color: cPrimaryBlack,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dayNow, //need improve
                  style: cInter.copyWith(
                    fontWeight: medium,
                    fontSize: 15,
                    color: cSubText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: userInfo.roleId == 0
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 100),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : userInfo.roleId == 1
                    ? FutureBuilder(
                        future: _historyStudent,
                        builder: (context,
                            AsyncSnapshot<PresenceHistoryStudents> snapshot) {
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 100),
                                    child: Text(
                                      'Belum ada presensi',
                                      style: cInter.copyWith(
                                        fontWeight: bold,
                                        fontSize: 18,
                                        color: cSubText,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.data.length,
                                  itemBuilder: (context, index) {
                                    var history = snapshot.data?.data[index];
                                    return PresenceHistoryCard(
                                        historyStudent: history!);
                                  },
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            } else {
                              return Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 100),
                                  child: Text(
                                    'Belum ada presensi',
                                    style: cInter.copyWith(
                                      fontWeight: bold,
                                      fontSize: 18,
                                      color: cSubText,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      )
                    : userInfo.roleId == 2
                        ? FutureBuilder(
                            future: _historyLecturer,
                            builder: (context,
                                AsyncSnapshot<PresenceHistoryLecturers>
                                    snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 100),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.data.isEmpty) {
                                    return Center(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 100),
                                        child: Text(
                                          'Belum ada presensi',
                                          style: cInter.copyWith(
                                            fontWeight: bold,
                                            fontSize: 18,
                                            color: cSubText,
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
                                        var history =
                                            snapshot.data?.data[index];
                                        return PresenceHistoryCard(
                                            historyLecturer: history!);
                                      },
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(snapshot.error.toString()));
                                } else {
                                  return Center(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 100),
                                      child: Text(
                                        'Belum ada presensi',
                                        style: cInter.copyWith(
                                          fontWeight: bold,
                                          fontSize: 18,
                                          color: cSubText,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 100),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
          ),
        ],
      ),
    );
  }

  getPresenceHistory() async {
    final prefs = await SharedPreferences.getInstance();
    int roleId = prefs.getInt("roleId") ?? 0;

    if (roleId == 1) {
      // if student
      presenceHistory.getPresenceHistoryStudent();
    } else {
      // if lecturer
      presenceHistory.getPresenceHistoryLecturer();
    }
  }
}
