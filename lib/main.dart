
import 'package:angie_notebook/Screens/book_a_seat.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/bus_booking_screen.dart';
import 'Screens/bus_ticket_page.dart';
import 'Screens/payment_page.dart';
import 'Screens/seat_selection_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: const Color.fromRGBO(
          251,
          199,
          32,
          1,
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(
          250,
          250,
          250,
          1,
        ),
      ),
      initialRoute: BusTicketScreen.id,  
      routes: <String, WidgetBuilder>{
        BusTicketScreen.id: (context) => const BusTicketScreen(),
        SeatSelectionScreen.id: (context) =>  const SeatSelectionScreen(),
        PaymentPage.id: (context) => const PaymentPage(),
        BusBookingScreen.id: (context) => const BusBookingScreen(),
        SeatSectionPage.id:(context) => const SeatSectionPage(),
        BookASeatScreen.id:(context) => const BookASeatScreen(),
      },
    );
  }
}
