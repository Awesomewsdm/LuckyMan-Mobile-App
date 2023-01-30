import 'package:flutter/material.dart';
import 'package:luckyman_app/Screens/bus_booking_screen.dart';
import 'package:luckyman_app/Screens/bus_ticket_screen.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BookingHitory extends StatelessWidget {
  const BookingHitory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Column(
        children: [
          AppBar(
            iconTheme: const IconThemeData(color: Colors.blue),
            elevation: 20.0,
            backgroundColor: Colors.white,
            toolbarHeight: 60,
            centerTitle: true,
            toolbarOpacity: 0.7,
            bottomOpacity: 0.8,
            shadowColor: Colors.white10,
            title: const Text(tBookingHistoryScreenTittle,
                style: TextStyle(color: Colors.blue)),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: TicketWidget(
                shadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 3),
                    blurRadius: 5.0,
                    spreadRadius: 10.0,
                  ),
                ],
                width: 350,
                height: 500,
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
