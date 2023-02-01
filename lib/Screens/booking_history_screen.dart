import 'package:flutter/material.dart';
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
