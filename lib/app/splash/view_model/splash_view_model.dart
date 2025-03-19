import 'package:flutter/material.dart';
import '../../../core/base/base_viewmodel.dart';
import '../../../core/connection/check_version_app.dart';
import '../../../core/provider/global_provider.dart';
import '../../../core/utility/formatters.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({required BuildContext context});

  final _globalProvider = GlobalProvider();

  Future<void> onInitViewModel(
    BuildContext context, {
    required bool popScreen,
  }) async {
    try {
      loadingMain = true;
      await initViewModel(context, popScreen: popScreen);
      loadingMain = false;
    } catch (e) {
      msgError = formatError(e);
      loadingMain = false;
    }
  }

  Future<void> initViewModel(
    BuildContext context, {
    required bool popScreen,
  }) async {
    try {
      if (context.mounted) {
        await _globalProvider.initAppValidate(
          context,
          popScreen: popScreen,
          notLoadingGlobal: true,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onRefresh(
    BuildContext context, {
    required bool popScreen,
  }) async {
    try {
      msgError = null;
      loadingMain = true;
      await initViewModel(context, popScreen: popScreen);
      loadingMain = false;
    } catch (e) {
      loadingMain = false;
      msgError = formatError(e);
    }
  }

  Future<bool> getVersionStatus(BuildContext context) async {
    try {
      return await AppCheckVersion().getVersionStatus(context);
    } catch (e) {
      rethrow;
    }
  }
}
