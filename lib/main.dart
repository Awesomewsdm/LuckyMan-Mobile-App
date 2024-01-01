import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luckyman_app/src/features/authentification/screens/password_reset/password_reset.dart';
import 'package:luckyman_app/src/features/core/models/utils/dynamic_links_services.dart';
import 'package:luckyman_app/src/features/core/screens/bus_booking_screen.dart';
import 'package:luckyman_app/src/features/core/screens/payment_confirmation_screen.dart';
import 'package:luckyman_app/src/features/core/screens/seat_selection_screen.dart';
import 'package:luckyman_app/src/features/core/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'src/features/core/models/utils/Networking/network_status.dart';
import 'src/features/core/screens/home_screen.dart';
import 'src/features/core/screens/reservation_details_screen.dart';
import 'src/repository/authentification/authentification_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void initState() {
    super.initState();

    DynamicLinkHandler().initDynamicLinks();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;

      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = _source.values.toList()[0]
              ? 'Mobile Data is On'
              : 'Mobile Data is Off';
          break;
        case ConnectivityResult.wifi:
          string =
              _source.values.toList()[0] ? 'WiFi is On' : 'WiFi is Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }
      Get.snackbar('', 'Your $string');
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       statusBarColor: Colors.blue,
    //       systemNavigationBarColor: Colors.lightBlue[100]),
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
        BusTicketScreen.id: (context) => const BusTicketScreen(),
        SeatSelectionScreen.id: (context) => const SeatSelectionScreen(),
        BusBookingScreen.id: (context) => const BusBookingScreen(),
        PasswordResetScreen.id: (context) => PasswordResetScreen(),
        PasswordResetScreen.id: (context) => PasswordResetScreen(),
        PaymentConfirmationScreen.id: (context) =>
            const PaymentConfirmationScreen(),
      },
    );
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}
