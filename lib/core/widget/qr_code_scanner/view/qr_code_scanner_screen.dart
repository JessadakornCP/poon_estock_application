import 'dart:io';
import 'package:poon_estock_application/core/base/base_screen.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/utility/app_snack_bar.dart';
import 'package:poon_estock_application/core/utility/app_validator.dart';
import 'package:poon_estock_application/core/widget/app_button.dart';
import 'package:poon_estock_application/core/widget/qr_code_scanner/view_model/qr_code_scanner_view_model.dart';
import 'package:poon_estock_application/core/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../init/navigation/navigation.dart';
import '../../../init/constants/image/image_constants.dart';
import '../../../utility/formatters.dart';
import '../enum/get_api_type_enum.dart';

class QRCodeScannerScreen extends StatefulWidget {
  final GetApiTypeEnum getApiTypeEnum;
  const QRCodeScannerScreen({super.key, required this.getApiTypeEnum});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  String? getCode;
  int countGetCode = 0;
  int currentIndex = 0;

  final controllerPageView = PageController(initialPage: 0);

  bool refreshBT = false;
  final formKey = GlobalKey<FormState>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.disposed;
    controllerPageView.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {
      getCode = null;
      controller?.resumeCamera();
      refreshBT = false;
      countGetCode = 0;
    });
  }

  void _onQRViewCreated(
    BuildContext context,
    QrCodeScannerViewModel viewmodel, {
    required QRViewController controller,
  }) {
    if (mounted) {
      setState(() {
        this.controller = controller;
        // controller.resumeCamera();
      });
    }

    controller.scannedDataStream.listen(
      (barcode) => setState(() {
        if (mounted) {
          this.barcode = barcode;
          controller.pauseCamera();
          getCode = barcode.code;
          if (emptyToNull(getCode) != null && countGetCode == 0) {
            // controller.stopCamera();
            // closePop(context, data: emptyToNull(getCode));
            onDetect(context, viewmodel);
            countGetCode++;
          }
        }
      }),
    );
  }

  void onDetect(
    BuildContext context,
    QrCodeScannerViewModel viewmodel, {
    bool kRefreshBT = true,
  }) async {
    try {
      final result = await viewmodel.detectCode(
        context,
        kGetCode: emptyToNull(getCode),
        getApiTypeEnum: widget.getApiTypeEnum,
      );
      debugPrint("🚀 ~ .then ~ result: ${formatError(result)}");
      if (context.mounted) {
        AppNav.pop(context, result: result);
      }
    } catch (e) {
      debugPrint("🚀 ~ .onError ~ error: ${formatError(e)}");
      if (kRefreshBT) {
        refreshBT = true;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: QrCodeScannerViewModel(context: context),
      builder: (context, viewmodel, child) {
        return Scaffold(
          floatingActionButton: _buildAction(context, viewmodel),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: [
              PageView(
                controller: controllerPageView,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  Stack(
                    children: [
                      _buildQrView(context, viewmodel),
                      _buildHeader(context),
                    ],
                  ),
                  _buildPrintCheck(context, viewmodel),
                ],
              ),
              if (viewmodel.loading) AppLoading.page(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAction(BuildContext context, QrCodeScannerViewModel viewmodel) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.paddingScreen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: currentIndex == 0,
            child: Column(
              children: [
                Visibility(
                  visible: refreshBT,
                  child: Padding(
                    padding: context.paddingScreenHorizontal,
                    child: AppButton.click(
                      context,
                      onTap: () => _refresh(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.instance.primary,
                          borderRadius: BorderRadius.circular(context.border16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Refresh',
                              style: AppTextStyle(context).kBodyDefault
                                  .copyWith(color: AppColors.instance.white),
                            ),
                            context.emptySizedWidthBoxLow,
                            AppImageView.imageIcon(
                              context,
                              name: ImageConstants.instance.refresh,
                              size: context.iconSizeButton,
                              color: AppColors.instance.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow,
                Container(
                  padding: context.paddingScreenHorizontal,
                  child: Column(
                    children: [
                      Text(
                        'Serial Number / QR code',
                        textAlign: TextAlign.center,
                        style: AppTextStyle(
                          context,
                        ).kHeadline5.copyWith(color: AppColors.instance.white),
                      ),
                      context.emptySizedHeightBoxLow,
                      Text(
                        'โปรดสแกน Serial Number / QR code ในบริเวณที่กำหนดเพื่อให้ระบบตรวจสอบข้อมูล',
                        textAlign: TextAlign.center,
                        style: AppTextStyle(context).kBodyDefault.copyWith(
                          color: AppColors.instance.white,
                        ),
                      ),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.paddingScreen),
            child: Row(
              children: [
                Expanded(
                  child: AppButton.submit(
                    context,
                    onPressed:
                        viewmodel.loading || currentIndex == 0
                            ? null
                            : currentIndex == 0
                            ? () {}
                            : () {
                              _refresh();
                              controllerPageView.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                    text: 'สแกนตรวจสอบ',

                    // elevation: 0,
                    // backgroundColor: currentIndex == 0
                    //     ? AppColors.instance.white
                    //     : AppColors.instance.grey,
                    // style: AppTextStyle(context).kBodyDefault,
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: AppButton.submit(
                    context,
                    onPressed:
                        viewmodel.loading
                            ? null
                            : currentIndex == 1
                            ? null
                            : () {
                              refreshBT = false;
                              controller?.stopCamera();
                              controllerPageView.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                    text: 'พิมพ์ตรวจสอบ',
                    // elevation: 0,
                    // backgroundColor: currentIndex == 1
                    //     ? AppColors.instance.white
                    //     : AppColors.instance.grey,
                    // style: AppTextStyle(context).kBodyDefault,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + context.normalValue,
        left: context.paddingScreen,
        right: context.paddingScreen,
      ),
      child: Column(
        children: [
          AppButton.click(
            context,
            onTap: () => AppNav.pop(context),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppImageView.imageAsset(
                context,
                name: ImageConstants.instance.closeCircle,
                size: 52,
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGetFlashStatus(context),
              _buildFlipCamera(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context, QrCodeScannerViewModel viewmodel) {
    return QRView(
      key: qrKey,
      onQRViewCreated:
          (value) => _onQRViewCreated(context, viewmodel, controller: value),
      overlay: QrScannerOverlayShape(
        borderColor: AppColors.instance.white,
        borderRadius: 5,
        borderLength: 20,
        borderWidth: 3,
        cutOutSize: context.width * 0.6,
      ),
    );
  }

  Widget _buildFlipCamera(BuildContext context) {
    if (currentIndex == 1) return const SizedBox();
    return CircleAvatar(
      backgroundColor: AppColors.instance.white,
      child: IconButton(
        onPressed: () async {
          await controller?.flipCamera();
          setState(() {});
        },
        icon: const Icon(Icons.switch_camera_rounded),
        color: AppColors.instance.black,
      ),
    );
  }

  Widget _buildGetFlashStatus(BuildContext context) {
    if (currentIndex == 1) return const SizedBox();
    return CircleAvatar(
      backgroundColor: AppColors.instance.white,
      child: IconButton(
        icon: FutureBuilder<bool?>(
          future: controller?.getFlashStatus(),
          initialData: false,
          builder: (context, snapshot) {
            try {
              if (snapshot.connectionState == ConnectionState.done) {
                return Icon(
                  (snapshot.data == null || snapshot.data == false)
                      ? Icons.flash_off
                      : Icons.flash_on,
                );
              }
            } catch (e) {
              AppSnackBar.error(context, text: '$e');
            }
            return const SizedBox();
          },
        ),
        color: AppColors.instance.black,
        onPressed: () async {
          if (mounted) {
            try {
              await controller?.toggleFlash();
              setState(() {});
            } catch (e) {
              if (context.mounted) {
                AppSnackBar.error(context, text: '$e');
              }
            }
          }
        },
      ),
    );
  }

  Widget _buildPrintCheck(
    BuildContext context,
    QrCodeScannerViewModel viewmodel,
  ) {
    return BuildTemplateMain(
      child: Padding(
        padding: context.onlyTopPaddingLow,
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    child: BuildTextFormField(
                      padding: EdgeInsets.zero,
                      hintText: 'Serial Number / QR code',
                      // suffixIcon: AppButton.submit(
                      //   context,
                      //   onPressed: () {
                      //     if (formKey.currentState!.validate()) {
                      //       onDetect(context, viewmodel);
                      //     }
                      //   },
                      //   child: AppImageView.imageIcon(
                      //     context,
                      //     name: ImageConstants.instance.search,
                      //     color: AppColors.instance.white,
                      //   ),
                      // ),
                      inputFormatters: inputFormatNoSpace,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          (value) => AppValidator.validatorText(
                            value,
                            text: "กรุณากรอก Serial Number / QR code",
                          ),
                      onChanged: (value) {
                        getCode = value;
                      },
                    ),
                  ),
                  context.emptySizedWidthBoxLow,
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: AppButton.submit(
                      context,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onDetect(context, viewmodel, kRefreshBT: false);
                        }
                      },
                      child: AppImageView.imageIcon(
                        context,
                        name: ImageConstants.instance.search,
                        color: AppColors.instance.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.emptySizedHeightBoxLow,
            AppImageView.imageIcon(
              context,
              name: ImageConstants.instance.doubleUpArrow,
              color: AppColors.instance.grey,
              size: context.iconSizeNormal,
            ),
            context.emptySizedHeightBoxLow,
            Text(
              'กรอก Serial Number',
              style: AppTextStyle(
                context,
              ).kHeadline5.copyWith(color: AppColors.instance.grey),
            ),
            context.emptySizedHeightBoxLow,
            Text(
              'โปรดกรอก Serial Number เพื่อให้ระบบตรวจสอบผลิตภัณฑ์ของคุณ',
              style: AppTextStyle(
                context,
              ).kBodyDefault.copyWith(color: AppColors.instance.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
