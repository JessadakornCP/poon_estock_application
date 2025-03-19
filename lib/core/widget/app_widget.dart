import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/widget/app_button.dart';
import 'package:poon_estock_application/core/widget/widgets.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../main.dart';
import '../init/constants/image/image_constants.dart';
import '../model/local/file_with_path/file_path_model.dart';
import '../utility/app_show_model_bottom_sheet.dart';

class AppWidget {
  static Widget textDataEmpty(
    BuildContext context, {
    String? text,
    TextStyle? style,
  }) {
    return Text(
      text ?? 'ไม่มีข้อมูล',
      style:
          style ??
          AppTextStyle(
            context,
          ).kBodyDefault.copyWith(color: AppColors.instance.grey),
      textAlign: TextAlign.center,
    );
  }

  static Widget buildAppVersion(BuildContext context) {
    return appVersion == "0.0.0" && versionBuild == "0"
        ? const SizedBox()
        : Text(
          'version : $appVersion ( $versionBuild )',
          style: AppTextStyle(
            context,
          ).kSubBody.copyWith(color: AppColors.instance.grey),
        );
  }

  static Widget buildUploadImageSingle(
    BuildContext context, {
    required String msgTitle,
    required FilePathModel? filePathModel,
    required Function(FilePathModel? filePathModel) result,
    required ValueChanged<bool> loading,
  }) {
    String? filePath = filePathModel?.filePath;
    String? fileNetwork = filePathModel?.fileNetwork;
    bool linkURL = filePathModel?.isURL ?? false;
    return Column(
      children: [
        Visibility(
          visible: filePathModel == null,
          child: AppButton.click(
            context,
            onTap: () {
              AppShowModelBottomSheet.selectPhoto(
                context,
                result: result,
                loading: loading,
              );
            },
            child: AppDottedBorder.build(
              context,
              child: Container(
                width: context.width,
                padding: EdgeInsets.all(context.container),
                child: Column(
                  children: [
                    AppImageView.imageAsset(
                      context,
                      name: ImageConstants.instance.upload,
                      size: 52,
                    ),
                    context.emptySizedHeightBoxLow,
                    Text(
                      'กดเพื่ออัปโหลดรูปภาพ',
                      style: AppTextStyle(context).kBodyDefault.copyWith(
                        color: AppColors.instance.steelBlue,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    Text(
                      'รองรับ: JPG, PNG, PDF',
                      style: AppTextStyle(context).kBodyDefault.copyWith(
                        color: AppColors.instance.lightskyblue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            linkURL
                ? fileNetwork != null
                    ? AppImageView.imageNetwork(
                      context,
                      name: fileNetwork,
                      fit: BoxFit.cover,
                      onTapRemove: () {
                        result(null);
                      },
                    )
                    : const SizedBox()
                : filePath != null
                ? AppImageView.imageFile(
                  context,
                  name: filePath,
                  fit: BoxFit.cover,
                  onTapRemove: () {
                    result(null);
                  },
                )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  static Widget buildUploadImageSingleProduct(
    BuildContext context, {
    required String msgTitle,
    required FilePathModel? filePathModel,
    required Function(FilePathModel? filePathModel) result,
    required ValueChanged<bool> loading,
  }) {
    String? filePath = filePathModel?.filePath;
    String? fileNetwork = filePathModel?.fileNetwork;
    bool linkURL = filePathModel?.isURL ?? false;
    return Column(
      children: [
        Visibility(
          visible: filePathModel == null,
          child: AppButton.click(
            context,
            onTap: () {
              AppShowModelBottomSheet.selectPhoto(
                context,
                result: result,
                loading: loading,
              );
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                AppImageView.imageAsset(
                  context,
                  name: ImageConstants.instance.noImageAvailable,
                  size: 52,
                ),
                Transform.translate(
                  offset: const Offset(5, 5),
                  child: AppImageView.imageAsset(
                    context,
                    name: ImageConstants.instance.add1,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            linkURL
                ? fileNetwork != null
                    ? AppImageView.imageNetwork(
                      context,
                      name: fileNetwork,
                      fit: BoxFit.cover,
                      onTapRemove: () {
                        result(null);
                      },
                    )
                    : const SizedBox()
                : filePath != null
                ? AppImageView.imageFile(
                  context,
                  name: filePath,
                  fit: BoxFit.cover,
                  onTapRemove: () {
                    result(null);
                  },
                )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  static Widget buildUploadImage(
    BuildContext context, {
    required Function(FilePathModel filePathModel) result,
    required ValueChanged<bool> loading,
    List<FilePathModel> imageList = const [],
    bool addImage = false,
    GlobalKey? uploadImageKey,
    required void Function(int index) onTapRemove,
  }) {
    void onPressFucn(FilePathModel filePathModel) {
      filePathModel.key = GlobalKey<State<StatefulWidget>>();
      result(filePathModel);
    }

    return Column(
      children: [
        Visibility(
          visible: imageList.isEmpty,
          child: AppButton.click(
            context,
            onTap: () async {
              await AppShowModelBottomSheet.selectPhoto(
                context,
                result: onPressFucn,
                loading: loading,
              );
            },
            child: AppDottedBorder.build(
              context,
              child: Container(
                width: context.width,
                padding: EdgeInsets.all(context.container),
                child: Column(
                  children: [
                    AppImageView.imageAsset(
                      context,
                      name: ImageConstants.instance.upload,
                      size: 52,
                    ),
                    context.emptySizedHeightBoxLow,
                    Text(
                      'กดเพื่ออัปโหลดรูปภาพ',
                      style: AppTextStyle(context).kBodyDefault.copyWith(
                        color: AppColors.instance.steelBlue,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    Text(
                      'รองรับ: JPG, PNG, PDF',
                      style: AppTextStyle(context).kBodyDefault.copyWith(
                        color: AppColors.instance.lightskyblue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ...List.generate(imageList.length, (index) {
          FilePathModel? data = imageList[index];
          String filePath = data.filePath ?? '';
          String fileNetwork = data.fileNetwork ?? '';
          bool linkURL = data.isURL;
          final key = data.key;
          return Padding(
            padding: EdgeInsets.only(bottom: context.lowValue),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.border12),
              child: switch (linkURL) {
                true => AppImageView.imageNetwork(
                  context,
                  name: fileNetwork,
                  key: key,
                  fit: BoxFit.cover,
                  onTapRemove: () => onTapRemove(index),
                ),
                false => AppImageView.imageFile(
                  context,
                  name: filePath,
                  key: key,
                  fit: BoxFit.cover,
                  onTapRemove: () => onTapRemove(index),
                ),
              },
            ),
          );
        }),
        Visibility(
          visible: addImage,
          child: Padding(
            padding: context.onlyTopPaddingLow,
            child: AppButton.click(
              context,
              onTap: () {
                AppShowModelBottomSheet.selectPhoto(
                  context,
                  result: onPressFucn,
                  loading: loading,
                );
              },
              child: AppDottedBorder.build(
                context,
                child: SizedBox(
                  width: context.width,
                  child: Column(
                    children: [
                      context.emptySizedHeightBoxLow,
                      Icon(
                        Icons.add,
                        size: 40,
                        color: AppColors.instance.steelBlue,
                      ),
                      context.emptySizedHeightBoxLow,
                      Text(
                        'เพิ่มรูปภาพ',
                        style: AppTextStyle(context).kBodyDefault.copyWith(
                          color: AppColors.instance.steelBlue,
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
