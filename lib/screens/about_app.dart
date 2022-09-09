import '../widgets/screen_wrapper/stack_screen.dart';
import '../constant/theme.dart';

import 'package:flutter/material.dart';

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
            style: cInter.copyWith(
              fontWeight: bold,
              fontSize: 16,
              color: cPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "2.1.0",
            textAlign: TextAlign.justify,
            style: cInter.copyWith(
              fontWeight: regular,
              fontSize: 16,
              color: cSubText,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: cPadding2,
          ),
          Text(
            "Developed by",
            style: cInter.copyWith(
              fontWeight: bold,
              fontSize: 16,
              color: cPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "A4 WPPL PENS 2022",
            textAlign: TextAlign.justify,
            style: cInter.copyWith(
              fontWeight: regular,
              fontSize: 16,
              color: cSubText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
