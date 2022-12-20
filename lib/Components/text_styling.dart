import 'package:flutter/material.dart';

class BlackTextWidget extends StatelessWidget {
  const BlackTextWidget({
    Key? key,
    required this.text,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: const Color(0xFF000000),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AshTextWidget extends StatelessWidget {
  const AshTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 77, 69, 69),
        fontSize: 14.0,
      ),
    );
  }
}
