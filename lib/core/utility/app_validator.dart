import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poon_estock_application/core/utility/formatters.dart';

class AppValidator {
  static String? validatorText(
    String? value, {
    String? text,
    Function()? function,
    GlobalKey? formKey,
  }) {
    String? valueT = value?.trim().toString();
    if (valueT == '' || valueT == null || valueT == 'null') {
      if (formKey != null) {
        if (formKey.currentContext != null) {
          Scrollable.ensureVisible(
            formKey.currentContext!,
            duration: const Duration(milliseconds: 500),
          );
        }
      }
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (function != null) {
      return function();
    }
    return null;
  }

  static String? validatorListText(
    List<dynamic>? value, {
    String? text,
    Function()? function,
    GlobalKey? formKey,
  }) {
    List<dynamic> valueT = value ?? [];
    if (valueT.isEmpty) {
      if (formKey != null) {
        if (formKey.currentContext != null) {
          Scrollable.ensureVisible(
            formKey.currentContext!,
            duration: const Duration(milliseconds: 500),
          );
        }
      }
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (function != null) {
      return function();
    }
    return null;
  }

  static String? validatorEmail(String? value) {
    String? valueT = value?.trim().toString();
    if (valueT == '' || valueT == null || valueT == 'null') {
      return 'กรุณากรอกอีเมล';
    } else if (!EmailValidator.validate(valueT)) {
      return 'กรอกอีเมลให้ถูกต้อง';
    }
    return null;
  }

  static String? validatorPhone(String? value, {String? text1}) {
    String? valueT = value?.trim().toString();
    if (valueT == '' || valueT == null || valueT == 'null') {
      return text1 ?? 'กรุณากรอกเบอร์โทรศัพท์';
    } else if (!valueT.startsWith('0')) {
      return 'ต้องมี 0 นำหน้า';
    } else if (valueT.length < 10) {
      return 'เบอร์โทรศัพท์ 10 หลัก';
    }
    return null;
  }

  static String? validatorTimeRange({
    required DateTime? startTime,
    bool? isStart = false,
    required DateTime? endTime,
    bool? isEnd = false,
    String? text,
  }) {
    final kStartTime = convertDateTimeToTimeString(startTime);
    final kEndTime = convertDateTimeToTimeString(endTime);

    if (kStartTime == null && isStart == true) {
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (kEndTime == null && isEnd == true) {
      return text ?? 'กรุณากรอกข้อมูล';
    }

    if (kStartTime == null || kEndTime == null) {
      return null;
    }
    // กำหนดรูปแบบเวลาที่ต้องการ เช่น "HH:mm"
    final format = DateFormat("HH:mm");

    // แปลง String เป็น DateTime
    final startTimeDateTime = format.parse(kStartTime);
    final endTimeDateTime = format.parse(kEndTime);

    // เปรียบเทียบเวลา
    if (startTimeDateTime.isBefore(endTimeDateTime)) {
      return null;
    } else {
      return 'เวลาเริ่มต้นต้องน้อยกว่าเวลาสิ้นสุด';
    }
  }

  static String? validatorPassword({
    bool isPassword = false,
    required String? password,
    bool isPasswordConfirm = false,
    required String? passwordConfirm,
  }) {
    String? kPassword = emptyToNull(password?.trim().toString());
    String? kPasswordConfirm = emptyToNull(passwordConfirm?.trim().toString());
    if (isPassword) {
      if (kPassword == null) {
        return 'กรุณากรอกรหัสผ่าน';
      } else if (kPassword.length < 6) {
        return 'อย่างน้อย 6 ตัว';
      } else if (kPassword != kPasswordConfirm && kPasswordConfirm != null) {
        return 'รหัสผ่านไม่ตรงกัน';
      } else {
        return null;
      }
    } else if (isPasswordConfirm) {
      if (kPasswordConfirm == null) {
        return 'กรุณากรอกยืนยันรหัสผ่าน';
      } else if (kPasswordConfirm.length < 6) {
        return 'อย่างน้อย 6 ตัว';
      } else if (kPasswordConfirm != kPassword && kPassword != null) {
        return 'รหัสผ่านไม่ตรงกัน';
      } else {
        return null;
      }
    }
    return null;
  }
}
