import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/init/constants/image/image_constants.dart';
import 'package:poon_estock_application/core/widget/widgets.dart';
import 'package:flutter/material.dart';
import '../init/constants/app/app_constant.dart';

class AppTitle {
  static titleAccount(
    BuildContext context, {
    required String? textTitle,
    required String? textSubTitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue),
      child: SizedBox(
        height: context.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.lowValue),
                  child: Text(
                    textTitle ?? AppConstants.IS_EMPTY,
                    style: AppTextStyle(
                      context,
                    ).kSubTitle1.copyWith(color: AppColors.instance.primary),
                  ),
                ),
                Text(
                  textSubTitle ?? AppConstants.IS_EMPTY,
                  style: AppTextStyle(
                    context,
                  ).kSubTitle2.copyWith(color: AppColors.instance.primary),
                ),
              ],
            ),
            AppImageView.imageAsset(
              context,
              name: ImageConstants.instance.eservice,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
