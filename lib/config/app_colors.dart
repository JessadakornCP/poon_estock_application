import 'package:flutter/material.dart';

class AppColors {
  AppColors._init();
  static final AppColors _instance = AppColors._init();
  static AppColors get instance => _instance;

  Color get primary => const Color(0xFFEB726E);
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);

  Color get grey => const Color(0xFF808080);
  Color get nobel => const Color(0xFFB0B0B0);
  Color get gainsBoro => const Color(0xFFD9D9D9);
  Color get grayAlabaster => const Color(0xFFFAFAFA);
  Color get platinum => const Color(0xFFE7E7E7);
  Color get softPeach => const Color(0xFFEEEDF0);
  Color get iron => const Color(0xFFD6D6D6);
  Color get milkWhite => const Color(0xFFFCFCFD);

  Color get green => const Color(0xFF35B288);
  Color get mediumSeaGreen => const Color(0xFF31B671);

  Color get red => const Color(0xFFFE3326);
  Color get disable => const Color(0xFFE0E6F1);
  Color get merlot => const Color(0xFF7F1F1F);

  Color get orange => const Color(0xFFF57C00);
  Color get salmonRose => const Color(0xFFFABC3F);
  Color get darkOrange => const Color(0xFFF69134);
  Color get brightSun => const Color(0xFFFFCC40);

  Color get steelBlue => const Color(0xFF4682B4);
  Color get lightskyblue => const Color(0xFF83B3F1);

  Color get blush => const Color(0xFFF49F99);
  Color get coralPink => const Color(0xFFF18881);
  Color get vanilla => const Color(0xFFF0D7E2);
  Color get soapstone => const Color(0xFFFFFBFB);
  Color get brandyRose => const Color(0xFFC28787);
  Color get mistyrose => const Color(0xFFFCE6E4);
  Color get persianRed => const Color(0xFFD13B31);
  Color get mistyRose => const Color(0xFFFBE2E2);
}
