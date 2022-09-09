import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/presence.dart';
import '../screens/open_presence.dart';
import '../widgets/ripple_animation/ripple_animation.dart';
import '../services/location_service.dart';
import '../services/presence_service.dart';

void main() => runApp(const SearchClass());

class SearchClass extends StatefulWidget {
  const SearchClass({Key? key}) : super(key: key);

  @override
  State<SearchClass> createState() => _SearchClassState();
}

class _SearchClassState extends State<SearchClass> {
  List beacons = [];

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
      // ignore: prefer_const_constructors
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
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/class-not-found');
    }
  }

  Future<Schedule> checkPresence(
    String proximityUUID,
    int major,
    int minor,
    int userId,
  ) async {
    // If lecturer
    Map<String, String> body = {
      'proximity_uuid': proximityUUID.toLowerCase(),
      'major': major.toString(),
      'minor': minor.toString(),
      'user_id': userId.toString(),
    };
    return presence.validateSchedule(body).then((value) => value);
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
    int userId = prefs.getInt('userId') ?? 0;
    int roleId = prefs.getInt('roleId') ?? 0;
    int studyGroupId = prefs.getInt('studyGroupId') ?? 0;

    // final bool locationServiceStatus =
    //     await flutterBeacon.checkLocationServicesIfEnabled;

    // if (!locationServiceStatus) {
    //   await locationService.getLocation();
    //   rangingBeacon();
    // }
    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) async {
      print("result ${result.beacons}");
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
                'major': beacon.major.toString(),
                'minor': beacon.minor.toString(),
                'user_id': userId.toString(),
                'study_group_id': studyGroupId.toString(),
              };

              try {
                await presence.createPresence(body).then((value) =>
                    Navigator.pushReplacementNamed(
                        context, "/success-open-presence",
                        arguments: value));
              } catch (e) {
                print(e);
                Timer.periodic(const Duration(seconds: 4), (timer) {
                  timeoutSearchClass();
                });
              }
            } else {
              // if lecturer
              var res = await checkPresence(
                      beacon.proximityUUID, beacon.major, beacon.minor, userId)
                  .then((value) => Navigator.pushReplacementNamed(
                      context, "/open-presence",
                      arguments: BeaconArgs(beacon: beacon, schedule: value)));
            }
          }
          // _showNotification(
          //     index,
          //     "Beacon Detected",
          //     "UUID: ${beacon.proximityUUID} | Jarak: ${beacon.accuracy}",
          //     "This is the payload");
          // index++;
        }
      } else {
        Timer.periodic(const Duration(seconds: 4), (timer) {
          timeoutSearchClass();
        });
      }
    });
  }

  void _showNotification(
      int id, String? title, String? body, String? payload) async {
    const androidChannelPlatformSpecifics = AndroidNotificationDetails(
        'channelId', 'channelName',
        channelDescription: 'channelDescription',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    const platformChannelSpecifics =
        NotificationDetails(android: androidChannelPlatformSpecifics);

    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payload);
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
