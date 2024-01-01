extension StringUtil on String {
  String get capitalizeFirstLetter {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension DateTimeUtil on DateTime {
  String get dateAndTimeFormat {
    return "$year - $month - $day";
  }
}
