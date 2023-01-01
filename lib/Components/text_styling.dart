import 'package:flutter/material.dart';

class BlackTextWidget extends StatelessWidget {
  const BlackTextWidget( {
    Key? key,
    required this.text,
    this.fontSize, this.color =  const Color(0xFF000000) ,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color ,
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
    required this.text, this.fontSize =  14.0,
  }) : super(key: key);
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        color:const Color.fromARGB(255, 77, 69, 69),
        fontSize: fontSize,
      ),
    );
  }
}
