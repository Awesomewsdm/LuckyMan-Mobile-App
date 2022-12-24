
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'Screens/bus_booking_screen.dart';
import 'Screens/bus_ticket_page.dart';
import 'Screens/home_screen.dart';
import 'Screens/payment_page.dart';
import 'Screens/seat_selection_page.dart';
import 'Screens/splash_screen.dart';
import 'Screens/splash_screen_2.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      initialRoute: SplashScreen2.id,  
      routes: <String, WidgetBuilder>{
        SplashScreen2.id:(context) => const SplashScreen2(),
        SplashScreen.id:(context) => const SplashScreen(),
        HomeScreen.id:(context) => const HomeScreen(),
        BusTicketScreen.id: (context) => const BusTicketScreen(),
        SeatSelectionScreen.id: (context) =>  const SeatSelectionScreen(),
        PaymentPage.id: (context) => const PaymentPage(),
        BusBookingScreen.id: (context) => const BusBookingScreen(),
        SeatSectionPage.id:(context) => const SeatSectionPage(),
      },
    );
  }
}
