import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFF89255);
MaterialColor kPrimarySwatchColor = MaterialColor(
  kPrimaryColor.value,
  <int, Color>{
    50: const Color(0xffFFF5EE),
    100: const Color(0xfffeece2),
    200: const Color(0xfffcd3ba),
    300: const Color(0xffFFC09A),
    400: const Color(0xFFFFA69E).withOpacity(0.2),
    500: kPrimaryColor,
    600: const Color(0xffba4a08),
    700: const Color(0xff933b06),
    800: const Color(0xff6c2b04),
    900: const Color(0xff451b03),
    1000: const Color(0xFF180a01),
  },
);

Color kWhiteColor = const Color(0xFFFFFFFF);
Color kGreenColor = const Color(0xFF4E937A);
Color kSkyBlueColor = const Color(0xFF93E1D8);
Color kLightSkyBlueColor = const Color(0xFFB8F0E8);
Color kRedColor = const Color(0xFFFF0000);
Color kGreyColor = Colors.grey[300]!;
Color kLightGreyColor = Colors.grey[50]!;
Color kDarkGreyColor = const Color(0xFF495867);
Color kTextColor = const Color(0xFF909090);
Color kBlackColor = const Color(0xFF000000);
Color kTransparentColor = Colors.transparent;
