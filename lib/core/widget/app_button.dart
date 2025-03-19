import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/init/navigation/navigation.dart';
import 'package:poon_estock_application/core/utility/formatters.dart';

class AppButton {
  static Widget submit(
    BuildContext context, {
    required Function()? onPressed,
    Decoration? decoration,
    Widget? child,
    String? text,
    Widget? widgetLeft,
    Widget? widgetRight,
    bool loading = false,
  }) {
    return GestureDetector(
      onTap:
          onPressed != null
              ? () {
                FocusManager.instance.primaryFocus?.unfocus();
                onPressed();
              }
              : null,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child:
            child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widgetLeft != null) widgetLeft,
                Expanded(
                  child: Center(
                    child: Text(
                      text ?? 'บันทึกข้อมูล',
                      style: AppTextStyle(
                        context,
                      ).kBodyDefault.copyWith(color: AppColors.instance.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (widgetRight != null) widgetRight,
                if (loading)
                  Row(
                    children: [
                      context.emptySizedWidthBoxLow3x,
                      CupertinoActivityIndicator(
                        color: AppColors.instance.white,
                        radius: context.iconLoading,
                      ),
                    ],
                  ),
              ],
            ),
      ),
    );
  }

  static Widget cancel(
    BuildContext context, {
    Function()? onPressed,
    String? text,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Widget? widget,
    bool loading = false,
    Color? backgroundColor,
    TextStyle? style,
    BorderSide side = BorderSide.none,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: AppColors.instance.grey,
        disabledForegroundColor: AppColors.instance.grey,
        foregroundColor: backgroundColor ?? AppColors.instance.white,
        surfaceTintColor: backgroundColor ?? AppColors.instance.white,
        backgroundColor: backgroundColor ?? AppColors.instance.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.defaultValue),
          side: side,
        ),
        elevation: 0,
      ),
      onPressed:
          onPressed == null
              ? () => AppNav.pop(context)
              : () {
                FocusManager.instance.primaryFocus?.unfocus();
                onPressed();
              },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          Text(
            emptyToDash(text),
            style:
                style ??
                AppTextStyle(
                  context,
                ).kBodyDefault.copyWith(color: AppColors.instance.red),
          ),
          if (widget != null)
            Row(children: [context.emptySizedWidthBoxLow3x, widget]),
          if (loading)
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                CupertinoActivityIndicator(
                  color: AppColors.instance.white,
                  radius: context.iconLoading,
                ),
              ],
            ),
        ],
      ),
    );
  }

  static Widget click(
    BuildContext context, {
    required Function()? onTap,
    Decoration? decoration,
    required Widget child,
  }) {
    return GestureDetector(
      onTap:
          onTap == null
              ? null
              : () {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap();
              },
      child: Container(decoration: decoration, child: child),
    );
  }
}
