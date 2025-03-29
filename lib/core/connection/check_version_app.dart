// ignore_for_file: unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/config.dart';
import '../model/response/config/configs_master_model.dart';
import '../provider/global_provider.dart';
import '../utility/utility.dart';
import '../widget/app_button.dart';

class VersionStatus {
  /// The current version of the app.
  final String localVersion;

  /// The most recent version of the app in the store.
  final String storeVersion;

  /// The most recent version of the app in the store.
  final String? minVersion;

  /// The most recent version of the app in the store.
  final String? originalStoreVersion;

  /// A link to the app store page where the app can be updated.
  final String appStoreLink;

  /// The release notes for the store version of the app.
  // final String? releaseNotes;

  /// Returns `true` if the store version of the application is greater than the local version.
  bool get canUpdate {
    final local = localVersion.split('.').map(int.parse).toList();
    final store = storeVersion.split('.').map(int.parse).toList();

    // ตรวจสอบ minVersion ก่อน
    if (minVersion != null) {
      final min = minVersion!.split('.').map(int.parse).toList();

      bool areEqual = true; // สมมติว่าเท่ากันในตอนแรก

      for (var i = 0; i < min.length; i++) {
        if (min[i] != local[i]) {
          areEqual = false;
          break;
        }
      }

      if (areEqual) {
        return false;
      }

      for (var i = 0; i < min.length; i++) {
        if (min[i] > local[i]) {
          return true;
        }
        if (local[i] > min[i]) {
          return false;
        }
      }
    }

    // Each consecutive field in the version notation is less significant than the previous one,
    // therefore only one comparison needs to yield `true` for it to be determined that the store
    // version is greater than the local version.
    for (var i = 0; i < store.length; i++) {
      // The store version field is newer than the local version.
      if (store[i] > local[i]) {
        return true;
      }

      // The local version field is newer than the store version.
      if (local[i] > store[i]) {
        return false;
      }
    }

    // The local and store versions are the same.
    return false;
  }

  //Public Contructor
  VersionStatus({
    required this.localVersion,
    required this.storeVersion,
    this.minVersion,
    required this.appStoreLink,
    // this.releaseNotes,
    this.originalStoreVersion,
  });

  VersionStatus._({
    required this.localVersion,
    required this.storeVersion,
    this.minVersion,
    required this.appStoreLink,
    // this.releaseNotes,
    this.originalStoreVersion,
  });
}

