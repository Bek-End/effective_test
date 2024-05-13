import 'package:intl/intl.dart';

extension DateTimeExtentions on DateTime {
  String get inDDMMMM => DateFormat('dd MMMM').format(this);
  String get inDDMMM => DateFormat('dd MMM').format(this);
  String get weekdayName => DateFormat('E').format(this);
}
