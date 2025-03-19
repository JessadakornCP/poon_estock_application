import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class AppDottedBorder {
  static Widget build(
    BuildContext context, {
    required Widget child,
    bool disableDottedBoder = false,
  }) {
    return disableDottedBoder
        ? child
        : DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          padding: EdgeInsets.zero,
          strokeWidth: 2,
          dashPattern: const [5, 5],
          color: AppColors.instance.steelBlue,
          child: Container(
            color: AppColors.instance.white.withValues(alpha: 0.24),
            child: child,
          ),
        );
  }
}
