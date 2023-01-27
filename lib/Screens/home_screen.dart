import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/Screens/bus_booking_screen.dart';
import 'package:luckyman_app/src/common_widgets/user_info/user_profile_image.dart';

import '../src/constants/image_strings.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height,
                decoration: kHomeBackgroundBoxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              AshTextWidget(
                                text: 'Welcome, ',
                                fontSize: 18,
                              ),
                              BlackTextWidget(
                                text: 'Awesome Wisdom',
                                fontSize: 25,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                        ),
                        const UserProfileImage(
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const BlackTextWidget(
                      text: 'What would you like to do?',
                      fontSize: 20,
                    ),
                    Expanded(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          crossAxisCount: 2,
                        ),
                        children: [
                          HomeWidget(
                            imageLink: tBusIcon,
                            label: 'Book Bus Ticket',
                            onTap: () {
                              Get.to(
                                () => BusBookingScreen(),
                              );
                            },
                          ),
                          HomeWidget(
                            imageLink: tTourIcon,
                            label: 'Go On Tour',
                            onTap: () {},
                          ),
                          HomeWidget(
                            imageLink: tLuggagesIcon,
                            label: 'Luggage Storage',
                            onTap: () {},
                          ),
                          HomeWidget(
                            imageLink: tLuggageTransport,
                            label: 'Luggage Transportation',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required this.label,
    required this.imageLink,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final String imageLink;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 80.0,
        width: 80.0,
        decoration: kSeatScreenBoxDecoration,
        duration: const Duration(seconds: 200),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(imageLink),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
