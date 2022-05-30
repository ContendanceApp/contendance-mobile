import 'dart:convert';
import 'package:contendance_app/components/bottom_app_bar/bottom_app_bar.dart';
import 'package:contendance_app/components/bottom_app_bar/floating_action_button.dart';
import 'package:contendance_app/components/presence_history_card.dart';
import 'package:contendance_app/components/skeleton_user_menu.dart';
import 'package:contendance_app/components/user_menu.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/login.dart';
import 'package:contendance_app/data/models/presence_history.dart';
import 'package:contendance_app/screens/search_class.dart';
import 'package:contendance_app/services/location_service.dart';
import 'package:contendance_app/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'dart:async';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

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
      const AndroidInitializationSettings('app_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  get blurRadius => null;
  get decoration => null;

  List beacons = [];
  final regions = <Region>[];
  late StreamSubscription<RangingResult>? _streamRanging;

  LoginService login = LoginService();
  String? _token;
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

  List histories = [
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Lunak",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Bergerak",
      acronym: "WPPB",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
      isExpanded: false,
    ),
  ];

  @override
  void initState() {
    super.initState;

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    locationService.getLocation();
    getToken();
    initializeBeacon();
    rangingBeacon();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    setState(() {
      _token = token;
    });
    if (token == null) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      getUserInfo();
    }
  }

  getUserInfo() async {
    var res = await login.loggedUser(_token!).then((value) => value);

    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
      setState(() {
        userInfo = resBody;
      });
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        preferences.remove("token");
      });
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Stack(
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          userInfo.fullname != ""
                              ? Text(
                                  userInfo.fullname,
                                  style: cInter.copyWith(
                                    fontWeight: bold,
                                    fontSize: 20,
                                    color: cWhite,
                                  ),
                                )
                              : SkeletonAnimation(
                                  borderRadius: BorderRadius.circular(8.0),
                                  shimmerColor: Colors.white54,
                                  child: Container(
                                    height: 25,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              userInfo.sidEid != 0
                                  ? Text(
                                      userInfo.sidEid.toString(),
                                      style: cInter.copyWith(
                                        fontWeight: medium,
                                        fontSize: 14,
                                        color: cSubWhite,
                                      ),
                                    )
                                  : SkeletonAnimation(
                                      borderRadius: BorderRadius.circular(8.0),
                                      shimmerColor: Colors.white54,
                                      child: Container(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white.withOpacity(0.25),
                                        ),
                                      ),
                                    ),
                              userInfo.studyGroup?.name != ""
                                  ? userInfo.studyGroup != null
                                      ? Badge(
                                          toAnimate: false,
                                          shape: BadgeShape.square,
                                          elevation: 0,
                                          badgeColor: cWhite,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          badgeContent: Text(
                                            userInfo.studyGroup!.name,
                                            style: cInter.copyWith(
                                              color: cPrimaryBlue,
                                              fontWeight: semibold,
                                            ),
                                          ),
                                        )
                                      : Badge(
                                          toAnimate: false,
                                          shape: BadgeShape.square,
                                          elevation: 0,
                                          badgeColor: cWhite,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          badgeContent: Text(
                                            "Dosen",
                                            style: cInter.copyWith(
                                              color: cPrimaryBlue,
                                              fontWeight: semibold,
                                            ),
                                          ),
                                        )
                                  : SkeletonAnimation(
                                      borderRadius: BorderRadius.circular(50.0),
                                      shimmerColor: Colors.white54,
                                      child: Container(
                                        height: 25,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Colors.white.withOpacity(0.25),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
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
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 136,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const Icon(
                                IconlyLight.login,
                                color: Color(0xFF64749F),
                                size: 35,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                "Belum memasuki kelas",
                                textAlign: TextAlign.center,
                                style: cInter.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                  color: cSubText,
                                ),
                              ),
                            ),
                            Text(
                              "Cari Kelas",
                              textAlign: TextAlign.center,
                              style: cInter.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                                color: cPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
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
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchClass(),
                            ));
                      },
                    ),
                    Container(
                      child: userInfo.roleId == 0
                          ? const SkeletonUserMenu()
                          : UserMenu(
                              role:
                                  userInfo.roleId == 1 ? "mahasiswa" : "dosen"),
                    ),
                    Text(
                      "Mata kuliah hari ini",
                      textAlign: TextAlign.left,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: histories
                          .map((history) =>
                              PresenceHistoryCard(history: history))
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
      floatingActionButton: const FloatingActionButtonComp(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBarComp(),
    );
  }

  showModalBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          height: 250.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(cRounded),
                    topRight: Radius.circular(cRounded))),
            child: Center(
              child: Stack(
                children: [
                  Positioned.fill(
                    top: -40,
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Fitur ini akan segera tersedia!",
                        style: cInter.copyWith(
                          fontWeight: bold,
                          fontSize: 18.0,
                          color: cPrimaryBlack,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(cPadding1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cRounded),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff145ae3),
                              Color(0xff15aeef),
                            ],
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 12),
                            primary: Colors.white,
                            textStyle: cInter.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OKE!"),
                        ),
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

  initializeBeacon() async {
    try {
      // if you want to manage manual checking about the required permissions
      await flutterBeacon.initializeScanning;

      // or if you want to include automatic checking permission
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.message);
      // library failed to initialize, check code and message
    }
  }

  rangingBeacon() {
    if (Platform.isIOS) {
      // iOS platform, at least set identifier and proximityUUID for region scanning
      regions.add(Region(
          identifier: 'Apple Airlocate',
          proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
    } else {
      regions.add(Region(identifier: 'com.beacon'));
    }

    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      print("result ${result.beacons}");
      if (result.beacons.isNotEmpty) {
        setState(() {
          beacons = result.beacons;
        });
        _streamRanging?.cancel();
        _showNotification(
            "Beacon Detected",
            "UUID: ${beacons[0].proximityUUID} | Jarak: ${beacons[0].accuracy}",
            "This is the payload");
      }
      // result contains a region and list of beacons found
      // list can be empty if no matching beacons were found in range
    });
  }

  void _showNotification(String? title, String? body, String? payload) async {
    const androidChannelPlatformSpecifics = AndroidNotificationDetails(
        'channelId', 'channelName',
        channelDescription: 'channelDescription',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    const platformChannelSpecifics =
        NotificationDetails(android: androidChannelPlatformSpecifics);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint("Notification Payload = $payload");
    }
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchClass(),
      ),
    );
  }
}
