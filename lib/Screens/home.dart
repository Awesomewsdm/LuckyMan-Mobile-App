import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Screens/booking_history_screen.dart';
import 'package:luckyman_app/Screens/profile_screen.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:luckyman_app/src/features/authentification/controllers/home_screen_controllers.dart';

import '../../../Screens/home_screen.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
  static const String id = '/Home';

 final List<Widget> buildScreens = [
    const HomeScreen(),
    const BookingHitory(),
    const ProfileScreen(),
  ];

final HomeScreenController homeScreencontroller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNav(homeScreencontroller: homeScreencontroller),
      body: Center(
        child: buildScreens.elementAt(homeScreencontroller.selectedIndex.value),
      ),
    );
  }
}