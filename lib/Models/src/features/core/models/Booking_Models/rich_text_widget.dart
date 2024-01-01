
import 'package:flutter/material.dart';

class TicketRichTextWidget extends StatelessWidget {
  const TicketRichTextWidget({
    super.key,
    required this.title,
    required this.destination,
    required this.fontSize,
    required this.textColor,
  });

  final String title;
  final String destination;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins",
                color: Colors.grey),
          ),
          TextSpan(
            text: '\n$destination',
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
