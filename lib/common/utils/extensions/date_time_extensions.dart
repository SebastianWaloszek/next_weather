import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format() {
    return DateFormat('EEEE, MM DD YYYY').format(this);
  }

  String dayOfWeekAbbreviated() {
    return DateFormat('EE').format(this);
  }
}
