// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/init/constants/app/app_constant.dart';
import '../../../../core/init/navigation/navigation.dart';
import '../../../../core/init/shared_preferences/shared_preferences.dart';
import '../../../../core/model/api_status/api_status_model.dart';
import '../../../../core/provider/user_profile_provider.dart';
import '../../../../core/repo/auth_repo.dart';
import '../../../../core/repo/global_repo.dart';
import '../../../../core/repo/user_profile_repo.dart';
import '../../../../core/utility/formatters.dart';
import '../../../../core/utility/utility.dart';

class LoginViewModel extends BaseViewModel {
  final UserProfileProvider _userProfileProvider;
  LoginViewModel({required BuildContext context})
    : _userProfileProvider = context.read<UserProfileProvider>();

  final _authRepo = AuthRepo();
  final _userProfileRepo = UserProfileRepo();
  final _globalRepo = GlobalRepo();
  final _singleton = Singleton();

  final formKey = GlobalKey<FormState>();

  bool _passwordVisibility = false;
  bool get passwordVisibility => _passwordVisibility;
  set passwordVisibility(bool value) {
    _passwordVisibility = value;
    notifyListeners();
  }

  String? _userName;
  String? get userName => _userName;
  set userName(String? value) => _userName = value;

  String? _password;
  String? get password => _password;
  set password(String? value) => _password = value;

  Future login(BuildContext context) async {
    try {
      loading = true;
      await Future.delayed(const Duration(milliseconds: 300)).whenComplete(
        () async {
          if (context.mounted) {
            await postLogin(context);
            if (context.mounted) {
              AppNav.toNamed(context, AppNavConstants.DASHBOARD);
            }
          }
        },
      );
      loading = false;
    } catch (e) {
      if (context.mounted) {
        AppAlertDialog.errorRes(context, e);
      }
      loading = false;
    }
  }

  Future postLogin(BuildContext context) async {
    try {
      Map<String, dynamic> bodyData = {
        "username": '$userName',
        "password": '$password',
        "user_type": AppConstants.userTypeEService,
      };
      final response = await _authRepo.postLogin(bodyData: bodyData);
      final data = response?.data;
      if (data == null || data.id == null || data.token == null) {
        throw Failure(code: 500, errorResponse: 'ไม่พบข้อมูลผู้ใช้งาน');
      }

      await prepareInfoUpdateUser(userId: data.id);

      _userProfileProvider.userProfile = data;

      await _singleton.setTokenApi(data.token ?? '');
      await _singleton.setUserId(data.id.toString());
      await _singleton.setFullName(data.fullName ?? '');
      await _globalRepo.setExpiresAt();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> prepareInfoUpdateUser({required int? userId}) async {
    try {
      String? fcmToken = await Singleton.shared.getFcmToken();

      // final platform = AppPlatform.instance.platform;

      // if (emptyToNull(fcmToken) == null) {
      //   await AppFirebase.setFirebaseToken();
      //   fcmToken = await Singleton.shared.getFcmToken();
      // }

      Map bodyData = {
        "firebaseToken": emptyToNull(fcmToken),
        // "platform": emptyToNull(platform),
        "isFirstLogin": false,
      };

      await putUpdateUser(userId: userId, bodyData: bodyData);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> putUpdateUser({
    required int? userId,
    required Map bodyData,
  }) async {
    try {
      await _userProfileRepo.putOne(id: userId, bodyData: bodyData);
    } catch (e) {
      rethrow;
    }
  }
}
