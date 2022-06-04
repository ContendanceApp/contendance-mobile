import 'dart:async';
import 'dart:io' show Platform;
import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/ripple_animation/ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
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

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  @override
  void initState() {
    super.initState();
    initializeBeacon();
    rangingBeacon();
    timeoutSearchClass();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: RipplesAnimation(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        ),
        key: null,
        child: Container(),
      ),
    );
  }

  timeoutSearchClass() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('classStatus', "not-found");
      await Navigator.pushReplacementNamed(context, "/home");
    });
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
        int index = 0;
        for (var beacon in beacons) {
          print("keluar $index");
          _showNotification(
              index,
              "Beacon Detected",
              "UUID: ${beacons[index].proximityUUID} | Jarak: ${beacons[index].accuracy}",
              "This is the payload");
          index++;
        }
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
