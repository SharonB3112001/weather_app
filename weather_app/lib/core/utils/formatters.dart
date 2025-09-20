import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'es').format(date);
  }

  static String formatTemperature(double temp) {
    return "${temp.toStringAsFixed(1)} °C";
  }
}
