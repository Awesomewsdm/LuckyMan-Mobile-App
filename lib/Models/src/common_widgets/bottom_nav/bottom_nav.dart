import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luckyman_app/src/common_widgets/alerts/alert_dialog.dart';
import 'package:luckyman_app/src/features/core/screens/booking_history_screen.dart';
import 'package:luckyman_app/src/features/core/screens/home_screen.dart';
import 'package:luckyman_app/src/features/core/screens/profile_screen.dart';
import 'package:upgrader/upgrader.dart';
import '../../constants/text.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  static const String id = '/BottomNav';

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List<Widget> buildScreens = [
    const HomeScreen(),
    BookingHistory(),
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
    Future<bool> showExitPopUp() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
              contentLabel: "Do you want to exit the App?",
              title: "Exit App",
              onpressed: () => SystemNavigator.pop(),
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopUp,
      child: UpgradeAlert(
        child: Scaffold(
          backgroundColor: Colors.blue,
          bottomNavigationBar: Container(
            color: Colors.lightBlue[100],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: GNav(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
          body: buildScreens.elementAt(selectedIndex),
        ),
      ),
    );
  }
}
