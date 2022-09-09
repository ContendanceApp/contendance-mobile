import 'package:flutter/material.dart';

import '../constant/theme.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
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
            "2.1.0",
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
