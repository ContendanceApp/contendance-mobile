import 'package:badges/badges.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassNotFound extends StatefulWidget {
  const ClassNotFound({Key? key}) : super(key: key);

  @override
  State<ClassNotFound> createState() => _ClassNotFoundState();
}

class _ClassNotFoundState extends State<ClassNotFound> {
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
                    "Kelas tidak ditemukan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Image.asset('assets/im')
                  SvgPicture.asset(
                    'assets/images/xl-close-square.svg',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 275,
                    child: Text(
                      "Pastikan anda berada pada jangkauan kelas atau ruangan!",
                      textAlign: TextAlign.center,
                      style: cInter.copyWith(
                        fontSize: 16.0,
                        height: 1.5,
                        color: cSubText,
                      ),
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
                        color: cSubText,
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
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, "/home"),
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
