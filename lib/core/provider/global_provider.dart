import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../connection/check_version_app.dart';
import '../connection/rest_service.dart';
import '../init/constants/app/api_endpoints.dart';
import '../init/navigation/navigation.dart';
import '../init/shared_preferences/shared_preferences.dart';
import '../model/response/config/configs_master_list_model.dart';
import '../model/response/config/configs_master_model.dart';
import '../repo/global_repo.dart';
import '../repo/user_profile_repo.dart';
import '../utility/formatters.dart';
import '../utility/utility.dart';
import 'user_profile_provider.dart';

class GlobalProvider extends ChangeNotifier {
  String appVersion = '1.0.0';
  String appBuildNumber = '1';
  String packageName = 'com.ptn.estock.application';

  final _globalRepo = GlobalRepo();
  final _singleton = Singleton.shared;
  final _userProfileRepo = UserProfileRepo();

  bool _showSplashScreen = false;
  bool get showSplashScreen => _showSplashScreen;
  set showSplashScreen(bool value) {
    _showSplashScreen = value;
    notifyListeners();
  }

  bool _loadingGlobal = false;
  bool get loadingGlobal => _loadingGlobal;
  set loadingGlobal(bool value) {
    _loadingGlobal = value;
    notifyListeners();
  }

  Future<String?> getFilePath({
    required ImageSource source,
    CameraDevice? preferredCameraDevice,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedFile = await picker
          .pickImage(
            source: source,
            preferredCameraDevice: preferredCameraDevice ?? CameraDevice.rear,
            imageQuality: 60,
          )
          .onError((error, stackTrace) {
            return null;
          });
      return pickedFile?.path;
    } catch (e) {
      return null;
    }
  }

  Future<List<ConfigsMaster>> getConfigsMasterDataList() async {
    try {
      final response = await RestService.getWithAuthAPI(
        urlPath: ApiEndpoint.configsMaster,
      );

      return configsMasterListFromJson('${response.response}').data ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initAppValidate(
    BuildContext context, {
    bool popScreen = false,
    bool navigation = true,
    bool notLoadingGlobal = false,
  }) async {
    try {
      if (!notLoadingGlobal) {
        loadingGlobal = true;
      }
      await Future.delayed(const Duration(milliseconds: 100)).then((
        value,
      ) async {
        if (context.mounted) {
          bool canUpdate = await getVersionStatus(context);
          if (!canUpdate && context.mounted) {
            final userProfileProvider = context.read<UserProfileProvider>();
            bool pass = await userProfileProvider.checkValidateUserLocal();
            if (context.mounted) {
              if (pass) {
                await checkValidateUser(
                  context,
                  popScreen: popScreen,
                  userProfileProvider: userProfileProvider,
                  navigation: navigation,
                );
              } else {
                AppNav.toNameAndRemoveUntil(context, AppNavConstants.LOGIN);
                await userProfileProvider.deleteUserProfile();
              }
            }
          }
        }
      });
      await _globalRepo.setExpiresAt();
      if (!notLoadingGlobal) {
        loadingGlobal = false;
      }
    } catch (e) {
      if (!notLoadingGlobal) {
        loadingGlobal = false;
      }
      rethrow;
    }
  }

  Future<void> checkValidateUser(
    BuildContext context, {
    required bool popScreen,
    required UserProfileProvider userProfileProvider,
    bool navigation = true,
  }) async {
    String? userId = await _singleton.getUserId();
    final response = await _userProfileRepo.getOne(
      userId: int.parse(userId ?? '0'),
    );
    final data = response?.data;

    if (context.mounted) {
      if (data != null) {
        final currentFcmToken = emptyToNull(data.firebaseToken);
        final currentPlatform = emptyToNull(data.platform);
        if (currentFcmToken == null || currentPlatform == null) {
          // final newFcmToken = await AppFirebase.setFirebaseToken();
          // final newPlatform = AppPlatform.instance.platform;

          // if (newFcmToken != null &&
          //     currentFcmToken != newFcmToken &&
          //     currentPlatform != newPlatform) {
          //   await _userProfileRepo.putOne(
          //     id: data.id,
          //     bodyData: {"firebaseToken": newFcmToken, "platform": newPlatform},
          //   );
          // } else {
          //   if (newFcmToken != null && currentFcmToken != newFcmToken) {
          //     await _userProfileRepo.putOne(
          //       id: data.id,
          //       bodyData: {"firebaseToken": newFcmToken},
          //     );
          //   }

          //   if (currentPlatform != newPlatform) {
          //     await _userProfileRepo.putOne(
          //       id: data.id,
          //       bodyData: {"platform": newPlatform},
          //     );
          //   }
          // }
        }
        bool activeFlag = data.activeFlag ?? false;
        bool isFirstLogin = data.isFirstLogin ?? true;
        bool validate = activeFlag && !isFirstLogin;

        if (validate) {
          if (context.mounted) {
            userProfileProvider.userProfile = data;
            if (context.mounted) {
              if (navigation) {
                if (!popScreen) {
                  AppNav.toNameAndRemoveUntil(
                    context,
                    AppNavConstants.DASHBOARD,
                  );
                } else {
                  AppNav.pop(context);
                }
              }
            }
          }
        } else {
          if (context.mounted) {
            await _userProfileRepo.putOne(
              id: data.id,
              bodyData: {"firebaseToken": null},
            );
            if (context.mounted) {
              AppNav.toNameAndRemoveUntil(context, AppNavConstants.LOGIN);
              AppAlertDialog.error(
                context,
                textError:
                    !activeFlag
                        ? 'ไม่สามารถใช้งานบัญชีนี้ได้'
                        : 'กรุณาเข้าสู่ระบบใหม่',
              );
            }
          }
          await userProfileProvider.deleteUserProfile();
        }
      } else {
        AppNav.toNameAndRemoveUntil(context, AppNavConstants.LOGIN);
        await userProfileProvider.deleteUserProfile();
      }
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
