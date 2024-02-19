import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../enum/index.dart';

extension OnDateTime on DateTime {
  String _iniTime({required String format, Language? language}) {
    initializeDateFormatting();
    return DateFormat(format, language?.value).format(this);
  }

  String time12Only({Language? language}) => _iniTime(format: 'hh:mm a', language: language);

  String toTime24Only({Language? language}) => _iniTime(format: 'HH:mm', language: language);

  String toCurrentHour({Language? language}) => _iniTime(format: 'HH', language: language);

  String toDateOnly({Language? language}) => _iniTime(format: 'yyyy-MM-dd', language: language);

  String toTimeAndDate({Language? language}) => _iniTime(format: 'yyyy-MM-dd hh:mm a', language: language);

  String toCurrent({Language? language}) => _iniTime(format: 'yyyy-MM-dd hh:mm:ss', language: language);

  String toMonthAndDay({Language? language}) => _iniTime(format: 'dd MM', language: language);

  String toYearMonthDay({Language? language}) => _iniTime(format: 'dd MMM yyyy', language: language);

  String toBirthDateForm({Language? language}) => _iniTime(format: 'dd/MM/yyyy', language: language);

  String toNameOfDayAndMonth({Language? language}) => _iniTime(format: 'EEEE, MMM dd', language: language);

  String toNameOfMonthAndTime({Language? language}) => _iniTime(format: 'MMM dd hh:mm a', language: language);

  int get toTimeStamp => millisecondsSinceEpoch;

  int get toTimeStampForHours => DateTime(year, 0, 0, hour, minute, second).millisecondsSinceEpoch;

  // String timeAgo(BuildContext context) {
  //   Duration diff = DateTime.now().difference(this);
  //   Ago messages = context.isAr ? AgoAr() : AgoEn();
  //   if (diff.inDays > 365) {
  //     return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? messages.year : messages.years} ${messages.ago}";
  //   }
  //   if (diff.inDays > 30) {
  //     return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? messages.month : messages.months} ${messages.ago}";
  //   }
  //   if (diff.inDays > 7) {
  //     return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? messages.week : messages.weeks} ${messages.ago}";
  //   }
  //   if (diff.inDays > 0) {
  //     return "${diff.inDays} ${diff.inDays == 1 ? messages.day : messages.days} ${messages.ago}";
  //   }
  //   if (diff.inHours > 0) {
  //     return "${diff.inHours} ${diff.inHours == 1 ? messages.hour : messages.hours} ${messages.ago}";
  //   }
  //   if (diff.inMinutes > 0) {
  //     return "${diff.inMinutes} ${diff.inMinutes == 1 ? messages.minute : messages.minutes} ${messages.ago}";
  //   }
  //   return messages.justNow;
  // }
}
