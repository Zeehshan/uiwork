import 'dart:math';

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

  static String dateTimeFormat(DateTime dateTime) {
    // Convert the UTC DateTime to local time
    DateTime localDateTime = dateTime.toLocal();

    // Format the local DateTime as a string
    String formattedDateTime =
        DateFormat("MMM dd, yyyy 'at' hh:mm a").format(localDateTime);

    return formattedDateTime;
  }

  // Function to check if the given path is a video.
  static bool isVideo(String path) {
    // List of common video file extensions.
    const videoExtensions = ['mp4', 'avi', 'mov', 'mkv', 'flv', 'wmv', 'webm'];

    // Extract the file extension from the path.
    String extension = path.split('.').last.toLowerCase();

    // Check if the file extension is in the list of video extensions.
    return videoExtensions.contains(extension);
  }

  static String removeDotFromExtension(String fileName) {
    // Get the file extension
    String extension = fileName.split('.').last;

    // If the file has an extension, remove the dot
    if (fileName.contains('.')) {
      return fileName.replaceAll('.$extension', extension);
    }

    // If there is no extension, return the original file name
    return fileName;
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ['b', 'kb', 'mb', 'gb', 'tb'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
