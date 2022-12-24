import 'package:angie_notebook/Components/widgets.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/bus_ticket_page.dart';
import 'package:angie_notebook/src/features/authentification/screens/login_screen.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../src/features/authentification/screens/sign_up_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  List<Widget> buildScreens() {
    return [
      const BusTicketScreen(),
      const SeatSelectionScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CirclesBackgroundPage(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                ' Welcome Awesome',
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: Container(
                  decoration: kHomeBackgroundBoxDecoration,
                  child: GridView(
                      padding: const EdgeInsets.all(20.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 20.0,
                              crossAxisCount: 2),
                      children: [
                        Navigate(
                          onTap: () {
                            Get.to(
                              () => const BusTicketScreen(),
                            );
                          },
                          label: 'Bus Ticket Screen',
                        ),
                        Navigate(
                          onTap: () {
                            Get.to(
                              () => const LoginScreen(),
                            );
                          },
                          label: 'Login Screen',
                        ),
                        const SizeBoz(
                          label: 'Login Page',
                        ),
                        Navigate(
                          onTap: () {
                            Get.to(
                              () => const SignUpScreen(),
                            );
                          },
                          label: 'Sign-Up Screen',
                        ),
                        const SizeBoz(),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Navigate extends StatelessWidget {
  const Navigate({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizeBoz(
          label: label,
        ));
  }
}

class SizeBoz extends StatelessWidget {
  const SizeBoz({
    Key? key,
    this.label = 'Book Bus Seat',
  }) : super(key: key);
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80.0,
      decoration: kSeatScreenBoxDecoration,
      child: Column(
        children: [
          const Expanded(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/man-with-guiter.jpg'),
            ),
          ),
          Text(
            label!,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
