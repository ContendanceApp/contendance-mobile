import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PresensiBerhasil extends StatelessWidget{
  const PresensiBerhasil({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                "CONTENDANCE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(20, 90, 227, 1),
                ),
              ),
            ), //Container for tittle
            Container(
              margin: const EdgeInsets.only(top: 95.0),
              child: const Text(
                "Presensi Berhasil!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SvgPicture.asset('assets/images/Bookmark.svg', color: Color.fromRGBO(20, 90, 227, 1),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Column(
                    children: const <Widget> [
                      //Icon(Icons.assignment_return),
                      Text(
                        "Ruangan C-102",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(20, 90, 227, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 150.0),
              margin: const EdgeInsets.only(left: 150.0, right: 150.0),
              child: const Text(
                "Workshop Pemrograman Perangkat Lunak",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                "Andhik Ampuh Yunanto",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(20, 90, 227, 1),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}