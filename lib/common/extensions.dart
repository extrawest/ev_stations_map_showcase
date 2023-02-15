extension FirstLetterCapital on String {
  String get firstCapital => this[0].toUpperCase() + substring(1);
}