class AppCheckVersion {
  Future<bool> getVersionStatus(BuildContext context) async {
    try {
      VersionStatus? versionStatus = await AppCheckVersion().getVersionStore(
        context,
      );
      if (versionStatus != null && versionStatus.canUpdate) {
        if (context.mounted) {
          AppAlertDialog.message(
            context,
            title: Text(
              'POON eSTOCK เวอร์ชั่นใหม่',
              style: AppTextStyle(context).kHeadline6,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'กรุณาอัปเดตแอป ',
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                      ),
                      TextSpan(
                        text: 'POON eSTOCK',
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'เวอร์ชั่นใหม่ : ',
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                      ),
                      TextSpan(
                        text: versionStatus.storeVersion,
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'เวอร์ชั่นปัจจุบัน : ',
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                      ),
                      TextSpan(
                        text: versionStatus.localVersion,
                        style: AppTextStyle(
                          context,
                        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  'เพื่อการใช้งานที่ดีกว่าเดิม',
                  style: AppTextStyle(context).kBodyDefault,
                ),
              ],
            ),
            actions: AppButton.submit(
              context,
              text: 'อัปเดต',
              onPressed: () {
                AppUtility.openUrl(versionStatus.appStoreLink);
              },
            ),
          );
        }
        return true;
      } else {
        debugPrint("Not Update");
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<VersionStatus?> getVersionStore(BuildContext context) async {
    try {
      if (Platform.isIOS) {
        return await _getIOSConfigVersion(context);
      } else if (Platform.isAndroid) {
        return await _getAndroidStoreVersion(context);
      } else {
        debugPrint(
          'แพ็คเกจนี้ยังไม่รองรับแพลตฟอร์ม "${Platform.operatingSystem}"',
        );
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getCleanVersion(String version) =>
      RegExp(r'\d+\.\d+(\.\d+)?').stringMatch(version) ?? '0.0.0';

  // Future<VersionStatus?> _getAndroidStoreVersion(
  //     PackageInfo packageInfo) async {
  //   try {
  //     final id = packageInfo.packageName;
  //     final uri = Uri.https("play.google.com", "/store/apps/details",
  //         {"id": id.toString(), "hl": "th_TH"});
  //     final response = await RestService.getVersionStore(uri: uri);
  //     if (response.statusCode != 200) {
  //       throw Exception("Invalid response code: ${response.statusCode}");
  //     }
  //     // Supports 1.2.3 (most of the apps) and 1.2.prod.3 (e.g. Google Cloud)
  //     //final regexp = RegExp(r'\[\[\["(\d+\.\d+(\.[a-z]+)?\.\d+)"\]\]');
  //     final regexp =
  //         RegExp(r'\[\[\[\"(\d+\.\d+(\.[a-z]+)?(\.([^"]|\\")*)?)\"\]\]');
  //     final storeVersion = regexp.firstMatch(response.body)?.group(1);

  //     //Description
  //     //final regexpDescription = RegExp(r'\[\[(null,)\"((\.[a-z]+)?(([^"]|\\")*)?)\"\]\]');

  //     //Release
  //     final regexpRelease =
  //         RegExp(r'\[(null,)\[(null,)\"((\.[a-z]+)?(([^"]|\\")*)?)\"\]\]');

  //     final expRemoveSc = RegExp(r"\\u003c[A-Za-z]{1,10}\\u003e",
  //         multiLine: true, caseSensitive: true);

  //     final releaseNotes = regexpRelease.firstMatch(response.body)?.group(3);
  //     //final descriptionNotes = regexpDescription.firstMatch(response.body)?.group(2);

  //     return VersionStatus._(
  //       localVersion: _getCleanVersion(packageInfo.version),
  //       storeVersion: _getCleanVersion(storeVersion ?? ""),
  //       originalStoreVersion: storeVersion ?? "",
  //       appStoreLink: uri.toString(),
  //       releaseNotes: releaseNotes?.replaceAll(expRemoveSc, ''),
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<VersionStatus?> _getAndroidStoreVersion(BuildContext context) async {
    try {
      final globalProvider = context.read<GlobalProvider>();
      final response = await globalProvider.getConfigsMasterDataList();
      final item = response.firstWhere(
        (element) => element.name == "ANDROID_POON_ESTOCK",
        orElse: () => ConfigsMaster(),
      );
      final uri = Uri.https("play.google.com", "/store/apps/details", {
        "id": globalProvider.packageName,
        "hl": "th_TH",
      });

      return VersionStatus._(
        localVersion: _getCleanVersion(globalProvider.appVersion),
        storeVersion: _getCleanVersion(item.currentVersion ?? "1.0.0"),
        minVersion: _getCleanVersion(item.minVersion ?? "1.0.0"),
        originalStoreVersion: item.currentVersion ?? "1.0.0",
        appStoreLink: uri.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<VersionStatus?> _getIOSConfigVersion(BuildContext context) async {
    try {
      final globalProvider = context.read<GlobalProvider>();
      final response = await globalProvider.getConfigsMasterDataList();
      final item = response.firstWhere(
        (element) => element.name == "IOS_POON_ESTOCK",
        orElse: () => ConfigsMaster(),
      );
      final id = globalProvider.packageName;
      final parameters = {"bundleId": id, "country": "th"};

      var uri = Uri.https("itunes.apple.com", "/lookup", parameters);
      return VersionStatus._(
        localVersion: _getCleanVersion(globalProvider.appVersion),
        storeVersion: _getCleanVersion(item.currentVersion ?? "1.0.0"),
        minVersion: _getCleanVersion(item.minVersion ?? "1.0.0"),
        originalStoreVersion: item.currentVersion ?? "1.0.0",
        appStoreLink: uri.toString(),
      );
    } catch (e) {
      rethrow;
    }
    /* try {
      final id = packageInfo.packageName;
      final parameters = {"bundleId": id};

      parameters.addAll({"country": "th"});

      var uri = Uri.https("itunes.apple.com", "/lookup", parameters);
      final response = await RestService.getVersionStore(uri: uri);
      final jsonDe = jsonDecode(response.body);
      if (response.statusCode != 200) {
        debugPrint('Failed to query iOS App Store');
        return null;
      }

      final List results = jsonDe['results'];
      if (results.isEmpty) {
        debugPrint('Can\'t find an app in the App Store with the id: $id');
        return null;
      }
      return VersionStatus._(
        localVersion: _getCleanVersion(packageInfo.version),
        storeVersion: _getCleanVersion(jsonDe['results'][0]['version']),
        originalStoreVersion: jsonDe['results'][0]['version'],
        appStoreLink: jsonDe['results'][0]['trackViewUrl'],
        releaseNotes: jsonDe['results'][0]['releaseNotes'],
      );
    } catch (e) {
      rethrow;
    } */
  }
}
