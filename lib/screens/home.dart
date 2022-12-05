import 'dart:convert';
import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:figma_squircle/figma_squircle.dart';

import '../data/models/active_presence_model.dart';
import '../data/models/schedule_model.dart';
import '../services/schedule_service.dart';
import '../widgets/skeleton_card_schedule.dart';
import '../constant/theme.dart';
import '../data/models/login_model.dart';
import '../data/models/login_model.dart' as study_groups;
import '../services/location_service.dart';
import '../services/login_service.dart';
import '../services/presence_service.dart';
import '../widgets/active_presence.dart';
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

  final regions = <Region>[];
  String _token = "";
  List todaySchedule = <ScheduleData>[];

  // late BluetoothState state;
  LoginService login = LoginService();
  ScheduleService schedule = ScheduleService();

  bool isloadActiveClass = true;
  bool isloadSchedule = true;

  PresenceService presence = PresenceService();

  ActivePresenceModel activePresence = ActivePresenceModel(
    message: "",
    data: ActivePresenceData(
      presenceId: 0,
      subjectScheduleId: 0,
      roomId: 0,
      userId: 0,
      isOpen: false,
      waitingRoom: false,
      openTime: "",
      closeTime: "",
      presenceDate: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      subjectsSchedules: ActivePresenceSubjectsSchedules(
          startTime: "",
          finishTime: "",
          subjects: ActivePresenceSubjects(name: "")),
      users: Lecturer(fullname: ""),
      rooms: UsedRooms(name: "", roomCode: "", location: ""),
    ),
  );

  UserInfo userInfo = UserInfo(
    userId: 0,
    fullname: "",
    email: "",
    sidEid: "",
    gender: "",
    roleId: 0,
    studyGroupId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    roles: Roles(
        roleId: 0,
        role: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    studyGroups: study_groups.StudyGroups(
      studyGroupId: 0,
      name: "",
      year: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );

  @override
  void initState() {
    super.initState;

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _checkPermission();
    // askBluetoothPerm();
    checkAuth();
  }

  enableBlue() async {
    try {
      // For bluetooth permissions on Android 12+.
      await Nearby().checkBluetoothPermission();
// asks for BLUETOOTH_ADVERTISE, BLUETOOTH_CONNECT, BLUETOOTH_SCAN permissions.
      Nearby().askBluetoothPermission();
    } catch (e) {
      // ignore: avoid_print
      print("Error: $e");
    }
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
        Get.offNamed('/prominent-disclosure-location');
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
          // initializeBeacon();
          locationService.getLocation();
          enableBlue();
        } else if (status == PermissionStatus.denied) {
          // print(
          //     'Permission denied. Show a dialog and again ask for the permission');
          Get.offNamed('/prominent-disclosure-location');
        } else if (status == PermissionStatus.permanentlyDenied) {
          // print('Take the user to the settings page.');
          await openAppSettings();
          _checkPermission();
        }
      }
    }
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
  //   }
  // }

  // askBluetoothPerm() async {
  //   AppSettings.openBluetoothSettings();
  // }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      setState(() {
        _token = token;
      });
      getUserInfo();
      getTodaySchedule();
    } else {
      Get.offNamed("/login");
    }
  }

  getUserInfo() async {
    final res =
        await login.loggedUser(_token.toString()).then((value) => value);
    Map<dynamic, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(result['data']);
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
          Get.offNamed("/login");
        }
      }
    }
  }

  getTodaySchedule() async {
    setState(() {
      isloadSchedule = true;
    });

    try {
      var res = await schedule.getTodaySchedule(_token).then((value) => value);
      if (mounted) {
        setState(() {
          todaySchedule = res.data;
          isloadSchedule = false;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  getActiveClass() async {
    setState(() {
      isloadActiveClass = true;
    });

    try {
      await presence.activeClass(_token).then((value) {
        setState(() {
          isloadActiveClass = false;
          activePresence = value;
        });
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          isloadActiveClass = false;
          activePresence.data.presenceId = 0;
        });
        // print(e);
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
          getActiveClass();
          getTodaySchedule();
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 1.01),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Get.toNamed("/account");
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/user-thumbnail.png',
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
                                      Get.toNamed("/account-detail");
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userInfo.fullname != ""
                                      ? FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            userInfo.fullname,
                                            style: fontInter.copyWith(
                                              fontWeight: fwBold,
                                              fontSize: 20,
                                              color: colorWhite,
                                            ),
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
                                      userInfo.sidEid != ""
                                          ? FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                userInfo.sidEid.toString(),
                                                style: fontInter.copyWith(
                                                  fontWeight: fwMedium,
                                                  fontSize: 14,
                                                  color: colorSubWhite,
                                                ),
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors.white
                                                      .withOpacity(0.25),
                                                ),
                                              ),
                                            ),
                                      userInfo.studyGroups?.name != ""
                                          ? userInfo.studyGroups != null
                                              ? Badge(
                                                  toAnimate: false,
                                                  shape: BadgeShape.square,
                                                  elevation: 0,
                                                  badgeColor: colorWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  badgeContent: Text(
                                                    userInfo.studyGroups!.name,
                                                    style: fontInter.copyWith(
                                                      color: colorPrimaryBlue,
                                                      fontWeight: fwSemiBold,
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
                                                      fontWeight: fwSemiBold,
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
                                                      BorderRadius.circular(
                                                          50.0),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Kelas berlangsung",
                            textAlign: TextAlign.left,
                            style: fontInter.copyWith(
                              fontSize: 14,
                              fontWeight: fwBold,
                              color: colorPrimaryBlack,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        isloadActiveClass
                            // activePresence.presenceId == 0 || isloadActiveClass
                            ? const SkeletonActiveClass()
                            : activePresence.data.presenceId == 0
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
                                            margin: const EdgeInsets.only(
                                                bottom: 5),
                                            child: const Icon(
                                              IconlyLight.login,
                                              color: Color(0xFF64749F),
                                              size: 35,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
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
                                          ),
                                          Button(
                                            text: "Cari Kelas",
                                            callback: () {
                                              Get.toNamed("/search-class");
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
                                              color: Colors.black
                                                  .withOpacity(0.05),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            )
                                          ]),
                                    ),
                                    onTap: () {
                                      Get.toNamed("/search-class");
                                    },
                                  )
                                : ActivePresence(
                                    activePresence: activePresence,
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
                          children: todaySchedule.isNotEmpty
                              ? isloadSchedule
                                  ? [const SkeletonCardSchedule()]
                                  : (todaySchedule)
                                      .map((schedule) =>
                                          SubjectCard(schedule: schedule))
                                      .toList()
                              : [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: paddingLg),
                                    alignment: AlignmentDirectional.center,
                                    child: Column(
                                      children: [
                                        Icon(
                                          IconlyLight.tick_square,
                                          size: 40,
                                          color: colorSubText,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                              "Tidak ada matkul hari ini",
                                              textAlign: TextAlign.center,
                                              style: fontInter.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: fwSemiBold,
                                                  color: colorSubText)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
      ),
    );
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint("Notification Payload = $payload");
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('classStatus', "not-found");
    await Get.offNamed("/home");
  }
}
