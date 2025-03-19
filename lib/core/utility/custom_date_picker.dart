import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import '../../config/config.dart';
import '../init/navigation/navigation.dart';
import '../widget/app_button.dart';

Future<DateTime?> buildShowRoundedDatePicker(
  BuildContext context, {
  DateTime? initialDate,
  bool Function(DateTime value)? selectableDayPredicate,
  bool Function(DateTime, bool)? onTapDay,
  String description = "",
  List<DateTime>? listDateDisabled,
  bool noFutureDate = false,
  bool dupDate = false,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  DateTime dateTime = DateTime.now();
  DateTime now = DateTime(dateTime.year, dateTime.month, dateTime.day);
  DateTime initialDateLocal =
      initialDate != null
          ? DateTime(initialDate.year, initialDate.month, initialDate.day)
          : now;
  DateTime? startDateLocal =
      startDate != null
          ? DateTime(startDate.year, startDate.month, startDate.day)
          : null;
  DateTime? endDateLocal =
      endDate != null
          ? DateTime(endDate.year, endDate.month, endDate.day)
          : null;
  MaterialRoundedYearPickerStyle textYearPickerStyle() =>
      MaterialRoundedYearPickerStyle(
        backgroundPicker: AppColors.instance.white,
        heightYearRow: 50,
        textStyleYear: AppTextStyle(context).kHeadline6,
        textStyleYearSelected: AppTextStyle(context).kSubTitle1,
      );

  MaterialRoundedDatePickerStyle textDatePickerStyle() =>
      MaterialRoundedDatePickerStyle(
        backgroundPicker: AppColors.instance.white,
        backgroundHeader: AppColors.instance.white,
        textStyleYearButton: AppTextStyle(context).kSubTitle1,
        textStyleDayButton: AppTextStyle(
          context,
        ).kSubTitle1.copyWith(fontWeight: FontWeight.bold),
        textStyleMonthYearHeader: AppTextStyle(
          context,
        ).kSubTitle2.copyWith(fontWeight: FontWeight.bold),
        colorArrowNext: AppColors.instance.primary,
        colorArrowPrevious: AppColors.instance.primary,
        sizeArrow: context.iconSizeArrowDatePicker,
        textStyleDayHeader: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
        textStyleDayOnCalendar: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
        textStyleCurrentDayOnCalendar: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
        textStyleDayOnCalendarSelected: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(fontWeight: FontWeight.bold),
        textStyleButtonPositive: AppTextStyle(context).kBodyDefault.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.instance.primary,
        ),
        textStyleButtonNegative: AppTextStyle(context).kBodyDefault.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.instance.primary,
        ),
        textStyleButtonAction: AppTextStyle(context).kBodyDefault,
        textStyleDayOnCalendarDisabled: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(color: AppColors.instance.disable),
        paddingDatePicker: EdgeInsets.symmetric(
          horizontal: context.defaultValue,
        ),
        decorationDateSelected: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.instance.primary,
        ),
      );
  return showRoundedDatePicker(
    context: context,
    initialDate: initialDateLocal,
    height: context.height * 0.4,
    borderRadius: 15,
    era: EraMode.BUDDHIST_YEAR,
    selectableDayPredicate:
        (selectableDayPredicate == null && noFutureDate)
            ? startDate != null
                ? (DateTime value) {
                  if (value.isBefore(DateTime.now())) {
                    if (value.isAfter(startDate)) {
                      return false;
                    }
                    return true;
                  } else {
                    return false;
                  }
                }
                : endDate != null
                ? (DateTime value) {
                  if (value.isBefore(DateTime.now())) {
                    if (value.isBefore(endDate)) {
                      return false;
                    }
                    return true;
                  } else {
                    return false;
                  }
                }
                : (DateTime value) {
                  if (value.isBefore(DateTime.now())) {
                    return true;
                  } else {
                    return false;
                  }
                }
            : selectableDayPredicate,
    description: description,
    listDateDisabled: listDateDisabled,
    onTapDay: onTapDay,
    styleYearPicker: textYearPickerStyle(),
    styleDatePicker: textDatePickerStyle(),
    firstDate:
        (noFutureDate && dupDate)
            ? startDate != null
                ? DateTime(1900)
                : endDate != null
                ? endDateLocal
                : DateTime(1900)
            : DateTime(1900),
    lastDate:
        (noFutureDate && dupDate)
            ? startDate != null
                ? startDateLocal
                : now
            : noFutureDate
            ? now
            : DateTime(2100),
  );
}

Future<TimeOfDay?> buildShowTimePicker(
  BuildContext context, {
  TimeOfDay? initialTime,
}) {
  return showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (context, childWidget) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: childWidget!,
      );
    },
  );
}

Future<DateTime?> buildShowCupertinoTimePicker(
  BuildContext context, {
  required DateTime initialTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) {
  DateTime? tempSelectedTime;
  return showCupertinoModalPopup<DateTime?>(
    barrierDismissible: false,
    context: context,
    builder:
        (_) => Container(
          margin: context.paddingLow3x,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: context.height / 2.5,
                margin: context.onlyBottomPaddingLow,
                decoration: BoxDecoration(
                  color: AppColors.instance.white,
                  borderRadius: BorderRadius.circular(context.alertDialog),
                ),
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    primaryColor: AppColors.instance.white,
                  ),
                  child: CupertinoDatePicker(
                    itemExtent: 40,
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      initialTime.hour,
                      initialTime.minute,
                    ),
                    minimumDate:
                        minimumDate == null
                            ? null
                            : DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              minimumDate.hour,
                              minimumDate.minute,
                            ),
                    maximumDate: maximumDate,
                    onDateTimeChanged: (val) {
                      tempSelectedTime = val;
                    },
                  ),
                ),
              ),
              AppButton.submit(
                context,
                text: "ยืนยัน",
                onPressed: () {
                  AppNav.pop(context, result: tempSelectedTime ?? initialTime);
                },
              ),
            ],
          ),
        ),
  );
}
