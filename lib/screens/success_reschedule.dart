import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SuccessReschedule extends StatelessWidget {
  const SuccessReschedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: cInter.copyWith(
            color: Colors.blueAccent,
            fontWeight: bold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 123,
              child: Column(
                children: const [
                  Text(
                    "Perubahan Jadwal Berhasil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 20),
                  Icon(IconlyLight.swap, size: 90, color: Colors.blue),
                  SizedBox(height: 16),
                  Text(
                    "Detail Perubahan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: 450,
                height: 230,
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Perubahan Ruangan",
                        textAlign: TextAlign.left,
                        style: cInter.copyWith(
                          fontSize: 16,
                          color: cSubText,
                        ),
                      ),
                    ),
                    const Text(
                      "Ruangan C-201",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF145AE3),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Perubahan Jadwal ",
                      textAlign: TextAlign.left,
                      style: cInter.copyWith(
                        fontSize: 16,
                        color: cSubText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Workshop Pemrograman Perangkat Lunak",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF145AE3),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "07:00 - 11:00",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(
                      width: 50,
                      child: Divider(
                        color: Color(0xFFF4F4F4),
                        height: 2,
                        thickness: 3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Andhik Ampuh Yunanto",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      color: const Color(0xFFF4F4F4),
                      width: 1.0,
                      style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
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
                              Color(0xff15AEEF),
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
