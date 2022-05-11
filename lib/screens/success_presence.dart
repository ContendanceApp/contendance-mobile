import 'package:badges/badges.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:flutter/material.dart';

class SuccessPresence extends StatelessWidget {
  const SuccessPresence({Key? key, required this.presence}) : super(key: key);

  final Presence presence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: cInter.copyWith(
            color: cPrimaryBlue,
            fontWeight: bold,
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
              top: 100,
              child: Column(
                children: [
                  const Text(
                    "Presensi Berhasil!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/bookmark-gradient.jpg',
                    height: 75,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Ruangan ${presence.ruangan.name}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF145AE3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    elevation: 0,
                    badgeColor: cPrimaryBlue,
                    // badgeColor: const Color(0xFF1482E9),
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomLeft,
                    //   colors: [
                    //     Color(0xff145ae3),
                    //     Color(0xff15aeef),
                    //   ],
                    // ),
                    borderRadius: BorderRadius.circular(150),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    badgeContent: Text(
                      '08:07',
                      style: cInter.copyWith(
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
              bottom: 150,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    width: 200,
                    child: Text(
                      "Workshop Pemrograman Perangkat Lunak",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64749F),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "08:00 - 13:00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    children: const [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          color: Color(0xFFF4F4F4),
                          height: 10,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Andhik Ampuh Yunanto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff145ae3),
                              Color(0xff15aeef),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 12),
                        primary: Colors.white,
                        textStyle: cInter.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      ),
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
