import 'dart:io';

import 'package:an_core_ui/src/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';

class AppDateTimePicker {
  static Future<void> datePicker(
    BuildContext context,
    ValueChanged<DateTime?> onChange, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool iOSOnly = false,
  }) async {
    if (!iOSOnly && Platform.isAndroid) {
      final date = await _androidDatePicker(context, firstDate: firstDate, lastDate: lastDate, initialDate: initialDate);
      onChange(date);
    } else {
      await iosPicker(
        context,
        CupertinoDatePickerMode.date,
        (date) => onChange(date),
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      );
    }
  }

  static Future<DateTime?> _androidDatePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      return picked;
    } else {
      return null;
    }
  }

  static Future<void> iosPicker(
    BuildContext context,
    CupertinoDatePickerMode mode,
    ValueChanged<DateTime> onChange, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        return SafeArea(
          child: AppContainer(
            marginLeft: 12.w,
            marginRight: 12.w,
            marginBottom: 12.h,
            color: Colors.white,
            borderRadius: 12,
            height: 0.3.sh,
            child: Column(
              children: [
                12.heightBox,
                AppContainer(
                  color: Colors.grey.shade300,
                  borderRadius: 12.r,
                  height: 6.h,
                  width: .2.sw,
                ),
                Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      24.widthBox,
                      AppText(
                        'cancel'.translate,
                        size: 18.sp,
                        color: Colors.grey,
                        onTap: context.pop,
                      ),
                      const Spacer(),
                      AppText(
                        'ok'.translate,
                        size: 18.sp,
                        color: Colors.blue,
                        onTap: context.pop,
                      ),
                      24.widthBox,
                    ],
                  ),
                ),
                24.heightBox,
                Expanded(
                  child: CupertinoDatePicker(
                    mode: mode,
                    initialDateTime: initialDate ?? lastDate ?? DateTime.now(),
                    minimumDate: firstDate ?? DateTime.now(),
                    maximumDate: lastDate ?? DateTime(2100),
                    onDateTimeChanged: onChange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///---------------------------------    ----------------------------------------
  static Future<void> timePicker(BuildContext context, ValueChanged<DateTime?> onChange) async {
    if (Platform.isAndroid) {
      final date = await _androidTimePicker(context);
      onChange(date);
    } else {
      await iosPicker(context, CupertinoDatePickerMode.time, (date) => onChange(date));
    }
  }

  static Future<DateTime?> _androidTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      return dateTime;
    } else {
      return null;
    }
  }

  ///-------------------------------------------------------------------------
  static Future<void> dateTimeRangePicker(BuildContext context, ValueChanged<DateTimeRange?> onChange) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
      ),
      locale: Locale(context.getLanguage.value),
      cancelText: 'cancel'.translate,
      confirmText: 'ok'.translate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Colors.grey,
              onSurface: Colors.black,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.grey,
              constraints: BoxConstraints(maxWidth: .9.sw, maxHeight: .8.sh),
              child: child!,
            ),
          ),
        );
      },
    );
    onChange(picked);
  }
}
