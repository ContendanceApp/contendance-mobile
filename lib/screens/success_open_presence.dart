import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/theme.dart';
import '../data/models/presence.dart';

class SuccessPresence extends StatefulWidget {
  const SuccessPresence({Key? key}) : super(key: key);

  @override
  State<SuccessPresence> createState() => _SuccessPresenceState();
}

class _SuccessPresenceState extends State<SuccessPresence> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Presence;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: fontInter.copyWith(
            color: colorPrimaryBlue,
            fontWeight: fwBold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //Container for tittle
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                children: [
                  Text(
                    args.data.lecturer.roleId == 1
                        ? 'Presensi Berhasil'
                        : 'Presensi Berhasil Dibuka!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/bookmark-gradient.jpg',
                    height: 75,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    args.data.room.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    elevation: 0,
                    badgeColor: colorPrimaryBlue,
                    borderRadius: BorderRadius.circular(150),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    badgeContent: Text(
                      args.data.room.roomCode,
                      style: fontInter.copyWith(
                        color: const Color(0xFFFFFFFF).withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      //Icon(Icons.assignment_return),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Text(
                      args.data.subject.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64749F),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${args.data.subjectSchedule.startTime} - ${args.data.subjectSchedule.finishTime}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      const SizedBox(
                        width: 50,
                        child: Divider(
                          color: Color(0xFFF4F4F4),
                          height: 10,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        args.data.lecturer.fullname,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF145AE3),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: colorGradient,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 12),
                        primary: Colors.white,
                        textStyle: fontInter.copyWith(
                          fontSize: 16,
                          fontWeight: fwBold,
                        ),
                      ),
                      onPressed: () async {
                        print("disini bang");
                        final prefs = await SharedPreferences.getInstance();
                        final success = await prefs.remove('classStatus');
                        if (success) {
                          print(prefs.getString('classStatus'));
                          Navigator.pushReplacementNamed(context, "/home");
                        }
                      },
                      child: const Text('OKE'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
