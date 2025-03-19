import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/utility/formatters.dart';
import 'package:flutter/material.dart';
import '../../config/config.dart';
import '../init/constants/image/image_constants.dart';
import '../init/navigation/route_manager.dart';
import 'app_button.dart';
import 'widgets.dart';

class BuildTemplateMain extends StatelessWidget {
  //Scaffold
  final Key? scaffoldKey;
  final Widget? drawer;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final String? imageBackground;
  final bool showImageBackground;
  final bool safeArea;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  //AppBar
  final Widget? leading;
  final EdgeInsetsGeometry? paddingAppBar;
  final void Function()? onTapLeading;
  final Color? backgroundColorAppBar;
  final Color? surfaceTintColorAppBar;
  final bool automaticallyImplyLeading;
  final Widget? widgetBottomAppBar;
  //NavBar
  final Widget? bottomNavigationBar;
  //PopSoope
  final bool canPop;
  final void Function(bool didPop, dynamic result)? onPopInvokedWithResult;
  //Other
  final EdgeInsetsGeometry? paddingScreen;
  final Widget child;
  final bool loadingMain;
  final bool loading;
  final bool loadingPage;
  final bool showAppbar;
  final String? msgError;
  final int item;
  final int totalItems;
  final void Function()? getMore;
  final Future<void> Function()? onRefresh;
  final bool scrollOnRefresh;
  final int currentPerPage;
  final int totalPages;
  final String? textTitle;
  final String? textSubTitle;
  final Widget? floatingActionButton;
  final bool autoLeading;
  final bool showAppbarBackgroundColor;
  final bool bottomRight;

  const BuildTemplateMain({
    super.key,
    //Scaffold
    this.scaffoldKey,
    this.drawer,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.imageBackground,
    this.showImageBackground = true,
    this.safeArea = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    //AppBar
    this.leading,
    this.onTapLeading,
    this.paddingAppBar,
    this.backgroundColorAppBar,
    this.surfaceTintColorAppBar,
    this.showAppbar = true,
    this.automaticallyImplyLeading = true,
    this.widgetBottomAppBar,
    //NavBar
    this.bottomNavigationBar,
    //PopSoope
    this.canPop = true,
    this.onPopInvokedWithResult,
    //Other
    this.paddingScreen,
    required this.child,
    this.loadingMain = false,
    this.loading = false,
    this.loadingPage = false,
    this.msgError,
    this.item = 0,
    this.totalItems = 0,
    this.getMore,
    this.onRefresh,
    this.scrollOnRefresh = true,
    this.currentPerPage = 1,
    this.totalPages = 1,
    this.textTitle = '',
    this.textSubTitle = '',
    this.floatingActionButton,
    this.autoLeading = true,
    this.showAppbarBackgroundColor = false,
    this.bottomRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (onPopInvokedWithResult != null) {
            onPopInvokedWithResult!(didPop, result);
          }
        }
      },
      child: Stack(
        children: [
          AppButton.click(
            context,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.instance.white,
                image:
                    showImageBackground
                        ? imageBackground == null
                            ? DecorationImage(
                              image: AssetImage(
                                ImageConstants.instance.mainBG1,
                              ),
                              fit: BoxFit.fill,
                            )
                            : DecorationImage(
                              image: AssetImage(imageBackground!),
                              fit: BoxFit.fill,
                            )
                        : null,
              ),
              child: Scaffold(
                key: scaffoldKey,
                drawer: drawer,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                backgroundColor: Colors.transparent,
                floatingActionButton: floatingActionButton,
                // appBar: showAppbar
                //     ? AppBars.basic(
                //         context,
                //         backgroundColor: backgroundColorAppBar,
                //         leading: leading,
                //         onTapLeading: onTapLeading,
                //         paddingAppBar: paddingAppBar,
                //         surfaceTintColor: surfaceTintColorAppBar,
                //       )
                //     : null,
                body: SafeArea(
                  left: safeArea ? safeAreaLeft : false,
                  right: safeArea ? safeAreaRight : false,
                  top: safeArea ? safeAreaTop : false,
                  bottom: safeArea ? safeAreaBottom : false,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Visibility(
                            visible: showAppbar,
                            child: Padding(
                              padding:
                                  showAppbarBackgroundColor
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  if (autoLeading)
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: context.paddingScreen - 8,
                                      ),
                                      child: AppButton.click(
                                        context,
                                        onTap: () => AppNav.pop(context),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),

                                          child: AppImageView.imageIcon(
                                            context,
                                            name:
                                                ImageConstants
                                                    .instance
                                                    .arrowLeft,
                                            size: context.iconSizeButton,
                                            color:
                                                showAppbarBackgroundColor
                                                    ? AppColors
                                                        .instance
                                                        .coralPink
                                                    : AppColors.instance.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Visibility(
                                          visible:
                                              emptyToNull(textTitle) != null,
                                          child: Text(
                                            nullToEmpty(textTitle),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyle(
                                              context,
                                            ).kHeadline6.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  showAppbarBackgroundColor
                                                      ? AppColors.instance.white
                                                      : null,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              emptyToNull(textSubTitle) != null,
                                          child: Text(
                                            nullToEmpty(textSubTitle),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyle(
                                              context,
                                            ).kCaption.copyWith(
                                              color:
                                                  showAppbarBackgroundColor
                                                      ? AppColors.instance.white
                                                      : AppColors.instance.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: context.paddingScreen - 8,
                                    ),
                                    child: const SizedBox(width: 52),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widgetBottomAppBar != null,
                            child: widgetBottomAppBar ?? const SizedBox(),
                          ),
                        ],
                      ),

                      Expanded(
                        child: NotificationListener(
                          onNotification: (ScrollEndNotification t) {
                            if (t.metrics.pixels > 0 && t.metrics.atEdge) {
                              if (item < totalItems ||
                                  currentPerPage < totalPages) {
                                if (!loadingPage) {
                                  if (getMore != null) {
                                    getMore!();
                                  }
                                }
                              }
                            }
                            return true;
                          },
                          child: BuildRefreshIndicator(
                            onRefresh:
                                (scrollOnRefresh && onRefresh != null)
                                    ? onRefresh!
                                    : () async {},
                            notificationPredicate:
                                (notification) =>
                                    (onRefresh == null || !scrollOnRefresh)
                                        ? false
                                        : true,
                            child: _buildBody(
                              context,
                              paddingScreen: paddingScreen,
                              loadingMain: loadingMain,
                              msgError: msgError,
                              onRefresh: onRefresh,
                              child: child,
                            ),
                          ),
                        ),
                      ),
                      if (loadingPage) AppLoading.bottomPage(context),
                    ],
                  ),
                ),
                bottomNavigationBar:
                    msgError == null ? bottomNavigationBar : null,
              ),
            ),
          ),
          if (loading) AppLoading.page(context),
        ],
      ),
    );
  }
}

Widget _buildBody(
  BuildContext context, {
  required EdgeInsetsGeometry? paddingScreen,
  required Widget? child,
  required bool loadingMain,
  required Future<void> Function()? onRefresh,
  required String? msgError,
}) {
  return Container(
    alignment: Alignment.topLeft,
    height: context.height,
    width: context.width,
    child: Container(
      padding: paddingScreen ?? context.paddingScreenHorizontal,
      child:
          loadingMain
              ? AppLoading.main(context)
              : msgError != null
              ? AppError(text: msgError, onRefresh: onRefresh ?? () async {})
              : child ?? Container(),
    ),
  );
}
