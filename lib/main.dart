import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luckyman_app/Screens/seat_selection_screen.dart';
import 'Screens/bus_booking_screen.dart';
import 'Screens/reservation_details_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/payment_page.dart';
import 'Screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'src/repository/authentification/authentification_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(
      AuthenticationRepository(),
    ),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       statusBarColor: Colors.blue,
    //       systemNavigationBarColor: Colors.lightBlue[100]),
    // );
    return GetMaterialApp(
      theme: ThemeData(
       
        scaffoldBackgroundColor: const Color.fromRGBO(
          250,
          250,
          250,
          1,
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        BusTicketScreen.id: (context) => BusTicketScreen(),
        SeatSelectionScreen.id: (context) => SeatSelectionScreen(),
        PaymentPage.id: (context) => const PaymentPage(),
        BusBookingScreen.id: (context) => BusBookingScreen(),
      },
    );
  }
}
