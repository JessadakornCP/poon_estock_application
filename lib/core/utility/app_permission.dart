import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import '../../config/config.dart';
import 'app_alert_dialog.dart';

class AppPermissions {
  Future<bool> getLocationService() async {
    final location = loc.Location();
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  Future<loc.LocationData?> getLocation(BuildContext context) async {
    try {
      final location = loc.Location();
      loc.PermissionStatus permission;
      permission = await location.hasPermission();
      if (permission == loc.PermissionStatus.denied) {
        if (context.mounted) {
          await AppAlertDialog.submit(
            context,
            barrierDismissible: false,
            title: 'การอนุญาตตำแหน่งถูกปิด',
            subTitle: 'กรุณาเปิดการใช้งานตำแหน่ง เพื่อใช้บันทึกการทำงานของคุณ',
            textSubmit: 'ดำเนินการต่อ',
            textCancel: 'ปิด',
            onPressedSubmit: () async {
              permission = await location.requestPermission();
            },
          );
        }
      }
      if (permission == loc.PermissionStatus.deniedForever) {
        if (context.mounted) {
          await AppAlertDialog.submit(
            context,
            barrierDismissible: false,
            textSubmit: 'ตั้งค่าแอป',
            textCancel: 'ปิด',
            title: 'การอนุญาตตำแหน่งถูกปิดอย่างถาวร',
            subTitle:
                'กรุณาอนุญาตเข้าถึงตำแหน่งของท่าน เพื่อใช้บันทึกการทำงานของคุณ กรุณาเปิด Location Service บนโทรศัพท์มือถือของคุณ',
            color: AppColors.instance.red,
            onPressedSubmit: () {
              AppSettings.openAppSettings(type: AppSettingsType.location);
            },
          );
        }
      }

      if (permission != loc.PermissionStatus.granted) {
        return null;
      }

      bool serviceEnabled = await getLocationService();

      if (!serviceEnabled) {
        return null;
      }

      return await location.getLocation();
    } catch (e) {
      rethrow;
    }
  }
}
