import 'package:intl/intl.dart';

class Tools {
  static String formatBytes(dynamic bytes0) {
    int bytes = 0;
    if (bytes0 is String) {
      bytes = int.tryParse(bytes0) ?? 0;
    } else if (bytes0 is int) {
      bytes = bytes0;
    }
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      double kb = bytes / 1024;
      return '${kb.toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      double mb = bytes / (1024 * 1024);
      return '${mb.toStringAsFixed(2)} MB';
    } else {
      double gb = bytes / (1024 * 1024 * 1024);
      return '${gb.toStringAsFixed(2)} GB';
    }
  }

  static String utcDateTimeFormat(String datetime) {
    String utcTimestampString = datetime;

    // Parse the UTC timestamp string into a DateTime object
    DateTime utcDateTime = DateTime.parse(utcTimestampString.split(' UTC')[0]);

    // Convert the UTC DateTime to local time
    DateTime localDateTime = utcDateTime.toLocal();

    // Format the local DateTime as a string
    String formattedDateTime =
        DateFormat("MMM dd, yyyy 'at' hh:mm a").format(localDateTime);

    return formattedDateTime;
  }
}
