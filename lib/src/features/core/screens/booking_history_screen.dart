import 'package:flutter/material.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data_widget.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);
  static const id = "/BookingHistory";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Column(
        children: [
          getPrimaryAppBar(tBookingHistoryScreenTittle),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: TicketWidget(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                isCornerRounded: true,
                padding: EdgeInsets.all(20),
                child: TicketData(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
