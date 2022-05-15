import 'dart:async';
import 'dart:io' show Platform;
import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/ripple_animation/ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_beacon/flutter_beacon.dart';

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

  @override
  void initState() {
    super.initState();
    initializeBeacon();
    rangingBeacon();
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

  initializeBeacon() async {
    try {
      // if you want to manage manual checking about the required permissions
      await flutterBeacon.initializeScanning;

      // or if you want to include automatic checking permission
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
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
      // android platform, it can ranging out of beacon that filter all of Proximity UUID
      regions.add(Region(identifier: 'com.beacon'));
    }

    // to start ranging beacons
    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      print("result $result");
      setState(() {
        beacons = result.beacons;
      });
      // result contains a region and list of beacons found
      // list can be empty if no matching beacons were found in range
    });
  }
}
