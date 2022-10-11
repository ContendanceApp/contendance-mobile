import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../constant/theme.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashController());
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: colorGradient,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              "assets/images/logo-white.svg",
              height: 175,
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Image.asset(
                    'assets/images/dev-by.png',
                    height: 30,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
