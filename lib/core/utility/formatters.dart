import 'dart:convert';
import 'package:poon_estock_application/core/model/api_status/api_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../init/constants/app/api_endpoints.dart';
import '../init/constants/app/app_constant.dart';

const formatDate = 'dd/MM/yyyy';
const formatDateChat = "E dd MMM yyyy";
const formatDateTime = "dd MMM yyyy  HH:mm น.";
const formatDateToPost = "yyyy-MM-dd";

String printJsonBody(Map? message) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyPrintedJson = encoder.convert(message);
  return prettyPrintedJson;
}

extension BuddhistCalendarFormatter on DateFormat {
  String formatInBuddhistCalendarThai(DateTime dateTime) {
    if (pattern!.contains('y')) {
      var buddhistDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        dateTime.hour,
        dateTime.minute,
        dateTime.second,
        dateTime.millisecond,
        dateTime.microsecond,
      );

      if (locale.contains('th') || locale.contains('TH')) {
        var normalYear = buddhistDateTime.year;
        var dateTimeString = format(
          buddhistDateTime,
        ).replaceAll('ค.ศ.', 'พ.ศ.');
        dateTimeString = dateTimeString.replaceAll(
          normalYear.toString(),
          (normalYear + 543).toString(),
        );
        return dateTimeString;
      } else {
        var result = format(buddhistDateTime);
        return result;
      }
    }
    return format(dateTime);
  }
}

String? formatDateTimeThai(
  DateTime? dateTime, {
  String? format,
  bool addTimeZone = true,
  bool includeTime = false,
}) {
  if (dateTime == null) return null;
  DateTime? adjustedDateTime;
  if (addTimeZone) {
    adjustedDateTime = dateTime.add(const Duration(hours: 7));
  }
  return DateFormat(
    format ?? (!includeTime ? 'dd/MM/yyyy' : 'dd/MM/yyyy ( HH:mm น. )'),
  ).formatInBuddhistCalendarThai(adjustedDateTime ?? dateTime);
}

TimeOfDay? formatStringToTimeOfDay(String? time) {
  if (emptyToNull(time) == null) return null;
  return TimeOfDay(
    hour: int.parse(time!.split(":")[0]),
    minute: int.parse(time.split(":")[1]),
  );
}

String? formatTimeOfDay(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) return null;
  final now = DateTime.now();
  final DateTime dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
  final String formattedTime =
      "${dateTime.hour.toString().padLeft(2, '0')} : ${dateTime.minute.toString().padLeft(2, '0')}";

  return formattedTime;
}

String convertDate(DateTime? dateTime) {
  if (dateTime == null) return '';
  return DateFormat('dd').format(dateTime);
}

DateTime convertDateOnly(DateTime dateTime) {
  DateTime now = dateTime;
  final DateTime dateOnly = DateTime(now.year, now.month, now.day);
  return dateOnly;
}

String? convertDateTimeToTimeString(DateTime? dateTime) {
  if (dateTime == null) return null;
  DateTime? dateTimeL;
  TimeOfDay time = TimeOfDay.fromDateTime(dateTimeL ?? dateTime);
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

String? formatTime(String? time) {
  if (emptyToNull(time) == null) return null;
  return time?.substring(0, 5);
}

TimeOfDay? convertDateTimeToTimeOfDay(DateTime? dateTime) {
  if (dateTime == null) return null;
  return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
}

DateTime? convertTimeOfDayToDateTime(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) return null;
  final now = DateTime.now();
  return DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
}

DateTime? addTimeZone(DateTime? dateTime) {
  if (dateTime == null) return null;
  DateTime kDateTime = dateTime.add(const Duration(hours: 7));
  return kDateTime;
}

double stringToDouble(String? value) {
  if (value == null) return 0;
  String kValue = value.toString().trim();
  return kValue == '' ? 0 : double.parse(kValue.replaceAll(',', ''));
}

String doubleToString(double? value, {String? text, bool zero = true}) =>
    (value == null || value == 0)
        ? !zero
            ? ''
            : '0'
        : numberFormatCurrency(value);

double doubleToDouble(double? value) => value ?? 0;

int stringToInt(String? value) {
  if (value == null) return 0;
  String kValue = value.toString().trim();
  return kValue == '' ? 0 : int.parse(kValue.replaceAll(',', ''));
}

// String intToString(int? value) =>
//     (value == null || value == 0) ? '' : numberFormatCurrency(value);

String intToString(int? value, {String? text, bool zero = true}) =>
    (value == null || value == 0)
        ? !zero
            ? ''
            : '0'
        : numberFormatCurrency(value);

int intToInt(int? value) => value ?? 0;

int? intZeroToNull(int? value) => value;

String stringToString(String? value) =>
    value == null ? '' : value.trim().toString();

String dateTimeToString(DateTime? value) {
  if ((value == null)) {
    return '';
  } else {
    return DateFormat(formatDate).format(value);
  }
}

