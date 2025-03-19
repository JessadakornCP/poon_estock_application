import 'package:poon_estock_application/core/extension/extension.dart';

import '../../../config/config.dart';
import '../../../core/base/base_screen.dart';
import '../../../core/init/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation.dart';
import '../../../core/model/local/menu_model.dart';
import '../../../core/utility/formatters.dart';
import '../../../core/widget/app_button.dart';
import '../../../core/widget/widgets.dart';
import '../view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: DashboardViewModel(context: context),
      builder: (context, viewmodel, child) {
        return BuildTemplateMain(
          canPop: false,
          onPopInvokedWithResult:
              (didPop, result) => viewmodel.isExitWarning(context),
          showAppbar: false,
          paddingScreen: EdgeInsets.zero,
          child: _buildContent(context, viewmodel),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, DashboardViewModel viewmodel) {
    return Column(
      children: [
        _buildHeader(context, viewmodel),
        _buildBody(context, viewmodel),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, DashboardViewModel viewmodel) {
    final userProfile = viewmodel.userProfile;
    String fullName = emptyToDash(userProfile?.fullName);
    String? profileImg = userProfile?.profileImg;
    return Padding(
      padding: context.paddingAllScreen,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppButton.click(
                      context,
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: AppImageView.imageAsset(
                          context,
                          name:
                              profileImg ??
                              ImageConstants.instance.userProfile2,
                          size: 40,
                        ),
                      ),
                    ),
                    context.emptySizedWidthBoxLow3x,
                    Text(
                      fullName,
                      style: AppTextStyle(
                        context,
                      ).kHeadline6.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                context.emptySizedHeightBoxLow,
                Text(
                  'คุณต้องการจะแจ้งปัญหากับเราใช่หรือไม่ ? เราพร้อมยินดีบริการ!',
                  style: AppTextStyle(
                    context,
                  ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                ),
              ],
            ),
          ),
          AppImageView.imageAsset(
            context,
            name: ImageConstants.instance.notification,
            size: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, DashboardViewModel viewmodel) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.paddingScreen + 16,
                left: context.paddingScreen,
                right: context.paddingScreen,
              ),
              child: Container(
                padding: EdgeInsets.all(context.container),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ผลิตภัณฑ์ของฉัน',
                                style: AppTextStyle(context).kHeadline6
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'เพิ่มผลิตภัณฑ์และเลือกผลิตภัณฑ์ของคุณเพื่อแจ้งหรือแก้ไขปัญหา',
                                style: AppTextStyle(context).kBodyDefault
                                    .copyWith(color: AppColors.instance.grey),
                              ),
                            ],
                          ),
                        ),
                        context.emptySizedWidthBoxLow3x,
                        AppImageView.imageAsset(
                          context,
                          name: ImageConstants.instance.printInkGroup,
                          size: 100,
                        ),
                      ],
                    ),
                    context.emptySizedHeightBoxLow3x,
                    AppButton.click(
                      context,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),

                        child: Text(
                          'ผลิตภัณฑ์ของฉัน',
                          style: AppTextStyle(context).kBodyDefault.copyWith(
                            color: AppColors.instance.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.paddingScreen),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'รายการเพิ่มเติม',
                    style: AppTextStyle(context).kHeadline6,
                  ),
                  AppImageView.imageAsset(
                    context,
                    name: ImageConstants.instance.more,
                    size: context.iconSizeButton,
                  ),
                ],
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            _buildMenuList(context, viewmodel),
            context.emptySizedHeightBoxLow3x,
          ],
        ),
      ],
    );
  }

  Widget _buildMenuList(BuildContext context, DashboardViewModel viewmodel) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: viewmodel.menuList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          MenuModel menu = viewmodel.menuList[index];
          String image = menu.icon ?? '';
          String? route = emptyToNull(menu.route);
          return AppButton.click(
            context,
            onTap: () {
              if (emptyToNull(route) != null) {
                AppNav.toNamed(context, route!);
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                left: context.paddingScreen,
                right:
                    index == viewmodel.menuList.length - 1
                        ? context.paddingScreen
                        : 0,
              ),
              child: AppImageView.imageAsset(
                context,
                name: image,
                height: 160,
                width: 250,
              ),
            ),
          );
        },
      ),
    );
  }
}
