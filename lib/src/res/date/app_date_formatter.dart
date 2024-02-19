import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../enum/index.dart';

class AppDateFormatter {
  static const String DMMY = 'dd MMMM yyyy';
  static const String HHMMSS = 'hh:mm:ss';
  static const String HHMMA = 'hh:mm a';
  static const String yearMonthDay = 'yyyy-MM-dd';
  static const String yearMothDayTime = 'yyyy-MM-ddThh:mm:ss';
  static const String yearMothDayTimeTime = 'dd-MM-yyyy hh:mm:ss a';
  static const String yayMonthYearTime = 'dd MMMM yyyy hh:mm a';
  static const FORMAT_E_D_MMM_YYYY = 'E d MMM yyyy';

  static String formatDate({
    required date,
    Language language = Language.en,
    String dateFormatting = yearMonthDay,
  }) {
    initializeDateFormatting();
    return DateFormat(dateFormatting, language.value).format(date.runtimeType == DateTime ? date : DateTime.parse(date));
  }
}
