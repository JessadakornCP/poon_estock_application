import 'package:flutter/cupertino.dart';
import 'package:poon_estock_application/config/app_colors.dart';
import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/extension/extension.dart';

class AppLoading {
  static Widget basic(BuildContext context) {
    return SafeArea(
      child: Container(
        width: context.width,
        height: context.height,
        color: AppColors.instance.black.withValues(alpha: 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [activityIndicator(context)],
        ),
      ),
    );
  }

  static Widget main(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Padding(
        padding: context.paddingLowVertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [activityIndicator(context)],
        ),
      ),
    );
  }

  static Widget page(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        color: AppColors.instance.black.withValues(alpha: 0.1),
        width: context.width,
        height: context.height,
        child: Padding(
          padding: context.paddingLowVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [activityIndicator(context)],
          ),
        ),
      ),
    );
  }

  static Widget bottomPage(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [activityIndicator(context)],
      ),
    );
  }

  static Widget defaults(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [activityIndicator(context)],
      ),
    );
  }

  static Widget activityIndicator(BuildContext context) {
    return CupertinoActivityIndicator(color: AppColors.instance.primary);
  }
}
