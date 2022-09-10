import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:figma_squircle/figma_squircle.dart';

import '../constant/theme.dart';
import '../data/models/class_presence_model.dart';
import '../data/models/login_model.dart';
import '../data/models/presence_history_model.dart';
import '../services/location_service.dart';
import '../services/login_service.dart';
import '../services/presence_service.dart';
import '../widgets/active_class.dart';
import '../widgets/button.dart';
import '../widgets/skeleton_active_class.dart';
import '../widgets/skeleton_user_menu.dart';
import '../widgets/subject_card.dart';
import '../widgets/user_menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationService locationService = LocationService();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('mipmap/launcher_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  get blurRadius => null;
  get decoration => null;

  List beacons = [];
  final regions = <Region>[];
  late StreamSubscription<RangingResult>? _streamRanging;

  LoginService login = LoginService();
  String? _token;

  bool loadActiveClass = true;

  PresenceService presence = PresenceService();
  ClassPresenceModel detailActiveClass = ClassPresenceModel(
    presenceId: 0,
    userId: 0,
    isOpen: false,
    openTime: "00:00",
    closeTime: "00:00",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    room: RoomModel(
      roomId: 0,
      beaconId: 0,
      name: "",
      roomCode: "",
      location: "",
      description: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    subjectSchedule: SubjectSchedule(
        subjectScheduleId: 0,
        subjectId: 0,
        userId: 0,
        studyGroupId: 0,
        roomId: 0,
        startTime: "00:00",
        finishTime: "00:00",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        subject: Subject(
          subjectId: 0,
          name: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )),
  );

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

  List<List<PresenceHistoryModel>> histories = [
    [
      PresenceHistoryModel(
        subject: "Kecerdasan Komputasional",
        acronym: "KK",
        lab: "R. Virtual M8",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Praktikum Kecerdasan Komputasional",
        acronym: "PKK",
        lab: "Lab C-206",
        presenceTime: "12:20 - 14:50",
        isExpanded: false,
      )
    ],
    [
      PresenceHistoryModel(
        subject: "Sistem Pendukung Keputusan",
        acronym: "SPK",
        lab: "R. Virtual M14",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Workshop Pemograman Perangkat Bergerak",
        acronym: "WPPB",
        lab: "Lab C-203",
        presenceTime: "10:30 - 13:50",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Workshop Pemodelan Perangkat Lunak",
        acronym: "WPPL",
        lab: "Lab C-105",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Desain Pengalaman Pengguna",
        acronym: "DPP",
        lab: "Lab C-307",
        presenceTime: "14:00 - 15:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Matematika 4",
        acronym: "M4",
        lab: "Lab C-307",
        presenceTime: "15:40 - 17:20",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Administrasi & Manajemen Jaringan",
        acronym: "AMJ",
        lab: "Lab C-307",
        presenceTime: "08:00 - 11:20",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Praktikum Pengolahan Citra",
        acronym: "PPC",
        lab: "Lab C-303",
        presenceTime: "14:00 - 16:30",
        isExpanded: false,
      ),
    ],
    [
      PresenceHistoryModel(
        subject: "Pengolahan Citra",
        acronym: "PC",
        lab: "R. Virtual M6",
        presenceTime: "08:00 - 09:40",
        isExpanded: false,
      ),
      PresenceHistoryModel(
        subject: "Bahasa Inggris Untuk Professional 2",
        acronym: "BIUP2",
        lab: "R. Virtual M14",
        presenceTime: "09:40 - 11:20",
        isExpanded: false,
      ),
    ],
  ];

  @override
  void initState() {
    super.initState;

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _checkPermission();
    checkAuth();
    checkClassStatus();
  }

  Future<void> _checkPermission() async {
    final prefs = await SharedPreferences.getInstance();
    final locationPerm = prefs.getString('locationPerm');
    final locationData = prefs.getBool('collectsLocation');

    if (locationPerm == null) {
      final locationServiceStatus =
          await Permission.locationWhenInUse.serviceStatus;
      final isGpsOn = locationServiceStatus == ServiceStatus.enabled;
      if (!isGpsOn) {
        // print('Turn on location services before requesting permission.');
        Navigator.pushReplacementNamed(
            context, '/prominent-disclosure-location');
        return;
      }
    } else {
      await prefs.remove("locationPerm");
      if (locationData == true) {
        final status = await Permission.locationWhenInUse.request();
        if (status == PermissionStatus.granted) {
          // print('Permission granted');
          // initializeBeacon();
          // rangingBeacon();
          await locationService.getLocation();
        } else if (status == PermissionStatus.denied) {
          // print(
          //     'Permission denied. Show a dialog and again ask for the permission');
          Navigator.pushReplacementNamed(
              context, '/prominent-disclosure-location');
        } else if (status == PermissionStatus.permanentlyDenied) {
          // print('Take the user to the settings page.');
          await openAppSettings();
          _checkPermission();
        }
      }
    }
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
    // print(res);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
      if (mounted) {
        setState(() {
          userInfo = resBody;
        });
        getActiveClass();
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

  getActiveClass() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    setState(() {
      loadActiveClass = true;
    });

    Map<String, String> body = {
      'user_id': userId.toString(),
    };
    try {
      await presence.activeClass(body).then((value) {
        setState(() {
          loadActiveClass = false;
          detailActiveClass = value;
        });
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          loadActiveClass = false;
        });
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: RefreshIndicator(
        color: colorPrimaryBlue,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return a Future when code finishs execution.
          getActiveClass();
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: colorGradient,
                    image: const DecorationImage(
                      image: svg_provider.Svg(
                        'assets/images/bg-waves.svg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 225,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      right: 8.0,
                                    ),
                                    child: SvgPicture.asset(
                                        "assets/images/hamburger-menu.svg"),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, "/account");
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    decoration: ShapeDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/lab-pens.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: colorSubWhite,
                                      shape: SmoothRectangleBorder(
                                        side: BorderSide(
                                          color: colorSubWhite,
                                          width: 0.8,
                                        ),
                                        borderRadius: SmoothBorderRadius(
                                          cornerRadius: 8,
                                          cornerSmoothing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/account-detail");
                                  },
                                ),
                              ],
                            ),
                            // Icon(
                            //   Icons.menu,
                            //   color: colorWhite,
                            //   size: 28,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userInfo.fullname != ""
                                    ? Text(
                                        userInfo.fullname,
                                        style: fontInter.copyWith(
                                          fontWeight: fwBold,
                                          fontSize: 20,
                                          color: colorWhite,
                                        ),
                                      )
                                    : SkeletonAnimation(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shimmerColor: Colors.white54,
                                        child: Container(
                                          height: 25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                const SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    userInfo.sidEid != 0
                                        ? Text(
                                            userInfo.sidEid.toString(),
                                            style: fontInter.copyWith(
                                              fontWeight: fwMedium,
                                              fontSize: 14,
                                              color: colorSubWhite,
                                            ),
                                          )
                                        : SkeletonAnimation(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shimmerColor: Colors.white54,
                                            child: Container(
                                              height: 15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: Colors.white
                                                    .withOpacity(0.25),
                                              ),
                                            ),
                                          ),
                                    userInfo.studyGroup?.name != ""
                                        ? userInfo.studyGroup != null
                                            ? Badge(
                                                toAnimate: false,
                                                shape: BadgeShape.square,
                                                elevation: 0,
                                                badgeColor: colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                badgeContent: Text(
                                                  userInfo.studyGroup!.name,
                                                  style: fontInter.copyWith(
                                                    color: colorPrimaryBlue,
                                                    fontWeight: fwSemifwBold,
                                                  ),
                                                ),
                                              )
                                            : Badge(
                                                toAnimate: false,
                                                shape: BadgeShape.square,
                                                elevation: 0,
                                                badgeColor: colorWhite,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                badgeContent: Text(
                                                  "Dosen",
                                                  style: fontInter.copyWith(
                                                    color: colorPrimaryBlue,
                                                    fontWeight: fwSemifwBold,
                                                  ),
                                                ),
                                              )
                                        : SkeletonAnimation(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            shimmerColor: Colors.white54,
                                            child: Container(
                                              height: 25,
                                              width: 75,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Colors.white
                                                    .withOpacity(0.25),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.75),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kelas berlangsung",
                        textAlign: TextAlign.left,
                        style: fontInter.copyWith(
                          fontSize: 14,
                          fontWeight: fwBold,
                          color: colorPrimaryBlack,
                        ),
                      ),
                      const SizedBox(height: 12),
                      detailActiveClass.presenceId == 0 && loadActiveClass
                          // detailActiveClass.presenceId == 0 || loadActiveClass
                          ? const SkeletonActiveClass()
                          : detailActiveClass.presenceId == 0
                              ? InkWell(
                                  child: Container(
                                    width: double.infinity,
                                    height: 135,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          child: const Icon(
                                            IconlyLight.login,
                                            color: Color(0xFF64749F),
                                            size: 35,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          child: Text(
                                            "Belum memasuki kelas",
                                            textAlign: TextAlign.center,
                                            style: fontInter.copyWith(
                                              fontSize: 16,
                                              fontWeight: fwBold,
                                              color: colorSubText,
                                            ),
                                          ),
                                        ),
                                        Button(
                                          text: "Cari Kelas",
                                          callback: () {
                                            Navigator.pushNamed(
                                                context, "/search-class");
                                          },
                                          primary: false,
                                          secondary: false,
                                          paddingX: 6,
                                          paddingY: 3,
                                          backgroundColor: colorPrimaryBlue,
                                          fontColor: colorWhite,
                                          customFontSize: 13,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        border: Border.all(
                                            color: const Color(0xFFF4F4F4),
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                          )
                                        ]),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/search-class");
                                  },
                                )
                              : ActiveClass(
                                  classPresence: detailActiveClass,
                                  roleId: userInfo.roleId,
                                ),
                      Container(
                        child: userInfo.roleId == 0
                            ? const SkeletonUserMenu()
                            : UserMenu(
                                role: userInfo.roleId == 1
                                    ? "mahasiswa"
                                    : "dosen"),
                      ),
                      Text(
                        "Mata kuliah hari ini",
                        textAlign: TextAlign.left,
                        style: fontInter.copyWith(
                          fontSize: 14,
                          fontWeight: fwBold,
                          color: colorPrimaryBlack,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: (histories[1])
                            .map((history) => SubjectCard(history: history))
                            .toList(),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: const FloatingActionButtonComp(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: const BottomAppBarComp(),
    );
  }

  // showModalBottom() {
  //   return showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     builder: (builder) {
  //       return Container(
  //         height: 250.0,
  //         color: Colors.transparent, //could change this to Color(0xFF737373),
  //         //so you don't have to change MaterialApp canvasColor
  //         child: Container(
  //           decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(roundedBase),
  //                   topRight: Radius.circular(roundedBase))),
  //           child: Center(
  //             child: Stack(
  //               children: [
  //                 Positioned.fill(
  //                   top: -40,
  //                   child: Align(
  //                     alignment: AlignmentDirectional.center,
  //                     child: Text(
  //                       "Fitur ini akan segera tersedia!",
  //                       style: fontInter.copyWith(
  //                         fontWeight: fwBold,
  //                         fontSize: 18.0,
  //                         color: colorPrimaryBlack,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: AlignmentDirectional.bottomCenter,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(paddingBase),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(roundedBase),
  //                         gradient: const LinearGradient(
  //                           begin: Alignment.topRight,
  //                           end: Alignment.bottomLeft,
  //                           colors: [
  //                             Color(0xff145ae3),
  //                             Color(0xff15aeef),
  //                           ],
  //                         ),
  //                       ),
  //                       child: TextButton(
  //                         style: TextButton.styleFrom(
  //                           minimumSize: const Size.fromHeight(0),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 45, vertical: 12),
  //                           primary: Colors.white,
  //                           textStyle: fontInter.copyWith(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.fwBold,
  //                           ),
  //                         ),
  //                         onPressed: () => Navigator.pop(context),
  //                         child: const Text("OKE!"),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  showModalBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          height: 300.0,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(roundedBase),
                topRight: Radius.circular(roundedBase),
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Kelas Tidak Ditemukan!",
                            textAlign: TextAlign.center,
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 18.0,
                              color: colorPrimaryBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SvgPicture.asset("assets/images/close-square.svg"),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Pastikan anda berada pada jangkauan kelas atau ruangan 😉",
                            textAlign: TextAlign.center,
                            style: fontInter.copyWith(
                              fontSize: 16.0,
                              color: colorSubText,
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
                            callback: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              // await prefs.setString('classStatus', 'found');
                              final success = await prefs.remove('classStatus');
                              if (success) {
                                if (mounted) {
                                  Navigator.pop(context);
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // initializeBeacon() async {
  //   try {
  //     // if you want to manage manual checking about the required permissions
  //     // await flutterBeacon.initializeScanning;

  //     // or if you want to include automatic checking permission
  //     await flutterBeacon.initializeAndCheckScanning;
  //   } on PlatformException catch (e) {
  //     // ignore: avoid_print
  //     print(e.message);
  //     // library failed to initialize, check code and message
  //   }
  // }

  // rangingBeacon() {
  //   if (Platform.isIOS) {
  //     // iOS platform, at least set identifier and proximityUUID for region scanning
  //     regions.add(Region(
  //         identifier: 'Apple Airlocate',
  //         proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
  //   } else {
  //     regions.add(Region(identifier: 'com.beacon'));
  //   }

  //   _streamRanging =
  //       flutterBeacon.ranging(regions).listen((RangingResult result) {
  //     if (result.beacons.isNotEmpty) {
  //       setState(() {
  //         beacons = result.beacons;
  //       });
  //       _streamRanging?.cancel();
  //       int index = 0;
  //       for (var beacon in beacons) {
  //         _showNotification(
  //             index,
  //             "Beacon Detected",
  //             "UUID: ${beacon.proximityUUID} | Jarak: ${beacon.accuracy}",
  //             "This is the payload");
  //         index++;
  //       }
  //     }
  //     // result contains a region and list of beacons found
  //     // list can be empty if no matching beacons were found in range
  //   });
  // }

  // void _showNotification(
  //     int id, String? title, String? body, String? payload) async {
  //   const androidChannelPlatformSpecifics = AndroidNotificationDetails(
  //       'channelId', 'channelName',
  //       channelDescription: 'channelDescription',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       ticker: 'test ticker');

  //   const platformChannelSpecifics =
  //       NotificationDetails(android: androidChannelPlatformSpecifics);

  //   await flutterLocalNotificationsPlugin
  //       .show(id, title, body, platformChannelSpecifics, payload: payload);
  // }

  Future<void> checkClassStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('classStatus'));

    if (prefs.getString('classStatus') != null) {
      if (prefs.getString('classStatus') == "not-found") {
        await prefs.remove('classStatus');
        showModalBottom();
      }
    }
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint("Notification Payload = $payload");
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('classStatus', "not-found");
    await Navigator.pushReplacementNamed(context, "/home");
  }
}
