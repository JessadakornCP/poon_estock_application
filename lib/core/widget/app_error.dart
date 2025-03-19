import 'package:flutter/material.dart';
import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/utility/formatters.dart';

import 'app_button.dart';

class AppError extends StatelessWidget {
  final String? text;
  final Future<void> Function() onRefresh;
  final bool fullScreen;
  const AppError({
    super.key,
    required this.text,
    required this.onRefresh,
    this.fullScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return fullScreen
        ? SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: SizedBox(
              width: context.width,
              height:
                  context.height -
                  ((kToolbarHeight + context.defaultValue) * 4),
              child: _buildBody(context, text: text, onRefresh: onRefresh),
            ),
          ),
        )
        : _buildBody(context, text: text, onRefresh: onRefresh);
  }

  Widget _buildBody(
    BuildContext context, {
    required String? text,
    required void Function()? onRefresh,
  }) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.emptySizedHeightBoxLow3x,
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.instance.grey),
                  borderRadius: BorderRadius.circular(context.defaultValue),
                ),
                child: AppButton.click(
                  context,
                  onTap: onRefresh,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ' รีเฟรช',
                        style: AppTextStyle(context).kBodyDefault.copyWith(),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.refresh,
                        size: context.iconSizeButton,
                        color: AppColors.instance.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: context.paddingNormalVertical,
                child: Text(
                  emptyToDash(text),
                  textAlign: TextAlign.center,
                  style: AppTextStyle(context).kBodyDefault,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
