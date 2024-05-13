import 'package:intl/intl.dart';

extension DateTimeExtentions on DateTime {
  String get inDDMMMM => DateFormat('dd MMMM').format(this);
}