DateTime stringToDate(String value, {String? formatDate}) {
  // DateTime dateTime = DateFormat('dd/MM/yyyy').parse(value);
  // String dateTimeString = DateFormat('dd-MM-yyyy').format(dateTime);
  return DateFormat(formatDate ?? 'dd/MM/yyyy').parse(value);
}

String? emptyToNull(String? value) {
  String? data = value?.trim().toString();
  return data == '' || data == null ? null : data;
}

String? emptyToZeroString(String? value) {
  String? data = value?.trim().toString();
  return data == '' || data == null ? '0' : data;
}

String emptyToDash(String? value) {
  String? data = value?.trim().toString();
  if (data case ('' || null)) {
    return AppConstants.IS_EMPTY;
  } else {
    return data;
  }
}

String nullToEmpty(String? value) {
  String? data = value?.trim().toString();
  return data ?? '';
}

int emptyIntToZero(int? value) {
  return (value == null || value == 0) ? 0 : value;
}

int? emptyIntToNull(int? value) {
  return (value == null || value == 0) ? null : value;
}

double emptyDoubleToZero(double? value) {
  return (value == null || value == 0) ? 0 : value;
}

double doubleParse(String? value) {
  return double.parse(value ?? '0');
}

String? stringToDateFormatPost(String? value) {
  if ((value == null || value.trim().toString() == '')) {
    return null;
  } else {
    DateTime dateTime = DateFormat(formatDate).parse(value);
    return DateFormat(formatDateToPost).format(dateTime).trim().toString();
  }
}

bool isTimeBetween(DateTime checkTime, DateTime startTime, DateTime endTime) {
  return checkTime.isAfter(startTime) && checkTime.isBefore(endTime);
}

List<TextInputFormatter> inputFormatNumOnly = [
  FilteringTextInputFormatter.digitsOnly,
];

List<TextInputFormatter> inputFormatEmail = [
  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9+@._-]")),
  LowerCaseTextFormatter(),
];

List<TextInputFormatter> inputFormatTHNoSpaceOnly = [
  InputFormatTHNoSpaceOnly(),
];

List<TextInputFormatter> formatUserName = [
  FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9.]')),
  ConsecutiveDotFilter(),
  FilteringTextInputFormatter.deny(RegExp(r'\s')),
];

List<TextInputFormatter> formatPassword = [
  FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>]'),
  ),
  FilteringTextInputFormatter.deny(RegExp(r'\s')),
];

class ConsecutiveDotFilter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check for consecutive dots and remove the extra ones
    if (newValue.text.contains('..')) {
      return oldValue;
    }

    return newValue;
  }
}

class InputFormatTHNoSpaceOnly extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    for (int i = 0; i < newText.length; i++) {
      if ((newText.codeUnitAt(i) < 0x0E01 || newText.codeUnitAt(i) > 0x0E5B)) {
        return oldValue;
      }
    }
    return newValue;
  }
}

List<TextInputFormatter> inputFormatUpENGNoSpaceOnly = [
  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
  UpperCaseTextFormatter(),
];

List<TextInputFormatter> formatCurrency = [
  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
];
List<TextInputFormatter> formatCurrency2 = [
  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
];

List<TextInputFormatter> inputFormatPassword = [
  FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>]'),
  ),
  FilteringTextInputFormatter.deny(RegExp(r'\s')),
];

List<TextInputFormatter> inputFormatNoSpace = [
  FilteringTextInputFormatter.deny(RegExp(r'\s')),
];

var numberFormat = NumberFormat("#,###.#").format;
var numberFormatCurrency = NumberFormat("#,###.##").format;

TextInputType keyboardTypeNumber({bool decimal = true, bool signed = true}) {
  return TextInputType.numberWithOptions(decimal: decimal, signed: signed);
}

List<TextInputFormatter> decimalFormmatter({
  int decimalDigits = 0,
  bool percent = false,
  bool checkZero = false,
  bool checkRemainAmount = false,
  double remainAmount = 0,
}) {
  return [
    FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
    if (decimalDigits == 0) FilteringTextInputFormatter.digitsOnly,
    CurrencyDecimalFormatter(
      decimalDigits: decimalDigits,
      percent: percent,
      checkZero: checkZero,
      checkRemainAmount: checkRemainAmount,
      remainAmount: remainAmount,
    ),
  ];
}

class CurrencyDecimalFormatter extends TextInputFormatter {
  final formatter = NumberFormat('#,###.###');
  final int decimalDigits;
  final bool percent;
  final bool checkZero;
  final bool checkRemainAmount;
  final double remainAmount;

  CurrencyDecimalFormatter({
    this.decimalDigits = 0,
    this.percent = false,
    this.checkZero = false,
    this.checkRemainAmount = false,
    this.remainAmount = 0,
  });
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String truncated = newValue.text;
    TextSelection newSelection = newValue.selection;

