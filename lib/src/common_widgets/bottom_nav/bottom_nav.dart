
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luckyman_app/Screens/booking_history_screen.dart';
import 'package:luckyman_app/Screens/profile_screen.dart';

import '../../constants/text.dart';
import '../../../Screens/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);
  static const String id = '/BottomNav';

  @override
  State<BottomNav> createState() => _HomePageState();
}

class _HomePageState extends State<BottomNav> {
  List<Widget> buildScreens = [
    const HomeScreen(),
    const BookingHitory(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            activeColor: Colors.white,
            gap: 8,
            backgroundColor: Colors.lightBlue.shade100,
            tabBackgroundColor: Colors.lightBlue.shade500,
            iconSize: 30,
            selectedIndex: selectedIndex,
            onTabChange: onItemTapped,
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
      ),
      body: Center(child: buildScreens.elementAt(selectedIndex),),
    );
  }
}
