import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

class OpenPresence extends StatelessWidget {
  const OpenPresence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(IconlyLight.arrow_left),
          color: Colors.black87,
          iconSize: 24,
        ),
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
              top: 123,
              child: Column(
                children: [
                  const Text(
                    "Kelas Ditemukan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      'assets/images/lab-pens.jpg',
                      height: 135,
                      width: 135,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Ruangan C-102",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF145AE3),
                    ),
                  ),
                  const SizedBox(height: 57),
                ],
              ),
            ),
            Positioned(
              bottom: 274,
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
            const SizedBox(height: 4),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: cPrimaryBlue),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            primary: cPrimaryBlue,
                            textStyle: cInter.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Batal"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff15aeef),
                              Color(0xff145ae3),
                            ],
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
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
                          child: const Text(
                            "Buka Presensi",
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
