import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension StringDateFormat on String {
  String formatDate({String inputFormat="yyyy-MM-dd",String outputFormat = "dd.MM.yyyy"}) {
    try {
      final inputFormatter=DateFormat(inputFormat);

      final formatter =
      DateFormat(outputFormat, Get.locale?.languageCode);
      final date=inputFormatter.parse(this);

      return formatter.format(date.toLocal());
    } catch (exception) {
      print(exception.toString());
      return "";
    }
  }
}
