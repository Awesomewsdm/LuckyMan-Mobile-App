import 'package:angie_notebook/Components/text_styling.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/bus_booking_screen.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:angie_notebook/src/common_widgets/user_info/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        Column(
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
                        const Expanded(
                          child: UserProfileImage(
                            width: 50,
                            height: 80,
                          ),
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
                                const BusBookingScreen(),
                              );
                            },
                          ),
                          HomeWidget(
                            imageLink: tTourIcon,
                            label: 'Go On Tour',
                            onTap: () {
                              Get.to(
                                 const SeatSelectionScreen(),
                              );
                            },
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GridDashboard extends StatelessWidget {
//   Items item1 = new Items(
//       title: "Calendar",
//       subtitle: "March, Wednesday",
//       event: "3 Events",
//       img: "assets/calendar.png");

//   Items item2 = new Items(
//     title: "Groceries",
//     subtitle: "Bocali, Apple",
//     event: "4 Items",
//     img: "assets/food.png",
//   );
//   Items item3 = new Items(
//     title: "Locations",
//     subtitle: "Lucy Mao going to Office",
//     event: "",
//     img: "assets/map.png",
//   );
//   Items item4 = new Items(
//     title: "Activity",
//     subtitle: "Rose favirited your Post",
//     event: "",
//     img: "assets/festival.png",
//   );
//   Items item5 = new Items(
//     title: "To do",
//     subtitle: "Homework, Design",
//     event: "4 Items",
//     img: "assets/todo.png",
//   );
//   Items item6 = new Items(
//     title: "Settings",
//     subtitle: "",
//     event: "2 Items",
//     img: "assets/setting.png",
//   );

//   @override
//   Widget build(BuildContext context) {
//     List<Items> myList = [item1, item2, item3, item4, item5, item6];
//     var color = 0xff453658;
//     return Flexible(
//       child: GridView.count(
//           childAspectRatio: 1.0,
//           padding: EdgeInsets.only(left: 16, right: 16),
//           crossAxisCount: 2,
//           crossAxisSpacing: 18,
//           mainAxisSpacing: 18,
//           children: myList.map((data) {
//             return Container(
//               decoration: BoxDecoration(
//                   color: Color(color), borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     data.img,
//                     width: 42,
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     data.title,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     data.subtitle,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.white38,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     data.event,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ],
//               ),
//             );
//           }).toList()),
//     );
//   }
// }

// class Items {
//   String title;
//   String subtitle;
//   String event;
//   String img;
//   Items({this.title, this.subtitle, this.event, this.img});
// }
