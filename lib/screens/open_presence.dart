import 'package:badges/badges.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

class OpenPresence extends StatelessWidget {
  // const OpenPresence({Key? key, required this.presence}) : super(key: key);
  const OpenPresence({Key? key}) : super(key: key);

  // final Presence presence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
          },
          icon: Icon(IconlyLight.arrow_left),
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
              Container(
                child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'assets/images/lab.jpeg',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
                  const SizedBox(height: 22),
                  Text(
                    "Ruangan C-102",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
            Positioned(
              bottom: 48,
              left: 250,
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
                            horizontal: 30, vertical: 12),
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

                      child: const Text('Buka Presensi'),

                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              right: 250,
                child: Stack(

                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                                color: const Color(0xFF145AE3),
                                width: 1.0,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]),
                      ),
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 65, vertical: 12),
                        primary: Color(0xff145AE3),
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

                      child: const Text('Batal'),

                    ),

                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

