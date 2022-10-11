import 'package:contendance_app/controllers/class_not_found_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';

class ClassNotFound extends StatelessWidget {
  final controller = Get.put(ClassNotFoundController());
  ClassNotFound({Key? key}) : super(key: key);

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
                    "Kelas tidak ditemukan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: fwBold,
                      color: const Color(0xFF333333),
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
                      style: fontInter.copyWith(
                        fontSize: 16.0,
                        height: 1.5,
                        color: colorSubText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              child: Button(
                text: "OKE",
                callback: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (Route<dynamic> route) => false,
                ),
                primary: false,
                secondary: false,
                custom: true,
                backgroundColor: colorSubText,
                fontColor: colorWhite,
                borderColor: colorSubText,
                paddingX: 45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
