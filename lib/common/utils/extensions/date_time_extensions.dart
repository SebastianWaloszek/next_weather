import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format() {
    return DateFormat('EEEE, MMM d').format(this);
  }

  String dayOfWeekAbbreviated() {
    return DateFormat('EE').format(this);
  }

  bool isSameDay(DateTime other) {
    return other != null && other.year == year && other.month == month && other.day == day;
  }
}
