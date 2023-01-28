

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/authentification/controllers/home_screen_controllers.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.homeScreencontroller,
  }) : super(key: key);

  final HomeScreenController homeScreencontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: GNav(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          activeColor: Colors.white,
          gap: 8,
          backgroundColor: Colors.lightBlue.shade100,
          tabBackgroundColor: Colors.lightBlue.shade500,
          iconSize: 30,
          selectedIndex: homeScreencontroller.selectedIndex.value,
          onTabChange: homeScreencontroller.onItemTapped(homeScreencontroller.selectedIndex.value),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: tHomeIconName,
            ),
            GButton(
              icon: Icons.history_outlined,
              text: tHistoryIconName,
            ),
            GButton(
              icon: Icons.person_outline_outlined,
              text: tProfileIconName,
            ),
          ],
        ),
      ),
    );
  }
}
