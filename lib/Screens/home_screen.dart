import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/bus_ticket_page.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
      bottomNavigationBar: const PersistentBottomNavBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFF10A2E0),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.blueAccent.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage('assets/images/Intercity-STC-Coaches.jpg'),
          ),
        ),
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
                
                decoration: kBackgroundBoxDecoration,
                child: GridView(
                    padding: const EdgeInsets.all(20.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            crossAxisCount: 2),
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const BusTicketScreen());
                          },
                          child: const SizeBoz()),
                      const SizeBoz(),
                      const SizeBoz(),
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

class SizeBoz extends StatelessWidget {
  const SizeBoz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(255, 190, 138, 248),
      height: 80,
      width: 80.0,
      decoration: kSeatScreenBoxDecoration,
      child: Column(
        children: const [
          Expanded(
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/Intercity-STC-Coaches.jpg'),
            ),
          ),
          Text(
            'Book Bus Seat',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}


// Image.asset('assets/images/man-with-guiter.jpg', height: 50, width: 50,),