import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import '../../../../config/config.dart';
import '../../../../core/base/base_screen.dart';
import '../../../../core/init/constants/image/image_constants.dart';
import '../../../../core/utility/app_validator.dart';
import '../../../../core/utility/formatters.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/widgets.dart';
import '../../login/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: LoginViewModel(context: context),
      builder: (context, viewmodel, child) {
        return BuildTemplateMain(
          showAppbar: false,
          showAppbarBackgroundColor: true,
          paddingScreen: EdgeInsets.zero,
          safeAreaTop: false,
          canPop: false,
          onPopInvokedWithResult:
              (didPop, result) => viewmodel.isExitWarning(context),
          child: _buildContent(context, viewmodel),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, LoginViewModel viewmodel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [_buildHeader(context), _buildBody(context, viewmodel)],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AppImageView.imageAsset(
      context,
      name: ImageConstants.instance.printer2,
      width: 300,
      height: 300,
      fit: BoxFit.scaleDown,
    );
  }

  Widget _buildBody(BuildContext context, LoginViewModel viewmodel) {
    return _loginForm(context, viewmodel);
  }

  Widget _loginForm(BuildContext context, LoginViewModel viewmodel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: viewmodel.formKey,
        child: Column(
          children: [
            Column(
              children: [
                Text('เข้าสู่ระบบ', style: AppTextStyle(context).kHeadline5),
                Text('POON eSTOCK', style: AppTextStyle(context).kHeadline5),
              ],
            ),
            context.emptySizedHeightBoxLow3x,
            BuildTextFormField(
              disable: viewmodel.loading,
              labelText: 'Username',
              inputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.iron),
                borderRadius: BorderRadius.circular(10),
              ),
              showValidator: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  (value) => AppValidator.validatorText(
                    value,
                    text: 'กรุณากรอกชื่อผู้ใช้งาน',
                  ),
              onChanged: (value) => viewmodel.userName = value,
            ),
            BuildTextFormField(
              disable: viewmodel.loading,
              labelText: 'Password',
              suffixIcon: AppButton.click(
                context,
                onTap:
                    () =>
                        viewmodel.passwordVisibility =
                            !viewmodel.passwordVisibility,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: AppImageView.imageIcon(
                    context,
                    name:
                        viewmodel.passwordVisibility
                            ? ImageConstants.instance.visibilityOutlined
                            : ImageConstants.instance.visibilityOffOutlined,
                    color: AppColors.instance.grey,
                  ),
                ),
              ),
              inputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.iron),
                borderRadius: BorderRadius.circular(10),
              ),
              showValidator: false,
              inputFormatters: inputFormatPassword,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              obscureText: viewmodel.passwordVisibility ? false : true,
              maxLines: 1,
              validator:
                  (value) => AppValidator.validatorText(
                    value,
                    text: 'กรุณากรอกรหัสผ่าน',
                  ),
              onChanged: (value) => viewmodel.password = value,
            ),
            context.emptySizedHeightBoxLow,
            AppButton.submit(
              context,
              text: 'เข้าสู่ระบบ',
              loading: viewmodel.loading,
              onPressed: () {
                if (viewmodel.formKey.currentState!.validate() &&
                    !viewmodel.loading) {
                  viewmodel.login(context);
                }
              },
            ),
            context.emptySizedHeightBoxLow3x,
            Text(
              'คุณลืมรหัสผ่านใช่หรือไม่ ?',
              style: AppTextStyle(context).kBodyDefault,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'หากคุณลืมรหัสผ่านกรุณากด  ',
                    style: AppTextStyle(context).kBodyDefault,
                  ),
                  TextSpan(
                    text: 'ลืมรหัสผ่าน',
                    style: AppTextStyle(
                      context,
                    ).kSubTitle1.copyWith(color: AppColors.instance.primary),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // AppNav.toNamed(
                            //   context,
                            //   AppNavConstants.FORGET_PASSWORD,
                            // );
                          },
                  ),
                ],
              ),
            ),
            AppButton.click(
              context,
              onTap: () {
                // AppNav.toNamed(context, AppNavConstants.REGISTER_TYPE);
              },
              child: Padding(
                padding: context.paddingLow3xVertical,
                child: Text(
                  'สมัครสมาชิก',
                  style: AppTextStyle(
                    context,
                  ).kSubTitle1.copyWith(color: AppColors.instance.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
