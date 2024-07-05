import 'package:intl/intl.dart';

class AppFormatter {
  AppFormatter._();

  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
