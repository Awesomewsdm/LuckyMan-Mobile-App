extension StringExtension on String {
  String limitToLetters(int letterLimit) {
    if (length <= letterLimit) {
      return this;
    } else {
      return substring(0, letterLimit);
    }
  }
}
