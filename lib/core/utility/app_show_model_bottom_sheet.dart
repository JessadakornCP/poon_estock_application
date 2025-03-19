import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../config/config.dart';
import '../init/navigation/navigation.dart';
import '../model/local/file_with_path/file_path_model.dart';
import '../widget/app_button.dart';
import '../widget/app_divider.dart';

class AppShowModelBottomSheet {
  static Future<void> selectPhoto(
    BuildContext context, {
    Function()? onPressCamera,
    Function()? onPressGallery,
    required void Function(FilePathModel result) result,
    required ValueChanged<bool> loading,
  }) async {
    void onPressFucn(ImageSource source) async {
      final provider = context.read<GlobalProvider>();
      loading(true);
      String? filePath = await provider.getFilePath(source: source);
      if (filePath == null) {
        loading(false);
        return;
      }
      result(FilePathModel(filePath: filePath));
      loading(false);
    }

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: context.normalValue,
                  left: context.paddingScreen,
                  right: context.paddingScreen,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: context.lowBorderRadius,
                ),
                padding: context.paddingLowVertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: context.paddingLowVertical,
                      child: Text(
                        'เลือกรูปภาพ',
                        style: AppTextStyle(
                          context,
                        ).kCaption.copyWith(color: AppColors.instance.grey),
                      ),
                    ),
                    AppDividers.dividerHorizon(
                      context,
                      color: AppColors.instance.grey.withValues(alpha: 0.1),
                    ),
                    AppButton.click(
                      context,
                      onTap: () async {
                        AppNav.pop(context);
                        onPressFucn(ImageSource.camera);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: context.paddingLowVertical,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ถ่ายรูป',
                              style: AppTextStyle(context).kBodyDefault,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppDividers.dividerHorizon(
                      context,
                      color: AppColors.instance.grey.withValues(alpha: 0.1),
                    ),
                    AppButton.click(
                      context,
                      onTap: () {
                        AppNav.pop(context);
                        onPressFucn(ImageSource.gallery);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: context.paddingLowVertical,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'เลือกจากแกลลอรี่...',
                              style: AppTextStyle(context).kBodyDefault,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: context.normalValue,
                  left: context.paddingScreen,
                  right: context.paddingScreen,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: context.lowBorderRadius,
                ),
                child: AppButton.cancel(
                  context,
                  text: 'ยกเลิก',
                  style: AppTextStyle(
                    context,
                  ).kBodyDefault.copyWith(color: AppColors.instance.primary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
