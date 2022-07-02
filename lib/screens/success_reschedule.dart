import 'package:contendance_app/widgets/button.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        minimum: const EdgeInsets.all(cPadding1),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text(
                    "Perubahan Jadwal Berhasil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: bold,
                      color: cPrimaryBlack,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    "assets/images/swap-class.svg",
                    width: 75,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Detail Perubahan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.0,
                      fontWeight: bold,
                      color: cPrimaryBlack,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "Perubahan Ruangan",
                              style: cInter.copyWith(
                                fontSize: 14,
                                color: cSubText,
                              ),
                            ),
                          ),
                          Text(
                            "Ruangan C-201",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: bold,
                              color: cPrimaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Perubahan Jadwal ",
                            style: cInter.copyWith(
                              fontSize: 14,
                              color: cSubText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Workshop Pemrograman Perangkat Lunak",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: semibold,
                              color: cPrimaryBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "07:00 - 11:00",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: semibold,
                              color: cPrimaryBlack,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(
                            width: 50,
                            child: Divider(
                              color: Color(0xFFF4F4F4),
                              height: 2,
                              thickness: 3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Andhik Ampuh Yunanto",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: medium,
                              color: cPrimaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Button(
                  text: "OKE!",
                  callback: () => Navigator.pop(context),
                  primary: true,
                  secondary: false),
            )
          ],
        ),
      ),
    );
  }
}
