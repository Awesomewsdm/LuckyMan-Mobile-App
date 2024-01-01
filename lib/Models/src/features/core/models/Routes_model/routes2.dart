import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart'
    deferred as home;
import 'package:luckyman_app/src/features/authentification/screens/login/login_screen.dart'
    deferred as login;
import 'package:luckyman_app/src/features/authentification/screens/password_reset/password_reset.dart'
    deferred as forgotpassword;
import 'package:luckyman_app/src/features/authentification/screens/sign_up/widgets/sign_up_screen.dart'
    deferred as signup;
import 'package:luckyman_app/src/features/core/models/Routes_model/routes.dart';
import 'package:luckyman_app/src/features/core/screens/bus_booking_screen.dart'
    deferred as busselection;
import 'package:luckyman_app/src/features/core/screens/profile_screen.dart'
    deferred as profile;
import 'package:luckyman_app/src/features/core/screens/splash_screen.dart';
import 'package:luckyman_app/src/features/core/screens/booking_history_screen.dart'
    deferred as bookinghistory;
import 'package:luckyman_app/src/features/core/screens/reservation_details_screen.dart'
    deferred as reservationscreen;

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

  static final routes = <GetPage>[
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
      name: homePage,
      page: () => home.Home(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: profilePage,
      page: () => profile.ProfileScreen(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: loginPage,
      page: () => login.LoginScreen(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: signUpPage,
      page: () => signup.SignUpScreen(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: forgotPasswordPage,
      page: () => forgotpassword.PasswordResetScreen(),
      middlewares: [RouteGuard()],
    ),
    // GetPage(
    //   name: seatSelectionPage,
    //   page: () => seatselection.SeatSelectionScreen(),
    //   middlewares: [RouteGuard()],
    // ),
    GetPage(
      name: reservationPage,
      page: () => reservationscreen.BusTicketScreen(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: busSelectionPage,
      page: () => busselection.BusBookingScreen(),
      middlewares: [RouteGuard()],
    ),
    GetPage(
      name: bookingHistoryPage,
      page: () => bookinghistory.BookingHistory(),
      middlewares: [RouteGuard()],
    ),
  ];
}
