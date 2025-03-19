import 'dart:io';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/utility/app_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import 'app_button.dart';
import 'photo_view.dart';

class AppImageView {
  static Widget imageIcon(
    BuildContext context, {
    required String name,
    Color? color,
    double? size,
  }) {
    return ImageIcon(
      AssetImage(name),
      size: size ?? context.iconSizeLow,
      color: color ?? AppColors.instance.black,
    );
  }

  static Widget imageAsset(
    BuildContext context, {
    required String name,
    double? height,
    double? width,
    double? size,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Image.asset(
      name,
      fit: fit,
      alignment: alignment,
      height: size ?? height,
      width: size ?? width,
      errorBuilder:
          (context, error, stackTrace) =>
              _errorImage(height: height, width: width),
    );
  }

  static Widget imageFile(
    BuildContext context, {
    required String name,
    double? height,
    double? width,
    BoxFit? fit,
    bool onClick = true,
    double? aspectRatio,
    GlobalKey? key,
    void Function()? onTapRemove,
  }) {
    return AspectRatio(
      key: key,
      aspectRatio: aspectRatio ?? 16 / 9,
      child: AppButton.click(
        context,
        onTap:
            onClick
                ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoView(namePath: name),
                    ),
                  );
                }
                : null,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.file(
              File(name),
              fit: fit,
              height: height,
              width: width ?? context.width,
              errorBuilder:
                  (context, error, stackTrace) =>
                      _errorImage(height: height, width: width),
            ),
            if (onTapRemove != null)
              Positioned(
                top: 8,
                right: 8,
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppButton.click(
                    context,
                    onTap:
                        () => AppAlertDialog.remove(
                          context,
                          onPressedSubmit: () {
                            onTapRemove();
                          },
                        ),
                    child: Container(
                      child: imageIcon(
                        context,
                        name: ImageConstants.instance.remove,
                        color: AppColors.instance.white,
                        size: context.iconSizeHigh,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget imageNetwork(
    BuildContext context, {
    required String? name,
    double? height,
    double? width,
    BoxFit? fit,
    void Function()? onTapRemove,
    bool onClick = true,
    double? aspectRatio,
    GlobalKey? key,
  }) {
    return AspectRatio(
      key: key,
      aspectRatio: aspectRatio ?? 16 / 9,
      child: AppButton.click(
        context,
        onTap:
            (onClick && name != null)
                ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PhotoView(url: true, namePath: name),
                    ),
                  );
                }
                : null,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.network(
                name ?? '',
                fit: fit,
                height: height,
                width: width ?? context.width,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return _lodingImage(height: height, width: width);
                },
                errorBuilder:
                    (context, error, stackTrace) =>
                        _errorImage(height: height, width: width),
              ),
              if (onTapRemove != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AppButton.click(
                      context,
                      onTap:
                          () => AppAlertDialog.remove(
                            context,
                            onPressedSubmit: () {
                              onTapRemove();
                            },
                          ),
                      child: Container(
                        child: imageIcon(
                          context,
                          name: ImageConstants.instance.remove,
                          color: AppColors.instance.white,
                          size: context.iconSizeHigh,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _errorImage({required double? height, required double? width}) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const Center(child: Icon(Icons.error)),
      ),
    );
  }

  static Widget _lodingImage({
    required double? height,
    required double? width,
  }) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}
