import 'package:flutter/material.dart';

import '../../config/config.dart';
import 'formatters.dart';

class AppSnackBar {
  static void success(
    BuildContext context, {
    required String? text,
    int seconds = 4,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        emptyToDash(text),
        style: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(
              color: AppColors.instance.white,
            ),
      ),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: AppColors.instance.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    ));
  }

  static void error(
    BuildContext context, {
    required String? text,
    int seconds = 4,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Text(
          emptyToDash(text),
          style: AppTextStyle(
            context,
          ).kBodyDefault.copyWith(
                color: AppColors.instance.white,
              ),
        ),
      ),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: AppColors.instance.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    ));
  }
}
