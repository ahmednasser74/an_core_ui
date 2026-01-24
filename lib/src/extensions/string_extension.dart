import 'package:easy_localization/easy_localization.dart';
import './date_extension.dart';

extension StringExtension on String {
  String get toCamelCase => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get firstChar => isNotEmpty ? trim().split(' ').map((l) => l[0]).take(2).join() : '';

  String get capitalizeFirstChar => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  bool get isUrl => startsWith('http://') || startsWith('https://');

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

  String get toNameOfDayMonthYearTime => DateTime.tryParse(this)?.toNameOfDayMonthYearTime() ?? '';
}

extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNull => this != null;
}
