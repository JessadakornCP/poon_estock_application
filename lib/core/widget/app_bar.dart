import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../init/navigation/navigation.dart';
import 'app_button.dart';

class AppBars {
  static AppBar basic(
    BuildContext context, {
    Widget? leading,
    EdgeInsetsGeometry? paddingAppBar,
    void Function()? onTapLeading,
    Color? backgroundColor,
    Color? surfaceTintColor,
    bool automaticallyImplyLeading = true,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: surfaceTintColor ?? Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // statusBarColor: backgroundColor ?? Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      title: SizedBox(
        height: kToolbarHeight,
        width: context.width,
        child: Padding(
          padding:
              paddingAppBar ?? (EdgeInsets.only(right: context.paddingScreen)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              automaticallyImplyLeading
                  ? Container(
                    padding: EdgeInsets.only(
                      left: context.normalValue,
                      right: context.normalValue,
                    ),
                    height: double.infinity,
                    child: AppButton.click(
                      context,
                      onTap: onTapLeading ?? () => AppNav.pop(context),
                      child: leading ?? Container(),
                    ),
                  )
                  : Container(),
            ],
          ),
        ),
      ),
      titleSpacing: 0,
    );
  }
}
