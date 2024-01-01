import 'dart:math';

String generateRandomRef(int refLength) {
  final random = Random();
  const allChars =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789";
  final randomString = List.generate(
    refLength,
    (index) => allChars[random.nextInt(allChars.length)],
  ).join();
  return randomString;
}
 