    if (newValue.text == '.' || newValue.text == ' ') {
      return oldValue;
    } else if ((newValue.text == '0' || newValue.text == '') && checkZero) {
      return oldValue.replaced(
        TextRange(start: 0, end: oldValue.text.length),
        '0',
      );
    } else if (isDuplicateDotOrComma(oldValue.text, newValue.text)) {
      return oldValue;
    } else if (isInputTypingStatus(truncated)) {
      if (double.parse(truncated == '' ? '0' : truncated.replaceAll(',', '')) ==
              100 &&
          percent) {
        return oldValue;
      }
      return newValue;
    } else if (truncated.endsWith(",")) {
      truncated = formatStringEndWithCommaToDot(truncated);
    } else if (truncated.endsWith("-")) {
      return oldValue;
    } else {
      if (double.parse(truncated == '' ? '0' : truncated.replaceAll(',', '')) >
              100 &&
          percent) {
        return oldValue;
      }
      if (checkRemainAmount) {
        if (double.parse(
              truncated == '' ? '0' : truncated.replaceAll(',', ''),
            ) >
            remainAmount) {
          return TextEditingValue(text: '$remainAmount');
        }
      }
      String content = getContentAndFilterDecimals(truncated);
      final value = double.tryParse(content.replaceAll(',', ''));
      truncated = formatter.format(value);
    }

    newSelection = TextSelection.fromPosition(
      TextPosition(offset: truncated.length),
    );
    return TextEditingValue(text: truncated, selection: newSelection);
  }

  bool isInputTypingStatus(String text) {
    return text.endsWith(".") || text.isEmpty || text.endsWith(".0");
  }

  String getContentAndFilterDecimals(String content) {
    int sumOfDecimals = getSumOfDecimalDigits(content);
    if (sumOfDecimals > decimalDigits) {
      content = content.substring(0, content.length - 1);
    }
    return content;
  }

  int getSumOfDecimalDigits(String content) {
    int indexDecimal = content.indexOf('.');
    if (indexDecimal == -1) {
      return 0;
    } else {
      int sumOfDecimals = content.length - 1 - indexDecimal;
      return sumOfDecimals;
    }
  }

  bool isDuplicateDotOrComma(String oldValue, String newValue) {
    return newValue.length > oldValue.length &&
        oldValue.contains('.') &&
        isInputNewDotOrComma(newValue);
  }

  bool isInputNewDotOrComma(String content) {
    return content.endsWith('.') || content.endsWith(',');
  }

  String formatStringEndWithCommaToDot(String text) {
    text = text.substring(0, text.length - 1);
    text += '.';
    return text;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

String? dateToPost(DateTime? dateTime) {
  if (dateTime == null) return null;
  return DateFormat(formatDateToPost).format(dateTime);
}

String? timeToPost(TimeOfDay? time) {
  if (time == null) return null;
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
}

String? formatToUtcString(DateTime? dateTime) {
  if (dateTime == null) return null;
  if (!dateTime.isUtc) {
    dateTime = dateTime.add(const Duration(hours: 7));
  }
  return dateTime.toUtc().toIso8601String();
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  MaskedTextInputFormatter({required this.mask, required this.separator});
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

getInitialFormattedNumber(String format, String str) {
  if (str == '') return '';
  var mask = format;
  str.split("").forEach((item) {
    mask = mask.replaceFirst('x', item);
  });
  return mask.replaceAll('x', "");
}

bool isNumeric(String str) {
  // ใช้ try-catch เพื่อดักจับข้อผิดพลาดในกรณีที่ไม่สามารถแปลงเป็นตัวเลขได้
  try {
    double.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

String formatError(dynamic error) {
  if (error is Failure) {
    return "${error.errorResponse} ( ${error.code} )";
  } else {
    return error.toString();
  }
}

Failure failureInvalid(String message) {
  return Failure(
    code: ApiEndpoint.APP_CATCH,
    errorResponse: '$message is invalid',
  );
}

class PhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');
    if (!nums.startsWith('0')) return '';
    String internationalPhoneFormatted =
        nums.isNotEmpty
            ? (nums.isNotEmpty ? '(' : '') +
                nums.substring(0, nums.length >= 3 ? 3 : null) +
                (nums.length > 3 ? ') ' : '') +
                (nums.length > 3
                    ? nums.substring(3, nums.length >= 6 ? 6 : null) +
                        (nums.length > 6
                            ? '-${nums.substring(6, nums.length >= 10 ? 10 : null)}'
                            : '')
                    : '')
            : nums;
    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
      text: internationalPhoneFormat(text),
      selection: TextSelection.collapsed(
        offset: internationalPhoneFormat(text).length,
      ),
    );
  }
}

String? numricOnly(String? value) {
  return value?.replaceAll(RegExp(r'\D+'), '');
}
