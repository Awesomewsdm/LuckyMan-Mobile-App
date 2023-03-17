import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart'
    deferred as home;
import 'package:luckyman_app/src/features/authentification/screens/login/login_screen.dart'
    deferred as login;
import 'package:luckyman_app/src/features/authentification/screens/password_reset/password_reset.dart'
    deferred as forgotpassword;
import 'package:luckyman_app/src/features/authentification/screens/sign_up/widgets/sign_up_screen.dart'
    deferred as signup;
import 'package:luckyman_app/src/features/core/screens/bus_booking_screen.dart'
    deferred as busselection;
import 'package:luckyman_app/src/features/core/screens/profile_screen.dart'
    deferred as profile;
import 'package:luckyman_app/src/features/core/screens/seat_selection_screen.dart'
    deferred as seatselection;
import 'package:luckyman_app/src/features/core/screens/reservation_details_screen.dart'
    deferred as reservationscreen;
import 'package:luckyman_app/src/features/core/screens/booking_history_screen.dart'
    deferred as bookingscreen;
import 'package:luckyman_app/src/features/core/screens/splash_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'deffered_loader.dart';

class Routes {
  static String homePage = 'HomePage';
  static String profilePage = 'Profile Page';
  static String bookingHistoryPage = 'Booking History Page';
  static String reservationPage = 'Reservation Page';
  static String seatSelectionPage = 'Seat Selection Page';
  static String busSelectionPage = 'Bus Selection Page';
  static String loginPage = 'Login Page';
  static String signUpPage = 'SignUp Page';
  static String forgotPasswordPage = 'Forgot Password Page';
  static String splashPage = 'Splash Page';

  static final routes = <QRoute>[
    QRoute(name: splashPage, path: '/', builder: () => const SplashScreen()),
    QRoute(
      name: homePage,
      path: '/home',
      builder: () => home.Home(),
      middleware: [
        DefferedLoader(home.loadLibrary),
      ],
    ),
    QRoute(
      name: profilePage,
      path: '/profile',
      builder: () => profile.ProfileScreen(),
      middleware: [
        DefferedLoader(profile.loadLibrary),
      ],
    ),
    QRoute(
      name: loginPage,
      path: '/login',
      builder: () => login.LoginScreen(),
      middleware: [
        DefferedLoader(login.loadLibrary),
      ],
    ),
    QRoute(
      name: signUpPage,
      path: '/signup',
      builder: () => signup.SignUpScreen(),
      middleware: [
        DefferedLoader(signup.loadLibrary),
      ],
    ),
    QRoute(
      name: forgotPasswordPage,
      path: '/forgot-password',
      builder: () => forgotpassword.PasswordResetScreen(),
      middleware: [
        DefferedLoader(forgotpassword.loadLibrary),
      ],
    ),
    QRoute(
      name: seatSelectionPage,
      path: '/seat-selection',
      builder: () => seatselection.SeatSelectionScreen(),
      middleware: [
        DefferedLoader(seatselection.loadLibrary),
      ],
    ),
    QRoute(
      name: busSelectionPage,
      path: '/reservation-screen',
      builder: () => reservationscreen.BusTicketScreen(),
      middleware: [
        DefferedLoader(reservationscreen.loadLibrary),
      ],
    ),
    QRoute(
      name: bookingHistoryPage,
      path: '/booking-history',
      builder: () => bookingscreen.BookingHistory(),
      middleware: [
        DefferedLoader(bookingscreen.loadLibrary),
      ],
    ),
  ];
}
