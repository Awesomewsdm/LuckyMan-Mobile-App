import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/bus_ticket_page.dart';
import 'package:angie_notebook/Screens/profile_screen.dart';
import 'package:angie_notebook/src/features/authentification/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/features/authentification/sign_up/widgets/sign_up_screen.dart';


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
                            () =>   const SignUpScreen(),
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
