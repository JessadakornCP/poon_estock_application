import 'package:poon_estock_application/core/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_viewmodel.dart';
import '../../../model/response/user_Profile/user_profile_model.dart';
import '../../../utility/app_alert_dialog.dart';
import '../enum/get_api_type_enum.dart';

class QrCodeScannerViewModel extends BaseViewModel {
  final UserProfileProvider _userProfileProvider;
  QrCodeScannerViewModel({required BuildContext context})
    : _userProfileProvider = context.read<UserProfileProvider>();

  UserProfile? get userProfile => _userProfileProvider.userProfile;

  String? _getCode;
  String? get getCode => _getCode;
  set getCode(String? getCode) {
    _getCode = getCode;
    notifyListeners();
  }

  Future detectCode(
    BuildContext context, {
    required String? kGetCode,
    required GetApiTypeEnum getApiTypeEnum,
  }) async {
    try {
      loading = true;
      _getCode = kGetCode;
      debugPrint('getCode: $_getCode');
      switch (getApiTypeEnum) {
        case GetApiTypeEnum.GET_CUSTOMER_DEVICES_CHECK_DEVICE_SERIAL_NUMBER:
        // return await getCheckDeviceSerialNumber(context);
      }
    } catch (e) {
      if (context.mounted) {
        AppAlertDialog.errorRes(context, e);
      }
      loading = false;
      rethrow;
    }
  }
}
