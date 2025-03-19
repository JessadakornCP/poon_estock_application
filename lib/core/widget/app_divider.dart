import 'package:flutter/material.dart';

import '../../config/config.dart';

class AppDividers {
  static Divider dividerHorizon(BuildContext context, {Color? color}) {
    return Divider(
      color: color ?? AppColors.instance.grey,
    );
  }

  static VerticalDivider dividerVertical(BuildContext context, {Color? color}) {
    return VerticalDivider(
      color: color ?? AppColors.instance.grey,
    );
  }
}
