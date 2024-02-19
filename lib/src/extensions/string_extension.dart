import 'package:easy_localization/easy_localization.dart';
import './date_extension.dart';

extension StringExtension on String {
  String get toCamelCase => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get translate => this.tr();
}

extension DateStringExtension on String {
  String get toDateOnly => DateTime.tryParse(this)?.toDateOnly() ?? '';

  String get toDateAndTime => DateTime.tryParse(this)?.toNameOfDayAndMonth() ?? '';

  String get toNameOfMonthAndTime => DateTime.tryParse(this)?.toNameOfMonthAndTime() ?? '';

  // String ago(BuildContext context) => DateTime.parse(this).timeAgo(context);

  String get toTimeOnly => DateTime.tryParse(this)?.time12Only() ?? '';

  String get toMonthAndDay => DateTime.tryParse(this)?.toMonthAndDay() ?? '';

  String get toYearMonthDay => DateTime.tryParse(this)?.toBirthDateForm() ?? '';
}
