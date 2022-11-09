import 'package:contendance_app/Modules/about_app/controllers/about_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/theme.dart';
import '../../../widgets/screen_wrapper/stack_screen.dart';

class AboutApp extends StatelessWidget {
  final AboutAppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Tentang Aplikasi",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Versi",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "4.1.2",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Developed by",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "A4 WPPL PENS 2022",
            textAlign: TextAlign.justify,
            style: fontInter.copyWith(
              fontWeight: fwRegular,
              fontSize: 16,
              color: colorSubText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
