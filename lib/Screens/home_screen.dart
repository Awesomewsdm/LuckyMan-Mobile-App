import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/bus_ticket_page.dart';
import 'package:angie_notebook/Screens/profile_screen.dart';
import 'package:angie_notebook/src/features/authentification/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/features/authentification/screens/sign_up_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                            () =>  SignUpScreen(),
                          );
                        },
                        label: 'Sign-Up Screen',
                      ),
                      Navigate(
                        onTap: () {
                          Get.to(
                            () => const ProfileScreen(),
                          );
                        },
                        label: 'Profile Screen',
                      ),
                      const SizeBoz(),
                    ]),
              ),
            ),
          ],
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
