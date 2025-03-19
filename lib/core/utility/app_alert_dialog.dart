import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/widget/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import '../init/navigation/navigation.dart';
import '../model/api_status/api_status_model.dart';
import '../model/local/file_with_path/file_path_model.dart';
import '../provider/global_provider.dart';
import '../widget/app_button.dart';
import '../widget/app_image_view.dart';
import '../widget/textformfield_widget.dart';
import 'app_validator.dart';
import 'formatters.dart';

class AppAlertDialog {
  static Future<void> reject(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    String? labelText,
    String? textValidator,
    Function()? onPressedCancel,
    required Function(String? value) onPressedSubmit,
    bool autoPop = true,
  }) async {
    final formKey = GlobalKey<FormState>();
    String? reason;
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AppButton.click(
          context,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Form(
            key: formKey,
            child: buildAlertDialog(
              context,
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'กรุณาระบุเหตุผล',
                          style: AppTextStyle(context).kBodyDefault,
                        ),
                        Text(
                          subTitle ?? 'กรุณาระบุเหตุผล',
                          style: AppTextStyle(context).kBodyDefault,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  AppImageView.imageIcon(
                    context,
                    name: ImageConstants.instance.calendar1,
                    color: AppColors.instance.red,
                    size: 36,
                  ),
                ],
              ),
              content: BuildTextFormField(
                padding: EdgeInsets.zero,
                bgColor: AppColors.instance.white,
                labelText: labelText ?? 'เหตุผลเพิ่มเติม',
                minLines: 3,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) => AppValidator.validatorText(
                      value,
                      text: textValidator ?? 'กรุณาระบุเหตุผล',
                    ),
                onChanged: (value) => reason = value,
              ),
              actions: Row(
                children: [
                  Expanded(
                    child: AppButton.cancel(
                      context,
                      text: "ยกเลิก",
                      style: AppTextStyle(context).kBodyDefault,
                      side: BorderSide(color: AppColors.instance.gainsBoro),
                      onPressed: onPressedCancel,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton.submit(
                      context,
                      text: "ตกลง",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          autoPop
                              ? AppNav.pop(
                                context,
                                result: onPressedSubmit(emptyToNull(reason)),
                              )
                              : onPressedSubmit(emptyToNull(reason));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future submit(
    BuildContext context, {
    bool barrierDismissible = false,
    String? title,
    String? subTitle,
    Function()? onPressedCancel,
    required Function()? onPressedSubmit,
    String? textCancel,
    String? textSubmit,
    bool autoPop = true,
    String? assetName,
    Color? color,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: SizedBox(
            width: context.width,
            child: Row(
              children: [
                AppImageView.imageIcon(
                  context,
                  name: assetName ?? ImageConstants.instance.checkWarning1,
                  color: color ?? AppColors.instance.salmonRose,
                  size: 36,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? 'คุณต้องการบันทึกข้อมูลนี้ ?',
                        style: AppTextStyle(context).kBodyDefault.copyWith(
                          color: color ?? AppColors.instance.salmonRose,
                        ),
                      ),
                      Text(
                        subTitle ?? 'ระบบจะทำการบันทึกการดำเนินการของคุณ',
                        style: AppTextStyle(context).kSubBody,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: Row(
            children: [
              Expanded(
                child: AppButton.cancel(
                  context,
                  text: textCancel ?? "ยกเลิก",
                  style: AppTextStyle(context).kBodyDefault,
                  side: BorderSide(color: AppColors.instance.gainsBoro),
                  onPressed: onPressedCancel,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton.submit(
                  context,
                  text: textSubmit ?? "ตกลง",
                  onPressed: () {
                    if (onPressedSubmit != null) {
                      autoPop
                          ? AppNav.pop(context, result: onPressedSubmit())
                          : onPressedSubmit();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> success(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    Function()? onPressedSubmit,
    bool autoPop = true,
    Object? autoPopResult,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: buildAlertDialog(
            context,
            title: Row(
              children: [
                AppImageView.imageIcon(
                  context,
                  name: ImageConstants.instance.success,
                  color: AppColors.instance.green,
                  size: 36,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? 'การดำเนินการของคุณสำเร็จ !',
                        style: AppTextStyle(context).kBodyDefault.copyWith(
                          color: AppColors.instance.green,
                        ),
                      ),
                      Text(
                        subTitle ?? 'ระบบทำการบันทึกการดำเนินการของคุณแล้ว',
                        style: AppTextStyle(context).kSubBody,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: AppButton.submit(
              context,
              text: "ตกลง",
              onPressed: () {
                if (autoPop) {
                  AppNav.pop(context, result: autoPopResult);
                }
                onPressedSubmit == null ? null : onPressedSubmit();
              },
            ),
          ),
        );
      },
    );
  }

  static Future<void> error(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? textError,
    void Function()? onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Row(
            children: [
              AppImageView.imageIcon(
                context,
                name: ImageConstants.instance.removeCircle,
                color: AppColors.instance.red,
                size: 36,
              ),
              const SizedBox(width: 20),
              Text(
                title ?? 'เกิดข้อผิดลพลาด !',
                style: AppTextStyle(
                  context,
                ).kBodyDefault.copyWith(color: AppColors.instance.red),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  emptyToDash(textError),
                  style: AppTextStyle(
                    context,
                  ).kSubBody.copyWith(color: AppColors.instance.grey),
                ),
              ],
            ),
          ),
          actions: AppButton.submit(
            context,
            text: "ตกลง",
            onPressed: () {
              autoPop ? AppNav.pop(context) : null;
              if (onPressedSubmit != null) {
                onPressedSubmit();
              }
            },
          ),
        );
      },
    );
  }

  static Future<void> remove(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? subTitle,
    void Function()? onPressedCancel,
    required void Function() onPressedSubmit,
    bool autoPop = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Row(
            children: [
              AppImageView.imageIcon(
                context,
                name: ImageConstants.instance.removeCircle,
                color: AppColors.instance.red,
                size: 36,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'คุณต้องการลบรายการนี้ ?',
                      style: AppTextStyle(
                        context,
                      ).kBodyDefault.copyWith(color: AppColors.instance.red),
                    ),
                    Text(
                      subTitle ?? 'กรุณากดตกลงเพื่อยืนยันการลบรายการนี้',
                      style: AppTextStyle(context).kSubBody,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: Row(
            children: [
              Expanded(
                child: AppButton.submit(
                  context,
                  text: "ตกลง",
                  onPressed: () {
                    autoPop ? AppNav.pop(context) : null;
                    onPressedSubmit();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton.cancel(
                  context,
                  text: "ยกเลิก",
                  style: AppTextStyle(context).kBodyDefault,
                  side: BorderSide(color: AppColors.instance.gainsBoro),
                  onPressed: onPressedCancel ?? () => AppNav.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> errorRes(BuildContext context, e) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Row(
            children: [
              AppImageView.imageIcon(
                context,
                name: ImageConstants.instance.removeCircle,
                color: AppColors.instance.red,
                size: 36,
              ),
              const SizedBox(width: 20),
              Text(
                "${e is Failure ? e.code : 'เกิดข้อผิดพลาด'}",
                style: AppTextStyle(
                  context,
                ).kBodyDefault.copyWith(color: AppColors.instance.red),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "${e is Failure ? e.errorResponse : emptyToDash(e.toString())}",
                  style: AppTextStyle(
                    context,
                  ).kSubBody.copyWith(color: AppColors.instance.grey),
                ),
              ],
            ),
          ),
          actions: AppButton.submit(
            context,
            text: "ตกลง",
            onPressed: () => AppNav.pop(context),
          ),
        );
      },
    );
  }

  static Future<void> selectPhotos(
    BuildContext context, {
    required String msgTitle,
    Function()? onPressCamera,
    Function()? onPressGallery,
    required void Function(FilePathModel result) result,
  }) async {
    void onPressFucn(ImageSource source) async {
      final provider = context.read<GlobalProvider>();
      String? filePath = await provider.getFilePath(source: source);
      if (filePath != null) {
        result(FilePathModel(filePath: filePath));
      }
    }

    await showDialog(
      context: context,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: context.lowValue,
                  right: context.lowValue,
                  left: context.lowValue,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    msgTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle(context).kSubTitle2,
                  ),
                ),
              ),
              AppDividers.dividerHorizon(context),
            ],
          ),
          content: SizedBox.fromSize(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.border4),
                        ),
                      ),
                    ),
                    onPressed:
                        onPressCamera ??
                        () async {
                          AppNav.pop(context);
                          onPressFucn(ImageSource.camera);
                        },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // buildImageIconIcons(
                        //   txtIcon: EworkIcon.iconCamera,
                        //   color: EworkColor(context).canvasColor,
                        // ),
                        Text(
                          "ถ่ายรูป",
                          textAlign: TextAlign.center,
                          style: AppTextStyle(context).kBodyDefault,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.border4),
                        ),
                      ),
                    ),
                    onPressed:
                        onPressGallery ??
                        () {
                          AppNav.pop(context);
                          onPressFucn(ImageSource.gallery);
                        },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // buildImageIconIcons(
                        //   txtIcon: EworkIcon.iconGalley,
                        //   color: EworkColor(context).canvasColor,
                        // ),
                        Text(
                          "แกลเลอรี่",
                          textAlign: TextAlign.center,
                          style: AppTextStyle(context).kBodyDefault,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> message(
    BuildContext context, {
    Widget? title,
    Widget? content,
    Widget? actions,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return buildAlertDialog(
          context,
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }
}

Widget buildAlertDialog(
  BuildContext context, {
  EdgeInsetsGeometry? titlePadding,
  Widget? title,
  EdgeInsetsGeometry? contentPadding,
  Widget? content,
  EdgeInsetsGeometry? actionsPadding,
  Widget? actions,
  BorderRadiusGeometry? borderRadius,
}) {
  double width = context.width;
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(context.defaultValue),
      side: BorderSide(color: AppColors.instance.white),
    ),
    surfaceTintColor: AppColors.instance.grayAlabaster,
    backgroundColor: AppColors.instance.grayAlabaster,
    insetPadding: const EdgeInsets.all(20),
    titlePadding:
        titlePadding ??
        (content != null ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero),
    title: Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        borderRadius:
            borderRadius ??
            BorderRadius.vertical(top: Radius.circular(context.defaultValue)),
        border: Border(bottom: BorderSide(color: AppColors.instance.gainsBoro)),
      ),
      child: title,
    ),
    contentPadding:
        contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
    content: content != null ? SizedBox(width: width, child: content) : null,
    actionsPadding:
        actionsPadding ??
        (content == null
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8)
            : const EdgeInsets.all(20)),
    actions: [SizedBox(width: width, child: actions)],
  );
}
