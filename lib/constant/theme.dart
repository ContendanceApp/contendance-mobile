import 'package:flutter/material.dart';

// Colors
Color colorWhite = const Color(0xFFFFFFFF).withOpacity(0.9);
Color colorSubWhite = const Color(0xFFFFFFFF).withOpacity(0.75);
Color colorPrimaryBlue = const Color(0xFF145AE3);
Color colorSecondaryBlue = const Color(0xFF15AEEF);
Color colorPrimaryBlack = const Color(0xFF333333);
Color colorSubText = const Color(0xFF64749F);
Color colorDanger = const Color(0xFFE3145F);

LinearGradient colorGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    colorSecondaryBlue,
    colorPrimaryBlue,
  ],
);

// Paddings
const double paddingBase = 16.0;
const double paddingLg = 24.0;
const double paddingXl = 32.0;

// Border Radius
const double roundedBase = 20.0;

// Fonts
TextStyle fontInter = const TextStyle(fontFamily: "Inter");

// Font Weights
FontWeight fwLight = FontWeight.w300;
FontWeight fwRegular = FontWeight.w400;
FontWeight fwMedium = FontWeight.w500;
FontWeight fwSemiBold = FontWeight.w600;
FontWeight fwBold = FontWeight.w700;
FontWeight fwExtrafwBold = FontWeight.w800;
