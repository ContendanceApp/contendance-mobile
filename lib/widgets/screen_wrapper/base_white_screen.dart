import 'package:flutter/material.dart';

import 'package:contendance_app/constant/theme.dart';

class BaseWhiteScreen extends StatelessWidget {
  const BaseWhiteScreen({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacementNamed(context, "/home");
        //   },
        //   icon: const Icon(IconlyLight.arrow_left),
        //   color: Colors.black87,
        //   iconSize: 24,
        // ),
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
      body: body,
    );
  }
}
