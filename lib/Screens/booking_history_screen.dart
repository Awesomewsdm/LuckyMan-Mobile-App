import 'package:flutter/material.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data_widget.dart';
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
         getPrimaryAppBar(tBookingHistoryScreenTittle),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Container(
                width: 340,
                height: 490,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 3),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                child: TicketWidget(
                  width: 350,
                  height: 500,
                  isCornerRounded: true,
                  padding: const EdgeInsets.all(20),
                  child: TicketData(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
