import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/theme.dart';
import '../data/models/find_classes_model.dart';
import '../widgets/subject_card_presence.dart';
import '../services/location_service.dart';
import '../services/presence_service.dart';
import '../widgets/ripple_animation/ripple_animation.dart';

void main() => runApp(const SearchClass());

class SearchClass extends StatefulWidget {
  const SearchClass({Key? key}) : super(key: key);

  @override
  State<SearchClass> createState() => _SearchClassState();
}

class _SearchClassState extends State<SearchClass> {
  List beacons = [];
  late FindClassesModel schedule;

  final regions = <Region>[];
  StreamSubscription<RangingResult>? _streamRanging;

  LocationService locationService = LocationService();
  PresenceService presence = PresenceService();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('mipmap/launcher_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  @override
  void initState() {
    super.initState();
    initializeBeacon();
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RipplesAnimation(
        onPressed: () {},
        key: null,
        child: Container(),
      ),
    );
  }

  timeoutSearchClass() async {
    if (mounted) {
      _streamRanging?.cancel();
      Get.offNamed('/class-not-found');
    }
  }

  Future<FindClassesModel> findClasses(
    String proximityUUID,
  ) async {
    // If lecturer
    Map<String, String> body = {
      'proximity_uuid': proximityUUID.toLowerCase(),
    };
    return presence.findClasses(body).then((value) => value);
  }

  initializeBeacon() async {
    try {
      // if you want to manage manual checking about the required permissions
      // await flutterBeacon.initializeScanning;

      // or if you want to include automatic checking permission
      await flutterBeacon.initializeAndCheckScanning;
      rangingBeacon();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.message);
    }
  }

  rangingBeacon() async {
    if (Platform.isAndroid) {
      regions.add(Region(identifier: 'com.beacon'));
    }

    final prefs = await SharedPreferences.getInstance();
    int roleId = prefs.getInt('roleId') ?? 0;

    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) async {
      if (result.beacons.isNotEmpty) {
        _streamRanging?.cancel();
        if (mounted) {
          setState(() {
            beacons = result.beacons;
          });
        }
        for (var beacon in beacons) {
          if (mounted) {
            if (roleId == 1) {
              // if student
              Map<String, String> body = {
                'proximity_uuid': beacon.proximityUUID.toLowerCase(),
              };

              try {
                await presence.createPresence(body).then((value) =>
                    Get.offNamed("/success-presence", arguments: value));
              } catch (e) {
                Exception(e);
                Timer.periodic(const Duration(seconds: 4), (timer) {
                  timeoutSearchClass();
                });
              }
            } else {
              // if lecturer
              final response = await findClasses(beacon.proximityUUID)
                  .then((value) => value);

              // ignore: unnecessary_null_comparison
              if (response != null) {
                if (response.data.isNotEmpty) {
                  setState(() {
                    schedule = response;
                  });
                  showModalBottom();
                  return;
                }
              }
            }
          }
        }
      } else {
        Timer.periodic(const Duration(seconds: 4), (timer) {
          timeoutSearchClass();
        });
      }
    });
  }

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

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint("Notification Payload = $payload");
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('classStatus', "not-found");
    await Get.offNamed("/home");
  }

  showModalBottom() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * (3 / 4)),
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
                    padding: const EdgeInsets.all(paddingLg),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Pilih Mata Kuliah",
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 18.0,
                              color: colorPrimaryBlack,
                            ),
                          ),
                          Text(
                            "Klik kartu matkul yang akan dibuka presensinya",
                            style: fontInter.copyWith(
                              fontSize: 16.0,
                              color: colorSubText,
                            ),
                          ),
                          const SizedBox(
                            height: paddingXl,
                          ),
                          Column(
                            children: schedule.data
                                .map((item) => SubjectCardPresence(
                                      schedule: item,
                                      beacon: beacons,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
