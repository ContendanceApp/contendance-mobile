import 'dart:async';
import 'dart:io' show Platform;
import 'package:contendance_app/data/models/presence.dart';
import 'package:contendance_app/screens/open_presence.dart';
import 'package:contendance_app/screens/ripple_animation/ripple_animation.dart';
import 'package:contendance_app/services/location_service.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    rangingBeacon();
    // timeoutSearchClass();
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

  timeoutSearchClass() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('classStatus', "not-found");
      if (mounted) {
        await Navigator.pushNamedAndRemoveUntil(
            context, "/home", (Route<dynamic> route) => false);
      }
    });
  }

  Future<void> _checkPermission() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('locationPerm') == null) {
      final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
      final isGpsOn = serviceStatus == ServiceStatus.enabled;
      if (!isGpsOn) {
        // print('Turn on location services before requesting permission.');
        Navigator.pushReplacementNamed(
            context, '/prominent-disclosure-location');
        return;
      }

      // final status = await Permission.locationWhenInUse.request();
      // if (status == PermissionStatus.granted) {
      //   print('Permission granted');
      // } else if (status == PermissionStatus.denied) {
      //   print(
      //       'Permission denied. Show a dialog and again ask for the permission');
      // } else if (status == PermissionStatus.permanentlyDenied) {
      //   print('Take the user to the settings page.');
      //   await openAppSettings();
      // }
    }
    if (prefs.getString('locationPerm') != null) {
      await prefs.remove("locationPerm");
      initializeBeacon();
      rangingBeacon();
      final status = await Permission.locationWhenInUse.request();
      if (status == PermissionStatus.granted) {
        // print('Permission granted');
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

  Future<Schedule> checkPresence(
    String proximityUUID,
    int major,
    int minor,
    int userId,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    int? roleId = prefs.getInt("roleId");

    if (roleId == 1) {
      // If student
      Map<String, String> body = {
        'proximity_uuid': proximityUUID.toLowerCase(),
        'major': major.toString(),
        'minor': minor.toString(),
        'user_id': userId.toString(),
      };
      return presence.validateSchedule(body).then((value) => value);
    } else {
      // If lecturer
      Map<String, String> body = {
        'proximity_uuid': proximityUUID.toLowerCase(),
        'major': major.toString(),
        'minor': minor.toString(),
        'user_id': userId.toString(),
      };
      return presence.validateSchedule(body).then((value) => value);
    }
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

  rangingBeacon() async {
    if (Platform.isIOS) {
      // iOS platform, at least set identifier and proximityUUID for region scanning
      regions.add(Region(
          identifier: 'Apple Airlocate',
          proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
    } else {
      regions.add(Region(identifier: 'com.beacon'));
    }

    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;

    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) async {
      print("result ${result.beacons}");
      if (result.beacons.isNotEmpty) {
        await prefs.remove('classStatus');
        if (mounted) {
          setState(() {
            beacons = result.beacons;
          });
        }
        _streamRanging?.cancel();
        // int index = 0;
        for (var beacon in beacons) {
          // print("ini beacon = $beacon");
          if (mounted) {
            await checkPresence(
                    beacon.proximityUUID, beacon.major, beacon.minor, userId)
                .then((value) => Navigator.pushReplacementNamed(
                    context, "/open-presence",
                    arguments: BeaconArgs(beacon: beacon, schedule: value)));
          }
          // _showNotification(
          //     index,
          //     "Beacon Detected",
          //     "UUID: ${beacon.proximityUUID} | Jarak: ${beacon.accuracy}",
          //     "This is the payload");
          // index++;
        }
      } else {
        Timer.periodic(Duration(seconds: 5), (timer) {
          timeoutSearchClass();
        });
      }
      // result contains a region and list of beacons found
      // list can be empty if no matching beacons were found in range
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
