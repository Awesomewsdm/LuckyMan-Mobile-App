import 'package:flutter/material.dart';
import 'package:luckyman_app/src/constants/text.dart';

class BookingHitory extends StatelessWidget {
  const BookingHitory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        toolbarOpacity: 0.7,
        bottomOpacity: 0.8,
        title: const Text(tBookingHistoryScreenTittle,
            style: TextStyle(color: Colors.blue)),
      ),
      body: const Center(
        child: Text('History Booking Screen'),
      ),
    );
  }
}
