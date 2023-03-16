import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:luckyman_app/src/features/core/screens/splash_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  static String homePage = 'HomePage';
  static String profilePage = 'ProfilePage';
  static String bookingHistoryPage = 'BookingHistoryPage';
  static String reservationPage = 'ReservationPage';
  static String seatBookingPage = 'SeatBookingPage';
  static String busSelectionPage = 'BusSelectionPage';
  static String loginPage = 'LoginPage';
  static String signUpPage = 'SignUpPage';
  static String forgotPasswordPage = 'ForgotPasswordPage';
  static String splashPage = 'SplashPage';

  final routes = [
    QRoute(
      name: splashPage,
      path: '/SplashPage',
      builder: () => const SplashScreen(),
      children: [
        QRoute(
          ///use the name to route using `QR.toName`-kkkkkkkk
          name: homePage,
          path: '/HomePage',
          builder: () => const Home(),
        ),
      ],
    ),
  ];
}
