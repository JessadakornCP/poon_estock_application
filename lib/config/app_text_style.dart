import 'package:flutter/material.dart';

import '../core/extension/extension.dart';
import 'app_colors.dart';

class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);

  DeviceScreen get deviceScreen => context.screenSize();

  static const double rem = 16;

/*---HeadLine---*/
  TextStyle get kHeadline1 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 96 : 96 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kHeadline2 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 60 : 60 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kHeadline3 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 48 : 48 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kHeadline4 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 34 : 34 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kHeadline5 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 24 : 24 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kHeadline6 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 20 : 20 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kSubTitle1 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 16 : 16 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kSubTitle2 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 14 : 14 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kBody1 => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 16 : 16 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kBodyDefault => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 14 : 14 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kSubBody => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 12 : 12 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kButton => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 14 : 14 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kCaption => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 12 : 12 / rem,
        color: AppColors.instance.black,
      );

  TextStyle get kOverline => TextStyle(
        fontSize: deviceScreen == DeviceScreen.mobile ? 10 : 10 / rem,
        color: AppColors.instance.black,
      );
}
