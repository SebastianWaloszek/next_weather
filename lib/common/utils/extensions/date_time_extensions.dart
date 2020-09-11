import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String dayOfWeek() {
    return DateFormat('EEEE').format(this);
  }

  String format() {
    return DateFormat('d MMM yyyy').format(this);
  }

  String dayOfWeekAbbreviated() {
    return DateFormat('EE').format(this);
  }

  bool isSameDay(DateTime other) {
    return other != null && other.year == year && other.month == month && other.day == day;
  }
}
