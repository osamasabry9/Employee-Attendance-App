import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return formatDate(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  static int calculateDuration(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static int calculateWorkingDays(DateTime startDate, DateTime endDate) {
    int workingDays = 0;

    // Loop through each day between the start date and the end date
    for (DateTime date = startDate; date.isBefore(endDate) || date.isAtSameMomentAs(endDate); date = date.add(const Duration(days: 1))) {
      // Check if the day is a weekday (Monday to Friday)
      if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
        workingDays++;
      }
    }

    return workingDays;
  }
}
