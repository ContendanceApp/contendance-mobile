import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button.dart';
import '../constant/theme.dart';

class SuccessReschedule extends StatelessWidget {
  const SuccessReschedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        minimum: const EdgeInsets.all(paddingBase),
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
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
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
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
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
                              style: fontInter.copyWith(
                                fontSize: 14,
                                color: colorSubText,
                              ),
                            ),
                          ),
                          Text(
                            "Ruangan C-201",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: fwBold,
                              color: colorPrimaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Perubahan Jadwal ",
                            style: fontInter.copyWith(
                              fontSize: 14,
                              color: colorSubText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Workshop Pemrograman Perangkat Lunak",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: fwSemifwBold,
                              color: colorPrimaryBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "07:00 - 11:00",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: fwSemifwBold,
                              color: colorPrimaryBlack,
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
                              fontWeight: fwMedium,
                              color: colorPrimaryBlack,
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
