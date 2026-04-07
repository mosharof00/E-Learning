import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/services/local_store_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HelperUtils {
  static String formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) {
      return '';
    }

    DateTime date = timestamp.toDate();

    Duration difference = DateTime.now().difference(date);

    if (difference.inDays > 0) {
      String time = DateFormat('dd MMM yyy, h:mm a').format(date);
      return time;
    } else {
      String time = DateFormat('h:mm a').format(date);
      if (difference.inHours > 23) {
        return "Yesterday $time";
      } else {
        return time;
      }
    }
  }

  static Locale locateLanguage() {
    return Locale(language(), language().toUpperCase());
  }

  static String language() {
    return HiveService.getLanguage().split('_')[0] ?? 'en';
  }
}
