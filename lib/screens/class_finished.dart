import 'package:badges/badges.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ClassFinished extends StatelessWidget {
  const ClassFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: cInter.copyWith(
            color: Colors.white,
            fontWeight: bold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6C7A95),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF6C7A95),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //Container for tittle
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text(
                    "Kelas Selesai!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: bold,
                      color: cWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Icon(
                      IconlyLight.logout,
                      size: 75,
                      color: cSubWhite,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Ruangan C-201",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: cSubWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    elevation: 0,
                    badgeColor: Colors.white,
                    borderRadius: BorderRadius.circular(150),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    badgeContent: Text(
                      '11:20',
                      style: cInter.copyWith(
                        color: cPrimaryBlue,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.17,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: Text(
                      "Workshop Pemrograman Perangkat Lunak",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: semibold,
                        color: cSubWhite,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "08:00 - 13:00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: semibold,
                      color: cWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
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
                    "Andhik Ampuh Yunanto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.0,
                      fontWeight: semibold,
                      color: cSubWhite,
                    ),
                  ),
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
                          gradient: cGradient,
                        ),
                      ),
                    ),
                    Button(
                      text: "OKE!",
                      callback: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/home",
                        (Route<dynamic> route) => false,
                      ),
                      primary: false,
                      secondary: false,
                      custom: true,
                      backgroundColor: cWhite,
                      fontColor: cSubText,
                      borderColor: cWhite,
                      paddingX: cPadding3,
                      paddingY: cPadding1,
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
