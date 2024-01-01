//  z                                                                                                                                                                                                                                                                                                   
import 'package:flutter/material.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/rich_text_widget.dart';

  class TicketHistoryWidget extends StatelessWidget {
  const TicketHistoryWidget({
    super.key,
    required this.title,
    required this.destination,
    required this.icon,
    required this.circledAvatarColor,
    required this.fontSize,
    required this.textColor,
  });

  final String title;
  final String destination;
  final IconData icon;
  final Color circledAvatarColor;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: circledAvatarColor,
          child: Icon(
            color: Colors.white,
            icon,
            size: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TicketRichTextWidget(
          title: title,
          destination: destination,
          fontSize: fontSize,
          textColor: textColor,
        ),

        // Text.rich(textAlign: "From \n Accra")
      ],
    );
  }
}