import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import '../../../config/config.dart';
import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/widget/app_button.dart';
import '../../../core/widget/app_widget.dart';
import '../../../core/widget/widgets.dart';
import '../view_model/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  final bool popScreen;
  const SplashScreen({super.key, this.popScreen = false});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: SplashViewModel(context: context),
      onInitViewModel:
          (viewmodel) =>
              viewmodel.onInitViewModel(context, popScreen: popScreen),
      builder: (context, viewmodel, child) {
        return BuildTemplateMain(
          showAppbar: false,
          showImageBackground: false,
          child: _buildContent(context, viewmodel),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, SplashViewModel viewmodel) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: AppImageView.imageAsset(
            context,
            name: ImageConstants.instance.eservice,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: viewmodel.loadingMain,
                child: Column(
                  children: [
                    AppLoading.bottomPage(context),
                    Text(
                      'กำลังโหลดข้อมูล',
                      style: AppTextStyle(context).kBodyDefault.copyWith(
                        color: AppColors.instance.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    context.emptySizedHeightBoxLow,
                  ],
                ),
              ),
              Visibility(
                visible: viewmodel.msgError != null,
                child: Column(
                  children: [
                    Text(viewmodel.msgError ?? ''),
                    context.emptySizedHeightBoxLow,
                    AppButton.submit(
                      context,
                      child: Text(
                        'รีเฟรช',
                        style: AppTextStyle(context).kBodyDefault.copyWith(
                          color: AppColors.instance.white,
                        ),
                      ),
                      onPressed: () {
                        viewmodel.onRefresh(context, popScreen: popScreen);
                      },
                    ),
                    context.emptySizedHeightBoxLow,
                  ],
                ),
              ),
              AppWidget.buildAppVersion(context),
              context.emptySizedHeightBoxLow,
            ],
          ),
        ),
      ],
    );
  }
}
