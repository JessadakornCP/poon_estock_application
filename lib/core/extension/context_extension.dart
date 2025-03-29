import 'dart:math';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'extension.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  DeviceScreen get _screenSize => screenSize();
  bool get _isMobile => _screenSize == DeviceScreen.mobile;
  bool get _isTablet => _screenSize == DeviceScreen.tablet;

  //   double get screenHValue =>
  //     h *
  //     (_isMobile
  //         ? 0.015
  //         : _isTablet
  //             ? 0.015
  //             : 0.015);

  // double get screenWValue =>
  //     w *
  //     (_isMobile
  //         ? 0.015
  //         : _isTablet
  //             ? 0.015
  //             : 0.015);

  double get lowValue => height * 0.01;
  double get low3xValue => height * 0.03;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
  double get veryHighValue => height * 0.2;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;

  double get iconSizeLow => 12;
  double get iconSizeNormal => 24;
  double get iconSizeHigh => 36;
  double get iconSizeVeryHigh => 48;

  double get iconSizeTextFormField => 24;

  double get iconSizeButton => 24;

  double get iconSizeEdit => 16;

  double get iconSizeDelete => 16;

  double get iconLoading => 12;

  double get iconSizeArrowDatePicker => 36;

  double get sizeProduct => 36;

  double get paddingScreen => height * 0.03;

  double get drawer => width * 0.5;

  double get container => 16;

  double get checkBox => 4;

  double get tabBar => 4;

  double get defaultValue => 4;

  double get alertDialog => 4;

  double get border4 => 4;

  double get border8 => 8;

  double get border12 => 12;

  double get border16 => 16;

  double get paddingTable => 8;

  double get borderBackground => 70;

  double get paddingTextFormField => 12;

  double get borderTextFormField => 8;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingAllScreen => EdgeInsets.all(paddingScreen);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingLow3x => EdgeInsets.all(low3xValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(veryHighValue);

  EdgeInsets get paddingContent =>
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
}

extension PaddingExtensionSymetric on BuildContext {
  // EdgeInsets get paddingScreen =>
  //     EdgeInsets.symmetric(horizontal: width * 0.04);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingLow3xVertical =>
      EdgeInsets.symmetric(vertical: low3xValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: veryHighValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: veryHighValue);

  EdgeInsets get paddingScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreen);

  EdgeInsets get onlyLeftPaddingLow => EdgeInsets.only(left: lowValue);
  EdgeInsets get onlyLeftPaddingLow3x => EdgeInsets.only(left: low3xValue);
  EdgeInsets get onlyLeftPaddingNormal => EdgeInsets.only(left: normalValue);
  EdgeInsets get onlyLeftPaddingMedium => EdgeInsets.only(left: mediumValue);
  EdgeInsets get onlyLeftPaddingHigh => EdgeInsets.only(left: highValue);

  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowValue);
  EdgeInsets get onlyRightPaddingLow3x => EdgeInsets.only(right: low3xValue);
  EdgeInsets get onlyRightPaddingNormal => EdgeInsets.only(right: normalValue);
  EdgeInsets get onlyRightPaddingMedium => EdgeInsets.only(right: mediumValue);
  EdgeInsets get onlyRightPaddingHigh => EdgeInsets.only(right: highValue);

  EdgeInsets get onlyBottomPaddingLow => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get onlyBottomPaddingLow3x => EdgeInsets.only(bottom: low3xValue);
  EdgeInsets get onlyBottomPaddingNormal =>
      EdgeInsets.only(bottom: normalValue);
  EdgeInsets get onlyBottomPaddingMedium =>
      EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get onlyBottomPaddingHigh => EdgeInsets.only(bottom: highValue);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get onlyTopPaddingLow3x => EdgeInsets.only(top: low3xValue);
  EdgeInsets get onlyTopPaddingNormal => EdgeInsets.only(top: normalValue);
  EdgeInsets get onlyTopPaddingMedium => EdgeInsets.only(top: mediumValue);
  EdgeInsets get onlyTopPaddingHigh => EdgeInsets.only(top: highValue);
}

extension SizedBoxExtension on BuildContext {
  Widget get emptySizedWidthBoxLow => const SpaceSizedWidthBox(width: 0.01);
  Widget get emptySizedWidthBoxLow3x => const SpaceSizedWidthBox(width: 0.03);
  Widget get emptySizedWidthBoxNormal => const SpaceSizedWidthBox(width: 0.05);
  Widget get emptySizedWidthBoxHigh => const SpaceSizedWidthBox(width: 0.1);

  Widget get emptySizedHeightBoxLow => const SpaceSizedHeightBox(height: 0.01);
  Widget get emptySizedHeightBoxLow3x =>
      const SpaceSizedHeightBox(height: 0.03);
  Widget get emptySizedHeightBoxNormal =>
      const SpaceSizedHeightBox(height: 0.05);
  Widget get emptySizedHeightBoxHigh => const SpaceSizedHeightBox(height: 0.1);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highRadius => Radius.circular(width * 0.1);
}

extension BorderExtension on BuildContext {
  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.1));

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)),
      );

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(normalValue)),
      );

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(mediumValue)),
      );

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)),
      );
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

const _mobile = 'mobile';
const _tablet = 'tablet';
const _laptop = 'laptop';

enum DeviceScreen { mobile, tablet, laptop }

extension DeviceScreenHelper on DeviceScreen {
  bool get isMobile => this == DeviceScreen.mobile;

  bool get isTablet => this == DeviceScreen.tablet;

  bool get isLaptop => this == DeviceScreen.laptop;
}

extension DeviceScreenText on DeviceScreen {
  String get toRawValue {
    switch (this) {
      case DeviceScreen.mobile:
        return _mobile;

      case DeviceScreen.tablet:
        return _tablet;

      case DeviceScreen.laptop:
        return _laptop;
    }
  }
}

extension BuildContextProvide on BuildContext {
  DeviceScreen screenSize() {
    var width = MediaQuery.of(this).size.width;
    if (width >= 1240) {
      return DeviceScreen.laptop;
    } else if (width >= 600) {
      return DeviceScreen.tablet;
    }
    return DeviceScreen.mobile;
  }
}
